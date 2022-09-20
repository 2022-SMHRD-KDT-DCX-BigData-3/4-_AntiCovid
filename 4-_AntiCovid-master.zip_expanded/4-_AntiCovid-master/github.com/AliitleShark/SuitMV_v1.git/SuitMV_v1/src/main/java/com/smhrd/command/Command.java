package com.smhrd.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	// request, response => 오버라이딩
	// abstract : 추상 한정자
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);

}
