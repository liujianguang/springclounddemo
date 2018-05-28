package com.gameley.common.Interceptor;


import com.alibaba.fastjson.JSONObject;
import com.gameley.common.msg.BaseResponse;
import com.gameley.common.util.ClientUtil;
import com.gameley.common.vo.LogInfo;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Arrays;

/**
 * 公共前端拦截器，处理日志和异常
 * Created by wwmxd on 2018/01/15.
 */
@Aspect
@Component
@ConditionalOnProperty(name = "elasticsearch",havingValue = "false")
public class HttpAspect {

    private final static Logger logger = LoggerFactory.getLogger(HttpAspect.class);

    private LogInfo logInfo;

    @SuppressWarnings("unchecked")
    @Pointcut("execution(public * com.gameley.controller.*.*(..)) && !@annotation(com.gameley.common.DisableGameleyLog))")
    public void log(){

    }

    @Pointcut("@annotation(com.gameley.common.EnableGameleyLog))")
    public void modifylog(){
    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        logInfo=new LogInfo();
        logInfo.setAddress(request.getRequestURL().toString());
        logInfo.setHttpMethod(request.getMethod());
        logInfo.setIp(ClientUtil.getClientIp(request));
        // 获取真实的ip地址
        logInfo.setClassMethod( joinPoint.getSignature().getDeclaringTypeName() + "."
                + joinPoint.getSignature().getName());
        logInfo.setArgs(Arrays.toString(joinPoint.getArgs()));

//        // 记录下请求内容
//        logger.info("请求地址 : " + request.getRequestURL().toString());
//        logger.info("HTTP METHOD : " + request.getMethod());
//        // 获取真实的ip地址
//        logger.info("IP : " + ClientUtil.getClientIp(request));
//        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "."
//                + joinPoint.getSignature().getName());
//        logger.info("参数 : " + Arrays.toString(joinPoint.getArgs()));
    }

    @Around("log()")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        try {
            long startTime = System.currentTimeMillis();
            Object ob= proceedingJoinPoint.proceed();
            logInfo.setTime(System.currentTimeMillis() - startTime);
//            logger.info("耗时 : " + (System.currentTimeMillis() - startTime));
            return ob;
        } catch (Exception e) {
            logInfo.setError(getExceptionAllinformation_01(e));
            logger.error(JSONObject.toJSONString(logInfo));
//            logger.error("error:",e);
            return new BaseResponse(500,"后台操作异常");

        }


    }

    @AfterReturning(pointcut = "log()",returning = "object")//打印输出结果
    public void doAfterReturing(Object object){
        logInfo.setResult(object.toString());
        logger.info(JSONObject.toJSONString(logInfo));
//        logger.info("response={}",object.toString());


    }

    public static String getExceptionAllinformation_01(Exception ex) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PrintStream pout = new PrintStream(out);
        ex.printStackTrace(pout);
        String ret = new String(out.toByteArray());
        pout.close();
        try {
            out.close();
        } catch (Exception e) {
        }
        return ret;
    }
}
