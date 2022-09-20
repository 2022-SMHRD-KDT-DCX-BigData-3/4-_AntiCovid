package com.smhrd.member_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class UpdateCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 회원정보 수정 기능
		
		// 데이터 받아오기
		HttpSession session = request.getSession();
		MemberDTO login_info = (MemberDTO) session.getAttribute("login_info");
		
		String id = login_info.getId();
		String pw = request.getParameter("update_pw");
		String check_pw = request.getParameter("update_check_pw");
		String email = request.getParameter("update_email");
		String mbti = request.getParameter("update_mbti");
		
		if(pw.equals(check_pw)) {
			// MemberDTO로 묶기
			MemberDTO dto = new MemberDTO(id, pw, email, mbti);
			
			// MemberDAO로 보내기
			int row = new MemberDAO().update(dto);
			
			// 성공/실패 확인
			if(row > 0) {
				System.out.println("회원정보 수정 성공!");
				// session에 수정된 로그인 정보 유지
				session.setAttribute("login_info", dto);
			} else {
				System.out.println("회원정보 수정 실패!");
			}
			
		}
		
		return "Index.jsp";
	}

}
