package com.gameley.common.LogConfig;

import com.gameley.service.OperatelogService;
import com.gameley.service.impl.OperatelogServiceImpl;
import org.springframework.context.annotation.Bean;

public class ModifyAutoConfig {

    @Bean
    public OperatelogService operatelogService(){
        return new OperatelogServiceImpl();
    }



}
