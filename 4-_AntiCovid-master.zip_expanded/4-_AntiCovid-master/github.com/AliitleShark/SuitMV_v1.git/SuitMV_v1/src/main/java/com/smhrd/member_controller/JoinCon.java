package com.smhrd.member_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;


public class JoinCon implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("test");
		
		// 데이터 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String check_pw = request.getParameter("check_pw");
		String email = request.getParameter("email");
		String mbti = request.getParameter("mbti");
		
		if(pw.equals(check_pw)) {
			// DTO로 묶기
			MemberDTO dto = new MemberDTO(id, pw, email, mbti);
			
			// DAO 회원가입 메소드 실행
			int row = new MemberDAO().join(dto);
			
			// 성공실패 판단 후 페이지 이동	
			if(row > 0) {
				System.out.println("회원가입 성공!");
				// id값 저장해놓기
				request.setAttribute("id", id);
			} else {
				System.out.println("회원가입 실패!");
			}
			
		}else {
			System.out.println("Password가 동일하지 않습니다.");
		}
		
		// 페이지 이동
		return "Login.jsp";
	}

}
