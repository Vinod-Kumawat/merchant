package com.merchant.merchant;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


@SpringBootApplication
public class MerchantApplication {


	public static void main(String[] args) {
		SpringApplication.run(MerchantApplication.class, args);
	}

}
