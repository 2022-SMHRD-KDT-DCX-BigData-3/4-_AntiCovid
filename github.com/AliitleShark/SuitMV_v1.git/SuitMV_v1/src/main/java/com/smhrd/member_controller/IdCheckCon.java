package com.smhrd.member_controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.MemberDAO;

public class IdCheckCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 아이디 중복확인 기능
		// : 사용자가 입력한 id를 받아와서 해당 id이 db에 있는지 없는지 체크
		
		// 데이터 받아오기
		String check_id = request.getParameter("check_id");
		System.out.println("check_id : "+check_id);
		
		// MemberDAO에 정보 보내기
		boolean result = new MemberDAO().idCheck(check_id);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
