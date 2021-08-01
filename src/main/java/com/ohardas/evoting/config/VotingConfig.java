package com.ohardas.evoting.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({"com.ohardas.evoting.controller"})
public class VotingConfig implements WebMvcConfigurer
{
	@Bean
	public InternalResourceViewResolver viewResolver()
	{
		InternalResourceViewResolver vr = new InternalResourceViewResolver();
		
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
		vr.setExposeContextBeansAsAttributes(true);
		return vr;
	}
	
	
	public void addResourceHandlers(final ResourceHandlerRegistry registry) 
	{
	        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/","/resources/images");
	 }
	
}