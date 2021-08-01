package com.ohardas.evoting.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.ohardas.evoting.model.Votingstatus;

public class VotingService 
{
	
	public void enableVoting()
	{
		Votingstatus votingstatus=new Votingstatus();
		
		votingstatus.setId(1);
		votingstatus.setCanvote(true);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(votingstatus);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public void disableVoting()
	{
		Votingstatus votingstatus=new Votingstatus();
		
		votingstatus.setId(1);
		votingstatus.setCanvote(false);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(votingstatus);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public boolean getVotingStatus()
	{
		
		int id=1;
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Votingstatus where id="+id);
		
		Votingstatus vs=(Votingstatus)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		return vs.isCanvote();
		
	}
	
	public void removeResult()
	{
		Votingstatus vs=new Votingstatus();
		vs.setId(2);
		vs.setCanvote(false);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(vs);
		
		session.getTransaction().commit();
		
		session.close();
	}
	
	public void publishResult()
	{
		
		Votingstatus vs=new Votingstatus();
		vs.setId(2);
		vs.setCanvote(true);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		session.update(vs);
		
		session.getTransaction().commit();
		
		session.close();
		
	}
	
	public boolean getResultStatus()
	{
		int id=2;
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Votingstatus.class);
		
		SessionFactory sf=con.buildSessionFactory();
		
		Session session=sf.openSession();
		
		session.beginTransaction();
		
		Query q=session.createQuery("from Votingstatus where id="+id);
		
		Votingstatus vs=(Votingstatus)q.uniqueResult();
		
		session.getTransaction().commit();
		
		session.close();
		
		return vs.isCanvote();
	}
	
	

}
