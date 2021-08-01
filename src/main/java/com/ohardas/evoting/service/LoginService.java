package com.ohardas.evoting.service;

public class LoginService 
{
	public boolean validate(String username, String password, String pname, String ppass)
	{
		System.out.println(username+" "+password+" "+pname+" "+ppass);
		if(username.equals(pname) && password.equals(ppass))
			return true;
		else
			return false;
	}
}
