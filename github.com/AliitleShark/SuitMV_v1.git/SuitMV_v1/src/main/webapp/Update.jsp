<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Update.css">
<script src="./jquery-3.6.0.js"></script>

</head>
<body>
	<div class="nav" id="nav">
		<a href="./Index.jsp"><img src="./img/textlogo.png" alt=""
			class="nav_logo"></a>
		<div class="nav_right">
			<!-- 검색페이지 이동 -->
			<div class="search">
				<a href="http://172.30.1.73:8501"><img src="./img/search.png"
					width="38px" height="34px"></a>
			</div>

			<!-- 장르페이지 이동 -->
			<div class="genre">
				<a href="Genre.jsp">장르</a>
			</div>

			<!-- 회원정보수정 페이지 이동 -->
			<div class="update">
				<a href="Update.jsp">회원정보수정</a>
			</div>

			<div class="logout">
				<a href="LogoutCon.do">로그아웃</a>
			</div>

		</div>
	</div>

	<div class="form">
		<div class="form-toggle"></div>
		<div class="form-panel one">
			<div class="form-header">
				<h1>Update</h1>
			</div>
			<div class="form-content">
				<form action="UpdateCon.do" method="post">

					<div class="form-group">
						<label for="password">New Password</label> <input type="password"
							id="password" name="update_pw" required="required" />
					</div>
					<div class="form-group">
						<label for="cpassword">Confirm New Password</label> <input
							type="password" id="cpassword" name="update_check_pw"
							required="required" />
					</div>
					<div class="form-group">
						<label for="email">New Email Address</label> <input type="email"
							id="email" name="update_email" required="required" />
					</div>
					<div class="form-group">
						<label for="email">New Mbti</label> <select name="update_mbti"
							id="mbti" class="Mbti">
							<option value="none">============= 선택 =============</option>
							<option value="ENTJ">ENTJ</option>
							<option value="ENFP">ENFP</option>
							<option value="ENFJ">ENFJ</option>
							<option value="ENTP">ENTP</option>
							<option value="ESFP">ESFP</option>
							<option value="ESFJ">ESFJ</option>
							<option value="ESTP">ESTP</option>
							<option value="ESTJ">ESTJ</option>
							<option value="INFJ">INFJ</option>
							<option value="INTJ">INTJ</option>
							<option value="INFP">INFP</option>
							<option value="INTP">INTP</option>
							<option value="ISFP">ISFP</option>
							<option value="ISFJ">ISFJ</option>
							<option value="ISTP">ISTP</option>
							<option value="ISTJ">ISTJ</option>
						</select>
					</div>
					<div class="form-group">
						<button type="submit">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="pen-footer">
		<a href="https://www.naver.com" target="_blank"><i
			class="material-icons">arrow_backward</i>View on Behance</a><a
			href="https://www.naver.com" target="_blank">View on Github<i
			class="material-icons">arrow_forward</i></a>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							var panelOne = $('.form-panel.two').height(), panelTwo = $('.form-panel.two')[0].scrollHeight;

							$('.form-panel.two').not('.form-panel.two.active')
									.on(
											'click',
											function(e) {
												e.preventDefault();

												$('.form-toggle').addClass(
														'visible');
												$('.form-panel.one').addClass(
														'hidden');
												$('.form-panel.two').addClass(
														'active');
												$('.form').animate({
													'height' : panelTwo
												}, 200);
											});

							$('.form-toggle').on('click', function(e) {
								e.preventDefault();
								$(this).removeClass('visible');
								$('.form-panel.one').removeClass('hidden');
								$('.form-panel.two').removeClass('active');
								$('.form').animate({
									'height' : panelOne
								}, 200);
							});
						});
	</script>


</body>
</html>