package com.ohardas.evoting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.model.Votingstatus;
import com.ohardas.evoting.service.CandidateService;
import com.ohardas.evoting.service.VoterService;
import com.ohardas.evoting.service.VotingService;

@Controller
public class AdminController 
{
	@RequestMapping("adminpanel")
	public String adminPanel(HttpServletRequest request, HttpServletResponse response)
	{
		return "adminpanel";
	}
	
	
	
	@RequestMapping("adminlogin")
	public ModelAndView adminLogin(@RequestParam("adminid") String adminid,@RequestParam("adminpass") String adminpass,HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		if(adminid.equals("admin") && adminpass.equals("root"))
		{
			CandidateService cs=new CandidateService();
			List<Candidate> candidateList=cs.getCandList();
			HttpSession session=request.getSession();
			session.setAttribute("adminid",adminid);
			mv.addObject("candidateList", candidateList);
			mv.setViewName("adminpage");
			return mv;
		}
			
		else
		{
			mv.setViewName("adminpanel");
			return mv;
		}

	}
	@RequestMapping("adminlogout")
	public ModelAndView adminLogout(HttpServletRequest request, HttpServletResponse response)
	{
		HomeController hc=new HomeController();
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		session.removeAttribute("adminid");
		mv=hc.home(request, response);
		return mv;
	}
	
	@RequestMapping("enableVoting")
	public ModelAndView enableVoting(HttpServletRequest request, HttpServletResponse response)
	{
		VotingService vs=new VotingService();
		vs.enableVoting();
		ModelAndView mv = new ModelAndView();
		CandidateService cs=new CandidateService();
		List<Candidate> candidateList=cs.getCandList();
		mv.addObject("candidateList", candidateList);
		mv.setViewName("adminpage");
		return mv;
	}
	
	@RequestMapping("disableVoting")
	public ModelAndView disableVoting(HttpServletRequest request, HttpServletResponse response)
	{
		VotingService vs=new VotingService();
		vs.disableVoting();
		ModelAndView mv = new ModelAndView();
		CandidateService cs=new CandidateService();
		List<Candidate> candidateList=cs.getCandList();
		mv.addObject("candidateList", candidateList);
		mv.setViewName("adminpage");
		return mv;
	}
	
	@RequestMapping("generateResult")
	public ModelAndView generateResult(HttpServletRequest request, HttpServletResponse response)
	{
		VotingService vs=new VotingService();
		vs.publishResult();
		ModelAndView mv = new ModelAndView();
		CandidateService cs=new CandidateService();
		List<Candidate> candidateList=cs.getCandList();
		mv.addObject("candidateList", candidateList);
		mv.setViewName("adminpage");
		return mv;
	}
	
	@RequestMapping("clearResult")
	public ModelAndView clearResult(HttpServletRequest request, HttpServletResponse response)
	{
		VotingService vs=new VotingService();
		vs.removeResult();
		vs.disableVoting();
		
		CandidateService cs=new CandidateService();
		cs.deleteAllCandidates();
		
		VoterService vos=new VoterService();
		vos.deleteAllVoters();
		
		ModelAndView mv = new ModelAndView();
		
		List<Candidate> candidateList=cs.getCandList();
		mv.addObject("candidateList", candidateList);
		mv.setViewName("adminpage");
		return mv;
	}
	

}
