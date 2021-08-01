package com.ohardas.evoting.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class MyDipatcherServlet extends AbstractAnnotationConfigDispatcherServletInitializer
{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {VotingConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};	}

}
