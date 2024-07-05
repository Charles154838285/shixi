package com.framework;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = {"com.framework.**.mapper"})
public class BootSSmRbacApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootSSmRbacApplication.class, args);
    }

}
