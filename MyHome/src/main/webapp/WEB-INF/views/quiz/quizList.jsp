<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>QnA</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
#container {
	width: 70%;
	margin: 0 auto;
	/* 가로로 중앙에 배치 */
	padding-top: 10%;
	/* 테두리와 내용 사이의 패딩 여백 */
}

.list {
	text-align: center;
}

.write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

.pag {
	margin-left: 300px;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {from { color:white;
	
}

30
%
{
color
:
yellow;
}
to {
	color: red;
	font-weight: bold;
}

/* 0% {color:white;} 30% {color: yellow;} 100% {color:red; font-weight: bold;} */
}
</style>
</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<form class="navbar-form pull-left" role="search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="검색">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search">검색</span>
								</button>
							</div>
						</div>
					</form>
				</div>

				<div class="row">

					<div class="col-lg-12" style="background: rgb(235, 235, 235);">

						<div class="list" id="#">
							<b>Q&A 게시판 </b>
						</div>

						<div class="write" id="">
							<a href='<c:url value="/quiz/quizRegist" />'>글쓰기</a>
						</div>

						<div>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width="10%">번호</th>
										<th width="50%">제목</th>
										<th width="10%">작성자</th>
										<th width="20%">작성일</th>
										<th width="10%">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="a" items="${articles }">
										<tr>
											<td>${a.quizNum}</td>
											<td class="title" id=""><a href='<c:url value="/quiz/quizDetail/${a.quizNum}?pageNum=" />'>${a.title}</a><span class="hit">hit!</span></td>
											<td>${a.writer}</td>
											<td><fmt:formatDate value="${a.regDate}" pattern="yyyy-MM-dd"/></td>
											<td>${a.views}</td>
										<tr>									
									</c:forEach>
								</tbody>
							</table>
							<nav class="pagination-sm pag">
								<ul class="pagination justify-content: center">
									<c:if test="${paging.prev }">
										<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.beginPage-1}" />'> 이전 </a></li>									
									</c:if>
									<c:forEach var="i" begin="${paging.beginPage}" end="${paging.endPage}">
										<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${i}" />'> ${i} </a></li>									
									</c:forEach>
									<c:if test="${paging.next }">
										<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.endPage+1 }" />'> 다음 </a></li>									
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>


			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>