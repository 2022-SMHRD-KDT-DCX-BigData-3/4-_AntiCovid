<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Index.css">
<script src="https://kit.fontawesome.com/8280b90f2a.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body>

	<!-- 로그인 정보 저장 -->
	<%
	MemberDTO login_info = (MemberDTO) session.getAttribute("login_info");
	System.out.println(login_info.getMbti());
	%>

	<!-- 최신영화 순위 -->
	<%
	// 최신영화 포스터 10개 img폴더에 "newMV_1~10"로 저장해놓기
	List<String> src_new = new ArrayList<String>();
	for (int i = 1; i <= 20; i++) {
		src_new.add("./img/newMV_" + i + ".jpg");
	}
	%>

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
			
			<!-- 로그인 페이지 이동 -->
			<div class="logout"><a href="LogoutCon.do">로그아웃</a></div>

		</div>
	</div>


	<!-- header -->
	<div class="banner" id="banner">
		
	</div>


	<!-- css 우선순위
      tag(1) > class(10) > id(100) > inline
    -->
	<div class="row">
		<h2>최신영화 순위</h2>
		<div class="row_posters">
			<%
			for (int i = 0; i < src_new.size(); i++) {
			%>
			<img src=<%=src_new.get(i)%> alt=""
				class="row_poster row_posterLarge">
			<%
			}
			%>
		</div>
	</div>

	<div class="row">
		<h2>인기영화 순위</h2>
		<div class="row_posters" id="rank_MV">
		
		</div>
	</div>
	
	<div class="row">
		<h2><%=login_info.getId() %> 님의 MBTI 영화 추천</h2>
		<div class="row_posters" id="mbti_MV">
		
		</div>
	</div>	


	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		/* 주피터(머신러닝)에서 이미지,타이틀,장르,평점,줄거리 가져오기 */
		/* 페이지가 로드됐을때 ajax 실행 */
		$(document).ready(function(){
			// ajax를 통해서 Flask에 요청
			$.ajax({
				url : 'http://localhost:9000/rank',
				type : 'get',
				// JSON : JavaScript Object Notation
				dataType:'json',
				success : function(res){
					
					/* 배너 */ 
					div_banner = `
						<div class="banner_contents">
							<h1 class="banner_title">아바타2 : 물의 길</h1>
							<div class="banner_buttons">
								<button class="banner_button">Play</button>
								<button class="banner_button">My list</button>
							</div>
							<div class="banner_description">2009년 개봉한 영화 아바타의 두번째 시리즈로 첫번째 작품의 사건이 발생한 이후의 이야기를 다룬다.</div>
						</div>
						<div class="banner--fadeBottom">
						</div>
					`
					$("#banner").append(div_banner)
					
					 
					/* 인기순위 top20 */
					for(let i = 0; i < 20; i++){
						img_rank = `
							<img src="` + res[i].image + `" alt="" class="row_poster row_posterLarge" 
							onclick="javascript:location.href='Card.jsp?title='+'` + res[i].title + `'+'&image='+'` + res[i].image + `'+'&overview='+'` + res[i].overview + `'+'&vote_averages='+'` + res[i].vote_averages + `'+'&genre='+'` + res[i].genre + `';" >
						`						
						$("#rank_MV").append(img_rank)
					}
					
 					/* mbti별 장르2개 top20 */
					if("<%=login_info.getMbti()%>"=="INTP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="코미디" || res[j].genre=="SF") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="INFP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="판타지" || res[j].genre=="로맨스") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="INTJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="미스터리" || res[j].genre=="공포") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="INFJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="판타지" || res[j].genre=="애니메이션") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ISTP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="액션" || res[j].genre=="판타지") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ISFP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="애니메이션" || res[j].genre=="가족") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ISTJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="역사" || res[j].genre=="전쟁") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ISFJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="역사" || res[j].genre=="스릴러") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ENTP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="액션" || res[j].genre=="SF") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ENFP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="모험" || res[j].genre=="SF") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ENTJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="스릴러" || res[j].genre=="범죄") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ENFJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="로맨스" || res[j].genre=="코미디") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ESTP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="액션" || res[j].genre=="코미디") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ESFP"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="로맨스" || res[j].genre=="드라마") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ESTJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="역사" || res[j].genre=="드라마") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}else if("<%=login_info.getMbti()%>"=="ESFJ"){
						let cnt = 0;
						for(let j = 0; j < res.length; j++){
							if((res[j].genre=="액션" || res[j].genre=="애니메이션") && cnt < 20){
								cnt++;
								img_rank = `
									<img src="` + res[j].image + `" alt="" class="row_poster row_posterLarge" 
									onclick="javascript:location.href='Card.jsp?title='+'` + res[j].title + `'+'&image='+'` + res[j].image + `'+'&overview='+'` + res[j].overview + `'+'&vote_averages='+'` + res[j].vote_averages + `'+'&genre='+'` + res[j].genre + `';" >
								`
								$("#mbti_MV").append(img_rank)
								
							}
						}
					}
					
				},
				error : function(e){
					console.log(e);
				}
			})
		})
	</script>

	<script>
      const nav = document.getElementById('nav');
      
      window.addEventListener('scroll', () => {
        
        if(window.scrollY >=100){
          // background-image : linear-gradient(180deg,rgba(0,0,0,.7) 10%,transparent);
          // console.log("123")
          nav.classList.add('nav__black');
        } else{

          nav.classList.remove('nav__black');
        }
      });
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>