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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnApage.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>


<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<style>

</style>
</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
            <div class="col-md-12">
            
            	<!-- ๊ฒ์ ํ๊ทธ -->
                <form action='<c:url value="/quiz/quizList" />' method='get'>
                	<input type="hidden" name="pageNum" value="1">
	                <div class="row" style="margin-bottom: 10px; margin-left: 30%; padding: 0px; --bs-gutter-x:0rem;">
	                    <div class="btn-group col-md-2">
	                        <select class="form-control" name="condition" id="#">
	                            <option value="title">์?๋ชฉ</option>
	                            <option value="writer">์์ฑ์</option>
	                            <option value="content">๋ด์ฉ</option>
	                            <option value="titleContent">์?๋ชฉ+๋ด์ฉ</option>
	                        </select>
	                    </div>
	                    <div id="#" class="my-2 col-md-4" style="border-radius: 50%;  position: relative; bottom:8px;"
	                        data-ride="carousel">
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="keyword" placeholder="๊ฒ์">
	                                <div class="input-group-btn">
	                                    <button type="submit" class="btn btn-info">
	                                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	                                            <path
	                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
	                                        </svg>
	                                    </button>
	                                </div>
	                            </div>
	            	      </div>
				       </div>
                   </form>

				<div class="row">

					<div class="col-md-12">

						<div class="list" id="#">
                                                 
                            <b style="margin-left: 45%; font-size: 20px;">์ง๋ฌธ๊ณผ ๋ต๋ณ </b>
                        </div>
                        <div class="division">
                        	 <div class="btn-group">
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                      	์?๋?ฌ
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                      <li><a class="dropdown-item" href='<c:url value="/quiz/quizList?pageNum=1&condition=${paging.page.condition }&keyword=${paging.page.keyword }" />'>์ต์?์</a></li>
                                      <li><a class="dropdown-item" href='<c:url value="/quiz/quizList?pageNum=1&condition=${paging.page.condition }&keyword=${paging.page.keyword }&sort=popul" />'>์ธ๊ธฐ์</a></li>
                                    </ul>
                                </div>
                              </div>
                            <button onclick="location.href='<c:url value="/quiz/quizRegist" />'" class="btn btn-default btn-sm" style="position: relative; left: 88%;">์ง๋ฌธํ๊ธฐ</button> 
                        </div>

						<div>
							<table class="table table-hover">
								<thead>
									<tr style="background-color: #17a2b8;">
										<th width="10%">๋ฒํธ</th>
										<th width="50%">์?๋ชฉ</th>
										<th width="10%">์์ฑ์</th>
										<th width="20%">์์ฑ์ผ</th>
										<th width="10%">์กฐํ์</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${paging.pageTotalCount != 0}">
											<c:forEach var="a" items="${articles }">
												<tr>
													<td>${a.quizNum}</td>
													<td class="title" id=""><a href='<c:url value="/quiz/quizDetail/${a.quizNum}?pageNum=${paging.page.pageNum }&condition=${paging.page.condition }&keyword=${paging.page.keyword }&sort=${paging.page.sort }" />'>${a.title}</a>
														<c:if test="${a.answerCnt!=0 }">
															<a href="#" style="color: crimson;">[${a.answerCnt }]</a>														
														</c:if>
														<c:if test="${a.newMark}">
															<span class="new">NEW!</span>
														</c:if>
													</td>
													<td>${a.writer}</td>
													<td><fmt:formatDate value="${a.regDate}" pattern="yyyy-MM-dd"/></td>
													<td>${a.views}</td>
												<tr>									
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">
													์กด์ฌํ๋ ๊ฒ์๊ธ์ด ์์ต๋๋ค. <br>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							
							<!-- ํ์ด์ง -->

								<nav class="pagination-sm pag">
									<ul class="pagination justify-content: center" id="pagenation">
										<c:if test="${paging.prev }">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.beginPage-1 }" />'> ์ด์? </a></li>									
										</c:if>
										<c:forEach var="i" begin="${paging.beginPage}" end="${paging.endPage}">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${i}&condition=${paging.page.condition}&keyword=${paging.page.keyword}" />'> ${i} </a></li>									
										</c:forEach>
										<c:if test="${paging.next }">
											<li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.endPage+1 }" />' > ๋ค์ </a></li>									
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
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<script>

	const msg = '${msg}';
	if(msg == "delSuccess") {
		alert('์ญ์?๊ฐ ์๋ฃ๋์์ต๋๋ค.');
	} else if(msg == "regSuccess") {
		alert('์ง๋ฌธ ๋ฑ๋ก์ด ์๋ฃ๋์์ต๋๋ค.')
	}
	
	var myDropdown = document.getElementById('myDropdown')
	myDropdown.addEventListener('show.bs.dropdown', function () {
	  // do something...
	})
/*
	// start JQuery
	$(function() {
		
		// ํ์ด์ง ๋ฒํผ ํด๋ฆญ ์ด๋ฒคํธ
		$('#pagenation').click(function(e) {
			
			e.preventDefault();
			const value = e.target.dataset.pageNum; 
			
			$('#pageForm').pageNum.val(value);
			$('#pageForm').sumbit();
		
		}); // ํ์ด์ง ๋ฒํผ ํด๋ฆญ ์ด๋ฒคํธ ๋
		
	}); // end JQuery
	
*/

	
</script>
</html>