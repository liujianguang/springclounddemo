//package com.gameley.common.Interceptor;
//
//
//import com.gameley.common.msg.BaseResponse;
//import com.gameley.common.util.ClientUtil;
//import com.gameley.common.vo.LogInfo;
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.*;
//import org.elasticsearch.action.index.IndexResponse;
//import org.elasticsearch.action.update.UpdateRequest;
//import org.elasticsearch.client.transport.TransportClient;
//import org.elasticsearch.common.xcontent.XContentBuilder;
//import org.elasticsearch.common.xcontent.XContentFactory;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.IOException;
//import java.util.Arrays;
//
///**
// * 公共前端拦截器，处理日志和异常
// * Created by wwmxd on 2018/01/15.
// */
//@Aspect
//@Component
//@ConditionalOnProperty(name = "elasticsearch",havingValue = "true")
//public class HttpElkAspect {
//
//    private final static Logger logger = LoggerFactory.getLogger(HttpElkAspect.class);
//
//    @Autowired
//    private TransportClient ElkClient;
//
//    private LogInfo logInfo;
//
//    @SuppressWarnings("unchecked")
//    @Pointcut("execution(public * com.gameley.controller.*.*(..)) && !@annotation(com.gameley.common.DisableGameleyLog))")
//    public void log(){
//
//    }
//
//    @Before("log()")
//    public void doBefore(JoinPoint joinPoint){
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request = attributes.getRequest();
//        logInfo=new LogInfo();
//        logInfo.setAddress(request.getRequestURL().toString());
//        logInfo.setHttpMethod(request.getMethod());
//        logInfo.setIp(ClientUtil.getClientIp(request));
//        // 获取真实的ip地址
//        logInfo.setClassMethod( joinPoint.getSignature().getDeclaringTypeName() + "."
//                + joinPoint.getSignature().getName());
//        logInfo.setArgs(Arrays.toString(joinPoint.getArgs()));
//        insert(logInfo);
//
//    }
//
//    @Around("log()")
//    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
//        try {
//            long startTime = System.currentTimeMillis();
//            Object ob= proceedingJoinPoint.proceed();
//            logInfo.setTime(System.currentTimeMillis() - startTime);
//            update(logInfo);
//            return ob;
//        } catch (Exception e) {
//            logInfo.setError(e.getMessage());
//            update(logInfo);
//            return new BaseResponse(500,"后台操作异常");
//
//        }
//
//
//    }
//
//    @AfterReturning(pointcut = "log()",returning = "object")//打印输出结果
//    public void doAfterReturing(Object object){
//        logInfo.setResult(object.toString());
//        update(logInfo);
//
//    }
//
//
//
//    private void update(LogInfo logInfo){
//        try {
//            UpdateRequest request = new UpdateRequest("springlog", "log", logInfo.getId());
//            XContentBuilder builder = XContentFactory.jsonBuilder().startObject();
//            builder .field("address", logInfo.getAddress())
//                    .field("httpmethod", logInfo.getHttpMethod())
//                    .field("ip", logInfo.getIp())
//                    .field("classmethod", logInfo.getClassMethod())
//                    .field("args",logInfo.getArgs())
//                    .field("time",logInfo.getTime())
//                    .field("error",logInfo.getError())
//                    .field("result",logInfo.getResult()).endObject();
//            request.doc(builder);
//            ElkClient.update(request);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    private void insert(LogInfo logInfo){
//        try {
//            XContentBuilder builder = XContentFactory.jsonBuilder().startObject()
//                    .field("address", logInfo.getAddress())
//                    .field("httpmethod", logInfo.getHttpMethod())
//                    .field("ip", logInfo.getIp())
//                    .field("classmethod", logInfo.getClassMethod())
//                    .field("args",logInfo.getArgs())
//                    .endObject();
//            IndexResponse response = ElkClient.prepareIndex("springlog", "log")
//                    .setSource(builder).get();
//            logInfo.setId(response.getId());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//}
