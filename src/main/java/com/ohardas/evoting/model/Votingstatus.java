package com.ohardas.evoting.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Votingstatus 
{
	@Id
	private int id;
	private boolean canvote;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isCanvote() {
		return canvote;
	}
	public void setCanvote(boolean canvote) {
		this.canvote = canvote;
	}

}
