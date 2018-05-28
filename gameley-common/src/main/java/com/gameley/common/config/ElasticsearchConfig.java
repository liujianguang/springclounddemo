//package com.gameley.common.config;
//
//
//import org.elasticsearch.client.transport.TransportClient;
//import org.elasticsearch.common.settings.Settings;
//import org.elasticsearch.common.transport.TransportAddress;
//import org.elasticsearch.transport.client.PreBuiltTransportClient;
//import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.net.InetAddress;
//import java.net.UnknownHostException;
//
//@Configuration
//@ConditionalOnProperty(name = "elasticsearch",havingValue = "true")
//public class ElasticsearchConfig {
//    @Bean
//    public TransportClient TransportClient() throws UnknownHostException {
//
//        //设置名字
//        Settings settings = Settings.builder().put("cluster.name","elasticsearch").build();
//
//        TransportClient client =  new PreBuiltTransportClient(settings);
//        client.addTransportAddress(new TransportAddress( InetAddress.getByName("localhost"),9300));
//        return client;
//    }
//
////    @Bean
////    public FilterRegistrationBean someFilterRegistration() {
////        FilterRegistrationBean registration = new FilterRegistrationBean();
////        registration.setFilter(new HttpPutFormContentFilter());
////        registration.addUrlPatterns("/*");
////        registration.setName("HttpMethodFilter");
////        return registration;
////    }
//
//}
