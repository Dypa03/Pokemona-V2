package com.teambuilder_service;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class TeambuilderServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeambuilderServiceApplication.class, args);
	}

}
