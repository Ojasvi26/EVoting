package com.ohardas.evoting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;


import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.service.CandidateService;
import com.ohardas.evoting.service.LoginService;


@Controller
public class CandidateController 
{
	@RequestMapping("/candidatelogin")
	public ModelAndView candidateProfile(@RequestParam("number") String number,@RequestParam("pass") String pass,HttpServletRequest request, HttpServletResponse response)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate where number="+number);
		
		Candidate candidate=new Candidate();
		try {
			candidate=(Candidate)q.uniqueResult();
		}
		catch(Exception e)
		{
			session.getTransaction().commit();
			session.close();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			mv.addObject("wrong2","Candidate Not Found");
			return mv;
		}
		
		session.getTransaction().commit();
		session.close();
		
		if(candidate==null)
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			mv.addObject("wrong2","Candidate Not Found");
			return mv;
		}
		
		ModelAndView mv = new ModelAndView();
		LoginService ls=new LoginService();
		boolean validated=ls.validate(number, pass, candidate.getNumber(), candidate.getPass());
		
		if(validated)
		{
			HttpSession httpsession=request.getSession();  
			httpsession.setAttribute("candid",candidate.getId());
			mv.setViewName("candidateprofile");
			mv.addObject("candObj",candidate);
		}
		else
		{
			mv.setViewName("index");
			mv.addObject("wrong2","Incorrect Candidate Password");
		}
		return mv;
	}
	
	@RequestMapping("/candregpage")
	public String candRegPage(HttpServletRequest request, HttpServletResponse response)
	{
		return("candsignup");
	}
	
	
	@RequestMapping("/candidatelogout")
	public ModelAndView candidateLogout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession httpsession=request.getSession(); 
		httpsession.removeAttribute("candid");
		HomeController hc=new HomeController();
		ModelAndView mv=new ModelAndView();
		mv=hc.home(request, response);
		return mv;
	}
	private static final String path ="/Users/ojasvihardas/eclipse-workspace/evoting/src/main/webapp/resources/images/candidate";
	@RequestMapping("registercandidate")
	public ModelAndView registerCandidate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("name") String name,@RequestParam("number") String number,@RequestParam("pass") String pass, 
			@RequestParam("mail") String mail, @RequestParam("party") String party,
			@RequestParam("agenda") String agenda, @RequestParam("about") String about, @RequestParam CommonsMultipartFile file) throws Exception
	{
		String ext = file.getContentType();
		String fname=name;
		int slash=ext.indexOf("/");
		String extension=ext.substring(slash+1);
		String filename=fname+"."+extension;
		
		System.out.println(filename);
		
		byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + filename)));  
	    stream.write(bytes);  
	    stream.flush();  
	    stream.close(); 
		
	    CandidateService cs=new CandidateService();
	    cs.addCand(name, mail, pass, about, number, agenda, party, filename);
	    
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		mv.addObject("wrong2","Candidate Registered Succesfully");
		return mv;
		
	}
	
	@RequestMapping(value="updatecandidate", method = RequestMethod.POST)
	public ModelAndView updateCandidate(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id,
			@RequestParam("name") String name,@RequestParam("number") String number,@RequestParam("pass") String pass, 
			@RequestParam("mail") String mail, @RequestParam("party") String party,
			@RequestParam("agenda") String agenda, @RequestParam("about") String about,@RequestParam("image") String image)
	{
		
		CandidateService cs=new CandidateService();
		cs.updateCand(id, name, mail, pass, about, number, agenda, party, image);
		Candidate candidate=cs.getCand(number);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("candidateprofile");
		mv.addObject("candObj",candidate);
		return mv;
		
	}
	
	
}


//private static final String path ="C:\\Users\\harsh\\eclipse-workspace\\Projects\\billing3\\src\\main\\webapp\\resources\\product";
//@RequestMapping(value="/addProduct",method = RequestMethod.POST)
//public ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response,@RequestParam("name") String name,@RequestParam("price") int price,
//		@RequestParam("quant") int quant,@RequestParam CommonsMultipartFile file) throws Exception
//{
//	
//	
//	String ext = file.getContentType();
//	String fname=name;
//	int slash=ext.indexOf("/");
//	String extension=ext.substring(slash+1);
//	String filename=fname+"."+extension;
//    byte[] bytes = file.getBytes();  
//    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + filename)));  
//    stream.write(bytes);  
//    stream.flush();  
//    stream.close(); 
//    
//    ModelAndView mv=new ModelAndView();
//    ProductService ps=new ProductService();
//	ps.addProduct(name, quant, price, filename);
//	List<Product> product=ps.getProductList();
//	mv.setViewName("adminpage");
//	mv.addObject("message","Product Deleted Succesfully");
//	mv.addObject("productList", product);
//	return mv;
//    
//}





