package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	
	@NonNull private String id;
	@NonNull private String pw;
	private String check_pw;
	@NonNull private String email;
	@NonNull private String mbti;
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public MemberDTO(String id, String pw, String email) {
		this.id = id;
		this.pw = pw;
		this.email = email;
	}

}
