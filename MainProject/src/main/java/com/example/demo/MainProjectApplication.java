package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
//test
@SpringBootApplication
@ComponentScan({"fpro.data.*","com.example.demo"})
@MapperScan("fpro.data.*")
public class MainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MainProjectApplication.class, args);
	}

}
