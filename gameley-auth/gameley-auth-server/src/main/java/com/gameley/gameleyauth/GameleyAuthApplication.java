package com.gameley.gameleyauth;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;


/**
 * 由于spring-data-elasticsearch只支持到5.5，暂不使用
 */
@SpringBootApplication   //(exclude = {ElasticsearchAutoConfiguration.class, ElasticsearchDataAutoConfiguration.class})
@EnableDiscoveryClient
@EnableFeignClients
public class GameleyAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(GameleyAuthApplication.class, args);
	}
}
