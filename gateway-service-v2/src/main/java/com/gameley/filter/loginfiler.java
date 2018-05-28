package com.gameley.filter;

import com.alibaba.fastjson.JSONObject;
import com.gameley.bean.Audience;
import com.gameley.bean.JwtInfo;
import com.gameley.common.msg.BaseResponse;
import com.gameley.common.msg.auth.TokenForbiddenResponse;
import com.gameley.utils.JwtHelper;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.List;

@EnableConfigurationProperties(Audience.class)
@Slf4j
@Configuration
public class loginfiler implements GlobalFilter {


    @Value("${gate.ignore.startWith}")
    private String startWith;

    @Autowired
    private  Audience audience;



    @Override
    public Mono<Void> filter(ServerWebExchange serverWebExchange, GatewayFilterChain gatewayFilterChain) {
        log.info("check token and user permission....");
        ServerHttpRequest request = serverWebExchange.getRequest();
        final String requestUri = request.getPath().pathWithinApplication().value();
        ServerHttpRequest.Builder mutate = request.mutate();
        // 不进行拦截的地址
        if (isStartWith(requestUri)) {
            ServerHttpRequest build = mutate.build();
            return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
        }
        List<String> tokens=request.getHeaders().get("token");
        List<String> clients=request.getHeaders().get("client");
        if(tokens==null||clients==null){
            return getVoidMono(serverWebExchange, new TokenForbiddenResponse("User Token Has Not Exits!"));
        }
        String token=tokens.get(0);
        String client=clients.get(0);
        try {
            JwtInfo jwtInfo=new JwtInfo();
            jwtInfo.setToken(token);
            jwtInfo.setClientId(audience.getClientId());
            jwtInfo.setExpiresSecond(audience.getExpiresSecond());
            jwtInfo.setName(audience.getName());
            JwtHelper jwtHelper=new JwtHelper();
            jwtHelper.setJwtInfo(jwtInfo);
            Claims claims = jwtHelper.parseJWT(token, audience.getBase64Secret());
            Claims clientClaims = jwtHelper.parseJWT(client, audience.getClient64Secret());
            if(claims==null||clientClaims==null){
                /**
                 * 暂不使用后台自动刷新，改为前端页面定时自动拉取刷新
                 */
                return getVoidMono(serverWebExchange, new TokenForbiddenResponse("User Token Forbidden or Expired!"));
//                String refreshToken=jwtInfo.getToken();
//                ctx.addZuulRequestHeader("token",refreshToken);
//                ctx.addZuulResponseHeader("token",refreshToken);
            }else {
                mutate.header("token",token);
            }

        } catch (Exception e) {
            return getVoidMono(serverWebExchange, new TokenForbiddenResponse("User Forbidden!Does not has Permission!"));
        }

        ServerHttpRequest build = mutate.build();

        return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());

    }


    /**
     * URI是否以什么打头
     *
     * @param requestUri
     * @return
     */
    private boolean isStartWith(String requestUri) {
        boolean flag = false;
        for (String s : startWith.split(",")) {
            if (requestUri.startsWith(s)) {
                return true;
            }
        }
        return flag;
    }
    /**
     * 网关抛异常
     *
     * @param body
     */
    @NotNull
    private Mono<Void> getVoidMono(ServerWebExchange serverWebExchange, BaseResponse body) {
        serverWebExchange.getResponse().setStatusCode(HttpStatus.OK);
        byte[] bytes = JSONObject.toJSONString(body).getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = serverWebExchange.getResponse().bufferFactory().wrap(bytes);
        return serverWebExchange.getResponse().writeWith(Flux.just(buffer));
    }

}
