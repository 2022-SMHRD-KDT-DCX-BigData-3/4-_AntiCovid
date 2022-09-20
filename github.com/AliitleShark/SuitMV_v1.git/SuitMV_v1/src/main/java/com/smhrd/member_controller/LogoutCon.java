package com.smhrd.member_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;

public class LogoutCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 로그아웃 기능 : 로그인 정보 삭제
		HttpSession session = request.getSession(true);
		session.removeAttribute("login_info"); // -> 특정세션 종료
		// session.invalidate(); // -> 전체세션 종료
		
		return "Login.jsp";
	}

}
