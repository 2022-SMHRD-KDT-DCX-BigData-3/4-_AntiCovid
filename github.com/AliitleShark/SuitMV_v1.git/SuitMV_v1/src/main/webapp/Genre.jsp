<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Genre.css">
</head>
<body>
<div class="nav" id="nav">
		<a href="./Index.jsp"><img src="./img/textlogo.png" alt="" class="nav_logo"></a>
		<div class="nav_right">
			<!-- 검색페이지 이동 -->
			<div class="search">
				<a href="http://172.30.1.73:8501"><img src="./img/search.png" width="38px" height="34px"></a>
			</div>
			
			<!-- 장르페이지 이동 -->
			<div class="genre"><a href="Genre.jsp">장르</a></div>
			
			<!-- 회원정보수정 페이지 이동 -->
			<div class="update"><a href="Update.jsp">회원정보수정</a></div>
			
			<div class="logout"><a href="LogoutCon.do">로그아웃</a></div>

		</div>
	</div>
	<div class="row">
		<h2>액션</h2>
		<div class="row_posters" name="액션"></div>
	</div>

	<div class="row">
		<h2>SF</h2>
		<div class="row_posters" name="SF"></div>
	</div>

	<div class="row">
		<h2>판타지</h2>
		<div class="row_posters" name="판타지"></div>
	</div>

	<div class="row">
		<h2>코미디</h2>
		<div class="row_posters" name="코미디"></div>
	</div>

	<div class="row">
		<h2>드라마</h2>
		<div class="row_posters" name="드라마"></div>
	</div>

	<div class="row">
		<h2>로맨스</h2>
		<div class="row_posters" name="로맨스"></div>
	</div>

	<div class="row">
		<h2>미스터리</h2>
		<div class="row_posters" name="미스터리"></div>
	</div>

	<div class="row">
		<h2>스릴러</h2>
		<div class="row_posters" name="스릴러"></div>
	</div>

	<div class="row">
		<h2>공포</h2>
		<div class="row_posters" name="공포"></div>
	</div>

	<div class="row">
		<h2>애니메이션</h2>
		<div class="row_posters" name="애니메이션"></div>
	</div>

	<div class="row">
		<h2>가족</h2>
		<div class="row_posters" name="가족"></div>
	</div>

	<div class="row">
		<h2>모험</h2>
		<div class="row_posters" name="모험"></div>
	</div>

	<div class="row">
		<h2>범죄</h2>
		<div class="row_posters" name="범죄"></div>
	</div>

	<div class="row">
		<h2>전쟁</h2>
		<div class="row_posters" name="전쟁"></div>
	</div>

	<div class="row">
		<h2>역사</h2>
		<div class="row_posters" name="역사"></div>
	</div>


	<!-- 주피터(머신러닝)에서 장르별 genre_MV(인기순위) 이미지,타이틀,장르,평점,줄거리 가져오기 -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		/* 페이지가 로드됐을때 ajax 실행 */
		$(document).ready(function(){
			// ajax를 통해서 Flask에 요청
			
			let cnt_액션 = 0;
			let cnt_SF = 0;
			let cnt_판타지 = 0;
			let cnt_코미디 = 0;
			let cnt_드라마 = 0;
			let cnt_로맨스 = 0;
			let cnt_미스터리 = 0;
			let cnt_스릴러 = 0;
			let cnt_공포 = 0;
			let cnt_애니메이션 = 0;
			let cnt_가족 = 0;
			let cnt_모험 = 0;
			let cnt_범죄 = 0;
			let cnt_전쟁 = 0;
			let cnt_역사 = 0;
			
			$.ajax({
				url : 'http://localhost:9000/rank',
				type : 'get',
				// JSON : JavaScript Object Notation
				dataType:'json',
				success : function(res){
					console.log(res.length);
					/* 슬립 */
					for(let j = 0; j < res.length; j++){
						console.log(res[j].genre)
						if(res[j].genre=="액션" && cnt_액션 < 20){
							cnt_액션++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="액션"]').append(img_rank)
								
						}else if(res[j].genre=="SF" && cnt_SF < 20){
							cnt_SF++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="SF"]').append(img_rank)
								
						}else if(res[j].genre=="판타지" && cnt_판타지 < 20){
							cnt_판타지++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="판타지"]').append(img_rank)
								
						}else if(res[j].genre=="코미디" && cnt_코미디 < 20){
							cnt_코미디++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="코미디"]').append(img_rank)
								
						}else if(res[j].genre=="드라마" && cnt_드라마 < 20){
							cnt_드라마++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="드라마"]').append(img_rank)
								
						}else if(res[j].genre=="로맨스" && cnt_로맨스 < 20){
							cnt_로맨스++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="로맨스"]').append(img_rank)
								
						}else if(res[j].genre=="미스터리" && cnt_미스터리 < 20){
							cnt_미스터리++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="미스터리"]').append(img_rank)
								
						}else if(res[j].genre=="스릴러" && cnt_스릴러 < 20){
							cnt_스릴러++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="스릴러"]').append(img_rank)
								
						}else if(res[j].genre=="공포" && cnt_공포 < 20){
							cnt_공포++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="공포"]').append(img_rank)
								
						}else if(res[j].genre=="애니메이션" && cnt_애니메이션 < 20){
							cnt_애니메이션++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="애니메이션"]').append(img_rank)
								
						}else if(res[j].genre=="가족" && cnt_가족 < 20){
							cnt_가족++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="가족"]').append(img_rank)
								
						}else if(res[j].genre=="모험" && cnt_모험 < 20){
							cnt_모험++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="모험"]').append(img_rank)
								
						}else if(res[j].genre=="범죄" && cnt_범죄 < 20){
							cnt_범죄++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="범죄"]').append(img_rank)
								
						}else if(res[j].genre=="전쟁" && cnt_전쟁 < 20){
							cnt_전쟁++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="전쟁"]').append(img_rank)
								
						}else if(res[j].genre=="역사" && cnt_역사 < 20){
							cnt_역사++;
							img_rank = `
								<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
								onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
							`
							$('div[name="역사"]').append(img_rank)
								
						}
						
					}
 
				},
				error : function(e){
					console.log(e);
				}
			})	
		})
	</script>

</body>
</html>