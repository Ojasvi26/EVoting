package com.ohardas.evoting.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Candidate 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false, nullable = false)
	private int id;
	
	private String name;
	private String mail;
	private String pass;
	private String about;
	private String number;
	private String agenda;
	private String party;
	private String image;
	private int votes;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getAgenda() {
		return agenda;
	}
	public void setAgenda(String agenda) {
		this.agenda = agenda;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getVotes() {
		return votes;
	}
	public void setVotes(int votes) {
		this.votes = votes;
	}
	
	
}


//CREATE TABLE `candidate` (
//		  `id` int NOT NULL AUTO_INCREMENT,
//		  `name` varchar(45) NOT NULL,
//		  `mail` varchar(45) NOT NULL,
//		  `pswd` varchar(45) NOT NULL,
//		  `about` varchar(45) NOT NULL,
//		  `number` varchar(45) NOT NULL,
//		  `agenda` varchar(45) NOT NULL,
//		  `pname` varchar(45) NOT NULL,
//		  `image` varchar(45) NOT NULL,
//		  PRIMARY KEY (`id`),
//		  UNIQUE KEY `id_UNIQUE` (`id`)
//		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
