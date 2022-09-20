<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Login.css">
<script src="./js/jquery-3.6.0.js"></script>
<script src="./js/Login.js"></script>
</head>
<body>
	<div class="form">
		<div class="form-toggle"></div>
		<div class="form-panel one">
			<div class="form-header">
				<h1>Account Login</h1>
			</div>
			<!--  Menu bar -->
			<!--  Menu bar -->
			<!--  Menu bar -->
			
			<div class="form-content">
				<form action="LoginCon.do" method="post">
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							id="username" name="id" required="required" />
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							id="password" name="pw" required="required" />
					</div>
					<div class="form-group">
						<label class="form-remember"> <input type="checkbox"
							id="saveID" />Remember Me
						</label><a class="form-recovery" href="#">Forgot Password?</a>
					</div>
					<div class="form-group">
						<button type="button" id="loginCheck_btn" onclick="loginCheck()">Log
							In</button>
					</div>
				</form>
			</div>
		</div>
		<div class="form-panel two">
			<div class="form-header">
				<h1>Register Account</h1>
			</div>
			<div class="form-content">
				<form action="JoinCon.do" method="post">
					<div class="form-group" style="position: relative;">
						<label for="username">Username</label> <input type="text"
							id="username" name="id" required="required" />
						<button
							style="position: absolute; width: 90px; font-size: 1px; padding: 1px; bottom: 17%; right: 0"
							id="idCheck_btn" type="button">아이디 중복체크</button>

					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							id="password" name="pw" required="required" />
					</div>
					<div class="form-group">
						<label for="cpassword">Confirm Password</label> <input
							type="password" id="cpassword" name="check_pw"
							required="required" />
					</div>
					<div class="form-group">
						<label for="email">Email Address</label> <input type="email"
							id="email" name="email" required="required" />
					</div>
					<div class="form-group">
						<label for="email">Mbti</label> <select name="mbti" id="mbti"
							class="Mbti">
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
						<!-- 버튼 클릭시 JoinCon.java로 안가져서 onclick으로 수정함 -->
						<button type="submit" onclick="form.submit()">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="pen-footer">
		<a href="https://www.naver.com" target="_blank"><i
			class="material-icons">arrow_backward</i>View on Behance</a> <a
			href="https://www.naver.com" target="_blank">View on Github<i
			class="material-icons">arrow_forward</i></a>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>


	<!-- 아이디 중복체크 ajax -->
	<script type="text/javascript">
		// 아이디 중복체크 버튼을 눌렀을 때!
		$('#idCheck_btn').on('click', function() {
			// 사용자가 입력한 id 가져오기
			// input태그인데 name = id인 요소의 값을 가져올 것.
			// 2개(로그인, 회원가입)이기 때문에 인덱스 번호 사용해서 회원가입(두번째)에 있는 요소의 값을 가져올 것 
			var check_id = $('input[name=id]').eq('1').val();
			console.log(check_id);

			// ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
			$.ajax({
				// url " 어디와 통신을 할 것인가? action에 작성하는 것과 비슷함
				url : "IdCheckCon.do",
				// data : url작성한 곳에 데이터를 보낼 때
				data : {
					"check_id" : check_id
				},
				// dataType : 결과값을 어떤 타입으로 받아올 것인지(json, text..)
				dataType : "text",
				// success : 통신 성공시
				success : function(result) {
					if (result == 'true') {
						$('#idCheck').html("아이디가 중복되었습니다");
						alert("아이디가 중복되었습니다");
					} else {
						$('#idCheck').html("사용가능한 아이디입니다.");
						alert("사용가능한 아이디입니다.");
					}
				},
				//error : 통신 실패시
				error : function(e) {
					alert("실패");
					console.log(e)

				}
			})

		});
		
		
 		// 로그인 버튼을 눌렀을 때!
 		function loginCheck(){
			
			var login_id = $('input[name=id]').eq('0').val();
			var login_pw = $('input[name=pw]').eq('0').val();
			console.log(login_id);
			console.log(login_pw);

			// ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
			$.ajax({
				// url " 어디와 통신을 할 것인가? action에 작성하는 것과 비슷함
				url : "LoginCon.do",
				// data : url작성한 곳에 데이터를 보낼 때
				data : {
					"login_id" : login_id,
					"login_pw" : login_pw
				},
				// dataType : 결과값을 어떤 타입으로 받아올 것인지(json, text..)
				dataType : "text",
				// success : 통신 성공시
				success : (result) => {
					if(result=='true') {
						$('#login').html("로그인 성공!");
						alert("로그인 성공!");
						location.href="Index.jsp";
						
					} else {
						console.log(result);
						$('#login').html("잘못된 정보입니다.");
						alert("잘못된 정보입니다.");
					}
				},
				//error : 통신 실패시
				error : function(e) {
					alert("실패");
					console.log(e)

				}
			});
			
		}
/*  		    $("#loginCheck_btn").on('click', function() {
			// 사용자가 입력한 id 가져오기
			// input태그인데 name = id인 요소의 값을 가져올 것.
			// 2개(로그인, 회원가입)이기 때문에 인덱스 번호 사용해서 로그인(첫번째)에 있는 요소의 값을 가져올 것 
			var login_id = $('input[name=id]').eq('0').val();
			var login_pw = $('input[name=pw]').eq('0').val();
			console.log(id);
			console.log(pw);

			// ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
			$.ajax({
				// url " 어디와 통신을 할 것인가? action에 작성하는 것과 비슷함
				url : "LoginCon.do",
				// data : url작성한 곳에 데이터를 보낼 때
				data : {
					"login_id" : login_id,
					"login_pw" : login_pw
				},
				// dataType : 결과값을 어떤 타입으로 받아올 것인지(json, text..)
				dataType : "text",
				// success : 통신 성공시
				success : function(result) {
					if (result == "true") {
						$('#login').html("로그인 성공!")
						alert("로그인 성공!");
						location.href="Index.jsp";
						
					} else {
						$('#login').html("잘못된 정보입니다.")
						alert("잘못된 정보입니다.");
					}
				},
				//error : 통신 실패시
				error : function(e) {
					alert("실패");
					console.log(e)

				}
			});

		} */
		
		
	</script>

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