<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="text" name="search_title" placeholder="검색어를 입력하세요">
		<input type="button" id="search" value="검색">
	</form>
	
	<div id="result" style="width:100%; height:100%">
	
	
	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		$('#search').on('click', function(){
			
			// ajax를 통해서 Flask에 요청
			$.ajax({
				url : 'http://localhost:9000/search',
				type : 'get',
				data : {
					"search_title" : $('input[name=search_title]').val()
				},
				// JSON : JavaScript Object Notation
				dataType:'json',
				success : function(res){					
					for(let i = 0; i < res.length; i++){
						div = `
							<div style="width:23%; height:30px; display:inline; border:1px;">
								<img src="` + res[i].image + `" style="width:80%; height:60%;">
								<p> ` + res[i].title + ` </p>
							</div>
						
						`
						$("#result").append(div)
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