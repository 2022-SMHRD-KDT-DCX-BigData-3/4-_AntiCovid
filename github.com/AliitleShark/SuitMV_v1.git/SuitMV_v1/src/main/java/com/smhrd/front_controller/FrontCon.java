package com.smhrd.front_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.member_controller.IdCheckCon;
import com.smhrd.member_controller.JoinCon;
import com.smhrd.member_controller.LoginCon;
import com.smhrd.member_controller.LogoutCon;
import com.smhrd.member_controller.UpdateCon;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 어디서 요청이 들어왔는지 확인
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		// 프로젝트 이름 확인
		String project = request.getContextPath();
		System.out.println(project);
		
		// 문자열 잘라내기 substring
		String requestURI = uri.substring(project.length()+1);
		System.out.println(requestURI);
		
		// 업캐스팅
		Command con = null;
		
		// 서블릿 컨트롤러 => FrontCon에 합치기 => Command 인터페이스(매개변수 선언) + 클래스 컨트롤러로 나누기
		// Con.do 나열
		if(requestURI.equals("JoinCon.do")) {
			con = new JoinCon();
		}else if(requestURI.equals("LoginCon.do")) {
			con = new LoginCon();
		}else if(requestURI.equals("UpdateCon.do")) {
			con = new UpdateCon();
		}else if(requestURI.equals("LogoutCon.do")) {
			con = new LogoutCon();
		}else if(requestURI.equals("IdCheckCon.do")) {
			con = new IdCheckCon();
		}
		
		
		// moveURL로 페이지 이동
		String moveURL = con.execute(request, response);
		
		if(moveURL != null) {
			RequestDispatcher rd = request.getRequestDispatcher(moveURL);
			rd.forward(request, response);
		}
		
		
	}

}
