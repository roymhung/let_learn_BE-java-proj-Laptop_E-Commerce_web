package com.example.BE_java_proj_Laptop_E_Commerce_web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(
		exclude = {SecurityAutoConfiguration.class, ManagementWebSecurityAutoConfiguration.class})
public class BeJavaProjLaptopECommerceWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(BeJavaProjLaptopECommerceWebApplication.class, args);
	}

}
