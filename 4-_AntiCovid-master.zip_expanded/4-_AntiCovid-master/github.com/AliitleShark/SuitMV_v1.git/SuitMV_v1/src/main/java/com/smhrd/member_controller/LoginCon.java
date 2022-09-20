package com.smhrd.member_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class LoginCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 로그인기능 : 사용자가 입력한 id, pw를 받아와서 테이블에 있는지 없는지 확인
		
		// 데이터 받아오기
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		
		// DTO로 묶기
		MemberDTO dto = new MemberDTO(id, pw);
		
		// 로그인 메소드 실행해서 회원정보불러오기
		MemberDTO login_info = new MemberDAO().login(dto);
		

		// 성공실패 여부
		if(login_info != null) {
			System.out.println("로그인 성공!");
			try {
				PrintWriter out = response.getWriter();
				out.print("true");
			} catch (IOException e) {}
			
			
			// session에 로그인 정보 유지
			HttpSession session = request.getSession();
			session.setAttribute("login_info", login_info);
		} else {
			System.out.println("로그인 실패!");
			
			
		}
		
		return null;
	}

}
