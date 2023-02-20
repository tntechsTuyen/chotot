package com.market.online.config.scheduler;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class SchedulerConfig {

    @Scheduled(fixedDelay = 300000, initialDelay = 300000) //300000
    public void updateAutoCancelOrder(){

    }
}
