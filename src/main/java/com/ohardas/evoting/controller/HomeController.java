package com.ohardas.evoting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.service.CandidateService;
import com.ohardas.evoting.service.VotingService;

@Controller
public class HomeController 
{
		@RequestMapping({"/","home"})
		public ModelAndView home(HttpServletRequest request, HttpServletResponse response)
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			VotingService vs=new VotingService();
			boolean canVote=vs.getVotingStatus();
			HttpSession session=request.getSession();
			session.setAttribute("canvote", canVote);
			return mv;
		}
		
		@RequestMapping("/votersignup")
		public String voterSignup(HttpServletRequest request, HttpServletResponse response)
		{
			return "votersignup";
		}
		
		@RequestMapping("/register")
		public String registerUser(HttpServletRequest request, HttpServletResponse response)
		{
			return "register";
		}
		
		@RequestMapping("/candidatelist")
		public ModelAndView getCandidatesList(HttpServletRequest request, HttpServletResponse response)
		{
			ModelAndView mv=new ModelAndView();
			CandidateService cs=new CandidateService();
			List<Candidate> candList=cs.getCandList();
			mv.addObject("candidateList", candList);
			mv.setViewName("candidatelist");
			return mv;
		}
		
		@RequestMapping("/results")
		public ModelAndView results(HttpServletRequest request, HttpServletResponse response)
		{
			ModelAndView mv=new ModelAndView();
			VotingService vs=new VotingService();
			boolean res=vs.getResultStatus();
			if(!res)
			{
				mv.setViewName("noresult");
				return mv;
			}
			else
			{
				CandidateService cs=new CandidateService();
				List<Candidate> candList=cs.getResult();
				mv.addObject("candidateList", candList);
				mv.setViewName("results");
				return mv;
			}
			
			
		}
		
		@RequestMapping("/about")
		public String about(HttpServletRequest request, HttpServletResponse response)
		{
			return "about";
		}

}
