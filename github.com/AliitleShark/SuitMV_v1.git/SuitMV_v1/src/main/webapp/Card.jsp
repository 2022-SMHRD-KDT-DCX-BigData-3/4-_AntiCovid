<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Card.css">
</head>
<body>
	
	<div class="nav" id="nav">
		<a href="Index.jsp"><img src="./img/textlogo.png" alt=""
			class="nav_logo"></a>
		<div class="nav_right">
			<!-- 검색페이지 이동 -->
			<div class="search">
				<a href="http://172.30.1.73:8501"><img src="./img/search.png" width="38px" height="34px"></a>
			</div>
			
			<!-- 장르페이지 이동 -->
			<div class="genre"><a href="Genre.jsp">장르</a></div>
			
			<!-- 회원정보수정 페이지 이동 -->
			<div class="update"><a href="Update.jsp">회원정보수정</a></div>
			
			<!-- 로그인 페이지 이동 -->
			<div class="logout"><a href="LogoutCon.do">로그아웃</a></div>

		</div>
	</div>

	<div class="container">
		<div class="cellphone-container">
			<div class="movie">
				<div class="movie-img" id="image" style="width: 500px; height: 700px;"></div>
				<div class="text-movie-cont">
					<div class="mr-grid">
						<div class="col1">
							<h1 id="title"></h1>
							<ul class="movie-gen">
								<li id="genre">장르 : </li>
							</ul>
						</div>
					</div>
					<div class="mr-grid overview-row">
						<div class="col2">
							<h5>OVERVIEW</h5>
						</div>
						<div class="col2">
							<ul class="movie-likes">
								<li id="vote_averages"><i class="material-icons">&#xE813;</i>평점 : </li>
							</ul>
						</div>
					</div>
					<div class="mr-grid">
						<div class="col1">
							<p class="movie-description" id="overview"></p>
						</div>
					</div>
					<div class="mr-grid actors-row">
<!-- 						<div class="col1">
							<p class="movie-actors">출연진 : </p>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

	<script type="text/javascript">
		/* 자바스크립트에서 자바스크립트로 location.href를 활용해 데이터 받아오는 함수 */
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results == null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));

		}
		
		/* 데이터(파라미터) 받아오기 */
		$(document).ready(function(){
			// ajax
			$.ajax({
				url : 'Index.jsp',
				type : 'get',
				// JSON : JavaScript Object Notation
				dataType:'text',
				success : function(title,image,genre,overview,vote_averages){
					var title = getParameterByName('title');
					var image = getParameterByName('image');
					var image_src = `<img src="` + image + `" alt="" class="row_poster row_posterLarge" style="width: 100%; height: 100%; object-fit:cover;">`
					var genre = getParameterByName('genre');
					var overview = getParameterByName('overview');
					var vote_averages = getParameterByName('vote_averages');
					
					$("#title").append(title)
					$("#image").append(image_src)
					$("#genre").append(genre)
					$("#overview").append(overview)
					$("#vote_averages").append(vote_averages)
						
				},
				error : function(e){
					console.log(e);
				}
			})	
		})
		
	</script>

</body>
</html>