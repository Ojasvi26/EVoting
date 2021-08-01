package com.ohardas.evoting.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.web.servlet.ModelAndView;

import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.model.Voter;
import com.ohardas.evoting.model.Votingstatus;

public class Driver 
{

	public static void main(String[] args) 
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate order by votes desc");
		List<Candidate> candidate=q.list();
		
		session.getTransaction().commit();
		
		session.close();
		
		
		for(Candidate c: candidate)
		{
			System.out.println(
			c.getImage()+ " "+
			c.getVotes()+ " "+
			c.getName() + " "+
			c.getParty());
		}
		
		
//		String number="1234567890";
//		
//		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
//		
//		SessionFactory sf=con.buildSessionFactory();
//		
//		Session session=sf.openSession();
//		
//		session.beginTransaction();
//		
//		Query q=session.createQuery("from Voter where number="+number);
//		
//		Voter voter=new Voter();
//		try {
//			voter=(Voter)q.uniqueResult();
//		}
//		catch(Exception e)
//		{
//			session.getTransaction().commit();
//			session.close();
//			
//		}
//		
//		session.getTransaction().commit();
//		session.close();
//		
//		System.out.println(voter.getName());
//		System.out.println(voter.getId());
		
//		
//		Votingstatus votingstatus=new Votingstatus();
//		
//		votingstatus.setId(1);
//		votingstatus.setCanvote(false);
//		
//		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
//		
//		SessionFactory sf=con.buildSessionFactory();
//		
//		Session session=sf.openSession();
//		
//		session.beginTransaction();
//		
//		session.update(votingstatus);
//		
//		session.getTransaction().commit();
//		
//		session.close();
//		
//		int id=1;
//		
//		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
//		
//		SessionFactory sf=con.buildSessionFactory();
//		
//		Session session=sf.openSession();
//		
//		session.beginTransaction();
//		
//		Query q=session.createQuery("from Candidate where id="+id);
//		
//		Candidate candidate=(Candidate)q.uniqueResult();
//		
//		session.getTransaction().commit();
//		
//		session.close();
//		
//		int votes=candidate.getVotes();
//		candidate.setVotes(++votes);
//		
//		session=sf.openSession();
//		
//		session.beginTransaction();
//		
//		session.update(candidate);
//		
//		session.getTransaction().commit();
//		
//		session.close();
//		Voter voter=new Voter();
//		
//		voter.setName("Ojasvi");
//		voter.setNumber("7354952106");
//		voter.setMail("ojasvi26@gmail.com");
//		voter.setImage("456.jpg");
//		voter.setPswd("voter");
//		voter.setVoted(false);
//		
//		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
//		
//		SessionFactory sf=con.buildSessionFactory();
//		
//		Session session=sf.openSession();
//		
//		session.beginTransaction();
//		
//		session.save(voter);
//		
//		session.getTransaction().commit();
//		
//		session.close();
		

	}

}
