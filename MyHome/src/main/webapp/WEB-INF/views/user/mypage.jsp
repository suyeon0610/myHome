<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>  마이 페이지  </title> 
	<link rel="shortcut icon" href="../img/home-icon.png">

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<style>
		section{
			margin: 250px;
   
            width: 90%;
            float: none;
            background-color: white;
		}
.my_icon {
			margin-top: 100px;
			text-align: center;
			width: 300px;
			height: 450px;
			padding: 35px 25px 18px;
			border-radius: 8px;
			border: 1px solid rgb(218, 220, 224);
			box-shadow: rgb(63 71 77 / 6%) 0px 2px 4px 0px;
			
		}
		.my{
    width: 60%;
    height: 40%;
}
		
.Attention{
    border-top: 1px solid rgb(234, 235, 239);
    padding: 22px 12px 0px;
}
.url{
	display: inline;
	padding-left: 40px;
}
.inner {	
		text-align: center;
            width: 40%;
            padding: 10px;
            box-sizing: border-box;
            float: left;
			margin-left: 10px;
        }
	a{
		color: #000;
	}
	.board{
		width: 70%;
	}
	.lefts{
		left: 95%;
		position: relative;
	}
	.pag{
	
		margin-left: 40%;
	}
	.cards{
        display: inline-block;
        width: 100%;
        height: 100%;
       margin: 0 0 50px 20px;
    }
    .dete,.eye{
      font-size: 13px;
    }
    .category {
  display: block;
  max-width: 1000px;
  margin: 0 auto;
  margin-bottom: 30px; 
  
}
.category-lists ul li:first-child {
  margin-left: 0;
}
.category ul li {
  display: inline-block;
  margin: 0px;
  text-align: center; 
}

</style>

</head>
 
 <body>
 <section>
 	<div class="container-fluid">
 		<div class="row">
 			<div class="col-md-3">
 				<div class="my_icon"><img class="my" src="../img/mi_icon.webp">
 					<div class="ninkname">${userInfo.nickName } </div>
 					<div class="Attention">
 						<div class="inner">
 							<a class="scrap_url"href="#">
 								<div class="scrap_icon"><svg width="24" height="24"
 										viewBox="0 0 24 24" fill="currentColor" preserveAspectRatio="xMidYMid meet">
 										<path fill-rule="evenodd" transform="matrix(1 0 0 -1 0 23.033)"
 											d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z">
 										</path>
 									</svg></div>
 								<div class="scrap_ko">스크랩북</div>
 								<div class="scrap_count">0</div>
 							</a>
 						</div>
 						<div class="inner">
 							<a class="heart_url" href="#">
 								<div class="heart"><svg width="24" height="24"
 										viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
 										<path fill="currentColor"
 											d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z">
 										</path>
 									</svg></div>
 								<div class="heart ko">좋아요</div>
 								<div class="heart count">0</div>
 							</a>
 						</div>

						 <button id="'#" class="btn btn-sm btn-info btn-block" type="submit"><a class="#" href="#">등업 신청 </a></button>
						 <button id="'#" class="btn btn-sm btn-info btn-block" type="submit"><a class="#" href="#">개인정보 수정 </a></button>
 				</div>
               

 			</div>
			 
 		</div>

	
        <div class="col-md-9">
			<div class="board">
				
				<div class="category">
					<ul>			
						<li class="category-item is-active" data-filter4="" data-sort="" >
							<button type="button" id="home-btn" class="btn btn-default btn-sm" style="border: 1px solid black;">뽐내기</button>
						</li>
					
						<li class="category-item" data-filter4="" data-sort="rgstdtime">
							<button type="button" id="quiz-btn" class="btn btn-default btn-sm" style="border: 1px solid black;">질문과답변</button>
						</li>
						
						<li class="category-item" data-filter4="" data-sort="rgstdtime">
							<button type="button" id="scrap-btn" class="btn btn-default btn-sm" style="border: 1px solid black;">스크랩 </button>
						</li>
		               
		                <c:choose>
		                	<c:when test="${userInfo.grade }">
								<li class="category-item" data-filter4="" data-sort="rgstdtime">
									<button type="button" id="grdeUp-btn" class="btn btn-default btn-sm" style="border: 1px solid black;">등업신청</button>
								</li>
							</c:when>
						</c:choose>
						<li class="category-item" data-filter4="" data-sort="rgstdtime" style="position: absolute; left: 55%;">
							<button id="'#" class="btn btn-sm btn-info btn-block " style="border: 1px solid black;" type="submit">작성</button>
						</li>
		
					</ul>
				</div>
				
				<c:forEach var="a" items="${uesrInfo.homeList }">
					<div class="col-md-3 cards">
						<div class="card" style="width: 13rem;">
							<a href="#"><img src="../img/interior10.png" class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title">${a.title }</h5>
								<p class="card-text">
									글내용
								</p>
								<hr>
								<div class="d-flex justify-content-between align-items-center">
			
			
									<a class="dete"><fmt:formatDate value="${a.regDate }" pattern="yyyy-MM-dd"/> </a>
									<a class="eye"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
											<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
											<path
												d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z">
											</path>
										</svg>5</a>
			
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>

	</div>

	<nav class="pagination-sm pag">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#">
					◁
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					1
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					2
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					3
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					4
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					5
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">
					▷
				</a>
			</li>
		</ul>
	</nav>
</div>
 </section>
 	<script src="../js/jquery.min.js"></script>
 	<script src="../js/bootstrap.min.js"></script>
 	<script src="../js/scripts.js"></script>
 
</body>

<script>
	
	// jquery start
	$(function() {
		
		
		
	}); // jquery end

</script>
</html>