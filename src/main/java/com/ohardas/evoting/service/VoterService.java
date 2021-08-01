package com.ohardas.evoting.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;


import com.ohardas.evoting.model.Voter;

public class VoterService 
{
	public void addVoter(String name, String number, String mail,String pass)
	{
		Voter voter=new Voter();
		
		voter.setName(name);
		voter.setNumber(number);
		voter.setMail(mail);
		voter.setPass(pass);
		voter.setVoted(false);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.save(voter);
		
		session.getTransaction().commit();
		
		session.close();
	}
	
	
	
	public Voter getVoter(int number)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Voter where number="+number);
		
		Voter voter=(Voter)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		return voter;
	}
	
	public void voted(int id)
	{
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Voter where id="+id);
		
		Voter voter=(Voter)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		voter.setVoted(true);
		
		session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(voter);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public void deleteAllVoters()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Voter.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("delete from Voter");
		
		q.executeUpdate();
		
		session.getTransaction().commit();
		
		session.close();
	}

}
