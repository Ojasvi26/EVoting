package com.ohardas.evoting.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.ohardas.evoting.model.Candidate;
import com.ohardas.evoting.model.Voter;

public class CandidateService 
{
	
	public Candidate getCand(String number)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate where number="+number);
		
		Candidate candidate=(Candidate)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		return candidate;
	}
	
	public List<Candidate> getCandList()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate");
		List<Candidate> candidate=q.list();
		
		session.getTransaction().commit();
		
		session.close();
		
		return candidate;
	}
	
	
	public void addCand(String name, String mail, String pass,String about, String number, String agenda, String party, String image)
	{
		Candidate candidate=new Candidate();
		
		candidate.setName(name);
		candidate.setMail(mail);
		candidate.setAbout(about);
		candidate.setParty(party);
		candidate.setPass(pass);
		candidate.setNumber(number);
		candidate.setAgenda(agenda);
		candidate.setImage(image);
		candidate.setVotes(0);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.save(candidate);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public void voteCand(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate where id="+id);
		
		Candidate candidate=(Candidate)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		int votes=candidate.getVotes();
		candidate.setVotes(++votes);
		
		session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(candidate);
		
		session.getTransaction().commit();
		
		session.close();
		
		
	}
	
	public void updateCand(int id,String name, String mail, String pass,String about, String number, String agenda, String party, String image)
	{
		Candidate candidate=new Candidate();
		candidate.setId(id);
		candidate.setName(name);
		candidate.setMail(mail);
		candidate.setAbout(about);
		candidate.setParty(party);
		candidate.setPass(pass);
		candidate.setNumber(number);
		candidate.setAgenda(agenda);
		candidate.setImage(image);
		candidate.setVotes(0);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(candidate);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public List<Candidate> getResult()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Candidate order by votes desc");
		List<Candidate> result=q.list();
		
		session.getTransaction().commit();
		
		session.close();
		
		return result;
	}
	
	
	public void deleteAllCandidates()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Candidate.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("delete from Candidate");
		
		q.executeUpdate();
		
		session.getTransaction().commit();
		
		session.close();
	}

}
