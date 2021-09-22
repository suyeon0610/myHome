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

<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

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
            <div class="col-md-12">
                <div class="row" style="margin-bottom: 10px; margin-left: 30%; padding: 0px; --bs-gutter-x:0rem;">
                    <div class="btn-group col-md-2">
                        <select class="form-control" name="#" id="#">
                            <option>제목</option>
                            <option>작성자</option>
                            <option>내용</option>
                            <option>제목+내용</option>
                        </select>
                    </div>
                    <div id="#" class="my-2 col-md-4" style="border-radius: 50%;  position: relative; bottom:8px;"
                        data-ride="carousel">
                        <form class="navbar-form pull-left" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="검색">
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-info"><svg xmlns="http://www.w3.org/2000/svg"
                                            width="16" height="16" fill="currentColor" class="bi bi-search"
                                            viewBox="0 0 16 16">
                                            <path
                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

				<div class="row">

					<div class="col-md-12">

						<div class="list" id="#">
                                                 
                            <b style="margin-left: 45%; font-size: 20px;">질문과 답변 </b>
                        </div>
                        <div class="division">
                        <a href="#">최신순</a>
                        <a href="#">인기순</a>
                            <a href='<c:url value="/quiz/quizRegist" />' style="margin-left: 84%;">질문하기</a>
                        </div>

						<div>
							<table class="table table-hover">
								<thead>
									<tr style="background-color: #17a2b8;">
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
											<td class="title" id=""><a href='<c:url value="/quiz/quizDetail/${a.quizNum}?pageNum=${paging.page.pageNum }" />'>${a.title}</a><span class="hit">hit!</span></td>
											<td>${a.writer}</td>
											<td><fmt:formatDate value="${a.regDate}" pattern="yyyy-MM-dd"/></td>
											<td>${a.views}</td>
										<tr>									
									</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징 -->
							<form action='<c:url value="/quiz/quizList" />' id="pageForm">
								<nav class="pagination-sm pag">
									<ul class="pagination justify-content: center" id="pagenation">
										<c:if test="${paging.prev }">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quiList?pageNum=${paging.beginPage-1 }" />'> 이전 </a></li>									
										</c:if>
										<c:forEach var="i" begin="${paging.beginPage}" end="${paging.endPage}">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${i}" />'> ${i} </a></li>									
										</c:forEach>
										<c:if test="${paging.next }">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quiList?pageNum=${paging.endPage+1 }" />' > 다음 </a></li>									
										</c:if>
									</ul>
									
									<input type="hidden" name="pageNum" value="${paging.page.pageNum }">
									
								</nav>
							</form>
							
						</div>
					</div>
				</div>


			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<script>

	const msg = '${msg}';
	if(msg == "delSuccess") {
		alert('삭제가 완료되었습니다.');
	} else if(msg == "regSuccess") {
		alert('질문 등록이 완료되었습니다.')
	}
	
/*
	// start JQuery
	$(function() {
		
		// 페이지 버튼 클릭 이벤트
		$('#pagenation').click(function(e) {
			
			e.preventDefault();
			const value = e.target.dataset.pageNum; 
			
			$('#pageForm').pageNum.val(value);
			$('#pageForm').sumbit();
		
		}); // 페이지 버튼 클릭 이벤트 끝
		
	}); // end JQuery
	
*/

	
</script>
</html>