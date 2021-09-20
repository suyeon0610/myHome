<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/qna_write_view.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
#contentForm {
	width: 40%;
	margin: 0 auto;
	padding-top: 12%;
}

.table>thead>tr>th, .table>tbody>tr>th {
	background-color: #e6ecff;
	text-align: center;
}

.btns {
	text-align: right;
}
</style>


</head>

<body>
	<form action='<c:url value="/quiz/quizModify" />' method="get" id="quizDetailForm">
		<div class="contentForm col-xs-12 col-md-12">
			<input type="hidden" name="#" value="#"> <input type="hidden"
				name="groupId" value="#"> <input type="hidden" name="depth"
				value="#"> <input type="hidden" name="#" value="#">
			<div class="input-group input-group-sm" role="group" aria-label="...">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th width="30%">글쓴이</th>
							<td width="70%"><input type="text" name="writer"
								value="${article.writer }" readonly="readonly"
								style="width: 100%"></td>
						</tr>
						<tr>
							<th style="padding-bottom: 15px;">제목</th>
							<td><input type="text" name="title"
								value="${article.title }" readonly="readonly"></td>
						</tr>
						<tr>
							<th style="padding-bottom: 15px;">날짜</th>
							<td><fmt:formatDate value="${article.regDate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</thead>
					<tbody>
						<tr height="200" valign="top" style="background-color: #fff;">
							<td colspan="4"><c:if test="${article.fileLoca != null }">
									<img alt="가구 이미지" src="/img/${article.fileLoca }" width="100"
										height="100">
								</c:if> ${article.content }</td>
						</tr>
						<tr>
							<td colspan="4">조회수: ${article.views }</td>
						</tr>
						<tr style="background-color: #fff;">
							<td colspan="2"
								style="border-bottom: hidden; border-left: hidden; border-right: hidden;">
								<button type="button" class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-bookmark"></span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
	                                    <path
											d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
	                                  </svg>
								</button>
								<button type="button" class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-heart"></span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	                                    <path
											d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                                  </svg>
								</button>
								<div class="btn-group btn-group-sm " style="margin-left: 69%;"
									role="group" aria-label="...">
									<input type="submit" class="btn btn-info btns" value="수정">
									<input type="button" class="btn btn-info btns" id="delBtn" value="삭제"> 
									<input type="button" class="btn btn-info btns" id="listBtn" value="목록">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</form>

	<!-- Reply Form {s} -->

	<div class="container">
		<div class="row col-xs-12 col-md-12" style="width: 145%;">
			<div class="col-xs-12 col-md-12 write-wrap">
				<div class="reply-wrap">
					<div class="reply-image">
						<img
							src="${pageContext.request.contextPath}/resources/img/icon.png"
							alt="prof" class="userimg">
					</div>
					<div class="reply-content">
						<div class="reply-group clearfix">
							<div class="reply-user">
								<strong class="left">글쓴이</strong>
							</div>
							<textarea class="form-control" rows="3" placeholder="댓글을 작성해주세요"></textarea>
							<button class="btn btn-info">등록</button>
							<button class="btn btn-info">
								<svg width="24" height="20" viewBox="0 0 24 20"
									preserveAspectRatio="xMidYMid meet">
                                            <path fill="#292929"
										fill-rule="nonzero"
										d="M3.22 20C1.446 20 0 18.547 0 16.765V6.176c0-1.782 1.446-3.235 3.22-3.235h3.118L7.363.377A.586.586 0 0 1 7.903 0h8.195c.24.003.453.152.54.377l1.024 2.564h3.118c1.774 0 3.22 1.453 3.22 3.235v10.589C24 18.547 22.554 20 20.78 20H3.22zm0-1.176h17.56a2.037 2.037 0 0 0 2.05-2.06V6.177c0-1.15-.904-2.058-2.05-2.058h-3.512a.585.585 0 0 1-.54-.368l-1.024-2.574H8.296L7.27 3.75a.585.585 0 0 1-.54.368H3.22a2.037 2.037 0 0 0-2.05 2.058v10.589c0 1.15.904 2.059 2.05 2.059zM12 17.059c-3.064 0-5.561-2.51-5.561-5.588 0-3.08 2.497-5.589 5.561-5.589s5.561 2.51 5.561 5.589c0 3.079-2.497 5.588-5.561 5.588zm0-1.177a4.392 4.392 0 0 0 4.39-4.411A4.392 4.392 0 0 0 12 7.059a4.392 4.392 0 0 0-4.39 4.412A4.392 4.392 0 0 0 12 15.882z">
                                            </path>
                                        </svg>
							</button>
						</div>
					</div>

				</div>
				<div class="reply-wrap">
					<div class="reply-image">
						<img
							src="${pageContext.request.contextPath}/resources/img/icon.png"
							alt="prof" class="userimg">
					</div>
					<div class="reply-content">
						<div class="reply-group">
							<strong class="left">글쓴이</strong> <small class="left">2021/12/12</small>


							<div class="btn-group-sm" role="group">
								<button type="button" class="btn btn-info">삭제</button>
								<button type="button" class="btn btn-info">수정</button>
							</div>

						</div>
						<p>여기는 댓글 영역</p>
					</div>
				</div>
			</div>
		</div>
		<nav class="pagination-sm pag">
			<ul class="pagination justify-content: center">
				<li class="page-item"><a class="page-link" href="#"> 이전 </a></li>
				<li class="page-item"><a class="page-link" href="#"> 1 </a></li>
				<li class="page-item"><a class="page-link" href="#"> 다음 </a></li>
			</ul>
		</nav>
	</div>




</body>

<script>
	// start JQuery
	$(function() {

		// 목록 버튼 클릭
		$("#listBtn").click(function() {
			location.href = "<c:url value='/quiz/quizList?pageNum=${pageNum}' />";
		});
		
		// 삭제 버튼 클릭
		$("#delBtn").click(function() {
			
			cosnt result = confirm('정말 삭제 하시겠습니까?');
			
			if(result) {
				$('#quizDetailForm').attr('action', '<c:url value="/quiz/quizDelete?quizNum=${article.quizNum}" />');
				$('#quizDetailForm').attr('method', 'post');				
			}
			
			
		});

	});
</script>

</html>

