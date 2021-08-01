package com.ohardas.evoting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.model.Voter;
import com.ohardas.evoting.service.CandidateService;
import com.ohardas.evoting.service.LoginService;
import com.ohardas.evoting.service.VoterService;


@Controller
public class VoterController 
{
	@RequestMapping("registervoter")
	public ModelAndView voterRegister(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("name") String name,@RequestParam("number") String number,
			@RequestParam("mail") String mail, @RequestParam("pass") String pass )
	{
		VoterService vs=new VoterService();
		vs.addVoter(name, number, mail,pass);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		mv.addObject("wrong","User Registered Succefully");
		return mv;
	}
	
	
	@RequestMapping({"voterlogin","givevote/voterlogin"})
	public ModelAndView voterLogin(@RequestParam("number") String number,@RequestParam("voterpass") String userpass,HttpServletRequest request, HttpServletResponse response)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Voter where number="+number);
		
		Voter voter=new Voter();
		try {
			voter=(Voter)q.uniqueResult();
		}
		catch(Exception e)
		{
			session.getTransaction().commit();
			session.close();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			mv.addObject("wrong","User Not Found");
			return mv;
		}
		
		session.getTransaction().commit();
		session.close();
		
		if(voter==null)
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			mv.addObject("wrong","User Not Found");
			return mv;
		}
		
		if(voter.isVoted())
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			mv.addObject("wrong","Your have already voted.");
			return mv;
		}
		ModelAndView mv = new ModelAndView();
		
		LoginService ls=new LoginService();
		boolean validated=ls.validate(number, userpass, voter.getNumber(), voter.getPass());
		
		if(validated)
		{
			CandidateService cs=new CandidateService();
			List<Candidate> candidate=cs.getCandList();
			HttpSession httpsession=request.getSession();  
			httpsession.setAttribute("voterid",voter.getId());
			mv.setViewName("uservoting");
			mv.addObject("candidateList",candidate);
		}
		else
		{
			mv.setViewName("index");
			mv.addObject("wrong","Incorrect Password");
		}
		return mv;
	}
		
	@RequestMapping("givevote/{argument}")
	public ModelAndView giveVote(HttpServletRequest request, HttpServletResponse response,@PathVariable("argument") int id)
	{
		CandidateService cs=new CandidateService();
		cs.voteCand(id);
		HttpSession httpsession=request.getSession();  
		int vid=(Integer) httpsession.getAttribute("voterid");
		VoterService vs=new VoterService();
		vs.voted(vid);
		httpsession.removeAttribute("voterid");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("wrong","Your vote has been Registered");
		return mv;
		
	}
	@RequestMapping("/voterlogout")
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response)
	{
		HomeController hc=new HomeController();
		ModelAndView mv=new ModelAndView();
		mv=hc.home(request, response);
		return mv;
	}

}
