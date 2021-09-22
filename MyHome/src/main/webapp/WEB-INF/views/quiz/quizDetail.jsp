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
							<td width="70%"><input type="text" name="writer" value="${article.writer }" readonly="readonly" style="width: 100%"></td>
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
							<td colspan="4">
								<c:if test="${article.fileLoca != null }">
									<img alt="가구 이미지" src="/img/${article.fileLoca }" width="100" height="100">
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
									<input type="button" id="delBtn" class="btn btn-info btns"  value="삭제"> 
									<input type="button" id="listBtn" class="btn btn-info btns"  value="목록">
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
						<img src="${pageContext.request.contextPath}/resources/img/icon.png" alt="prof" class="userimg">
					</div>
					<div class="reply-content">
						<div class="reply-group clearfix">
							<textarea class="form-control" id="replyContent" name="content" rows="3" placeholder="댓글을 작성해주세요"></textarea>
							<button type="button" id="replyRegBtn" class="btn btn-info">등록</button>
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
				
				<div id="reply-list">
				
					<!-- ajax로 작성할 태그(답변) -->
					<!--   
					<div class="reply-wrap">
						<div class="reply-image">
							<img src="${pageContext.request.contextPath}/resources/img/icon.png" alt="prof" class="userimg">
						</div>
						<form action="/answer/answerModify" method="post">
							<div class="reply-content">
								<div class="reply-group">
									<strong class="left">글쓴이</strong>
									<small class="left"><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd"/></small>
									<div class="btn-group-sm" role="group">
										<button type="button" class="btn btn-info">삭제</button>
										<a href="#" class="btn btn-info">수정</a>
									</div>
								</div>
								<p>여기는 댓글 영역</p>
							</div>
						</form>							
					</div>
					-->
					
				</div>
			</div>
		</div>
		
		<nav id ='answerPage' class="pagination-sm pag">
		
		<!-- ajax로 작성(페이징) -->
			<!--  
			<ul class="pagination justify-content: center">
				<li class="page-item"><a class="page-link" href="#"> 이전 </a></li>
				<li class="page-item"><a class="page-link" href="#"> 1 </a></li>
				<li class="page-item"><a class="page-link" href="#"> 다음 </a></li>
			</ul>
			-->
			
		</nav>
	</div>




</body>

<script>

	//jQuery start
	$(function() {
	
		//목록 버튼 클릭
		$('#listBtn').click(function() {
			location.href = "<c:url value='/quiz/quizList?pageNum=${pageNum}' />"			
		});
		
		//삭제 버튼 클릭
		$('#delBtn').click(function() {
			const result = confirm('정말 삭제 하시겠습니까?');
			
			if(result) {
				$('#quizDetailForm').attr('action', '<c:url value="/quiz/quizDelete?quizNum=${article.quizNum}&pageNum=${pageNum}" />');
				$('#quizDetailForm').attr('method', 'post')
				$('#delBtn').attr('type', 'submit');				
			}
		});
		
		// 댓글 등록
		$('#replyRegBtn').click(function() {
			const content = $('#replyContent').val();
			const writer = '${article.writer}';
			const quizNum = '${article.quizNum}';
			
			if(content === '') {
				alert('댓글을 입력해 주세요.');
			} else {
				
				const reInfo = {
					'writer' : writer,
					'content' : content,
					'quizNum' : quizNum
				};
				
				// 댓글 등록 비동기
				$.ajax({
					type : "POST",
					url : "<c:url value='/answer/answerRegist' />",
					headers : {
						"Content-Type" : "application/json"
					},
					dataType : "text",
					data : JSON.stringify(reInfo),
					success : function(result) {
						console.log('통신 성공!');
						if (result === 'regSuccess') {
							console.log('댓글 등록 성공!');
							$('#replyContent').val('');
						} else {
							console.log('댓글 등록 실패!');
						}
					},
					error : function() {
						console.log('통신 실패!');
					}
					
				}); // 댓글 등록 비동기 끝
			}
			
		}); // 댓글 등록 끝

		// 댓글 목록
		let strAdd = "";
		let pStrAdd = "";
		
		getList(1, true);
		
		// reset: 화면 리셋 여부(boolean)
		function getList(pageNum, reset) {
			
			const quizNum = '${article.quizNum}';
			console.log(quizNum);
			
			$.getJSON(
				"<c:url value='/answer/answerList/" + quizNum + "'/>",
				function(data) {
					
					let list = data.list;
					let qpc = data.qpc;
					
					if(reset === true) {
						strAdd = '';
					}
					
					for(let i=0; i<list.length; i++) {
						strAdd += "<div class='reply-wrap'>";
						strAdd += "<div class='reply-image'>";
						strAdd += "<img src='${pageContext.request.contextPath}/resources/img/icon.png' alt='prof' class='userimg'>";
						strAdd += "</div>";
						strAdd += "<div class='reply-content'>"
						strAdd += "<div class='reply-group'>";
						strAdd += "<strong class='left'>" + list[i].writer + "</strong>";
						strAdd += "<small class='left'>" + list[i].regDate + "</small>"
						strAdd += "<div class='btn-group-sm' role='group'>";
						strAdd += "<a href='" + list[i].answerNum + "' class='btn btn-info delReply'>삭제</a>";
						strAdd += "<a href='" + list[i].answerNum + "' class='btn btn-info'>수정</a>";
						strAdd += "</div>";
						strAdd += "</div>";
						strAdd += "<p>" + list[i].content + "</p>";
						strAdd += "</div>"
						strAdd += "</div>"
					}
					
					$('#reply-list').html(strAdd);
					
					if(data.list > 0) {
						pStrAdd += "<ul class='pagination justify-content: center'>";
						
						if(qpc.prev) {
							pStrAdd += "<li class='page-item'><a class='page-link' href='#'> 이전 </a></li>"
						}
						
						for(let j=qpc.beginPage; j<=qpc.endPage; j++) {
							pStrAdd += "<li class='page-item'><a class='page-link' href='#'>" + j + "</a></li>"
						}
						
						if(qpc.next) {
							pStrAdd += "<li class='page-item'><a class='page-link' href='#'> 다음 </a></li>"
						}
						
						pStrAdd += "</ul>";
						
						$('#answerPage').html(pStrAdd);
					}
				} // 통신 성공 시 함수

			); // json end
			
		} // 댓글 목록 함수
		
		// 댓글 수정, 삭제
		$('#reply-list').on('click', 'a', function() {
			
			const answerNum = $(this).attr('href');
			
			// 댓글 삭제
			if($(this).hasClass(delReply)) {
				
				const delResult = confirm('댓글을 삭제하시겠습니까?');
				
				if(delResult) {
					$.ajax({
						type : "POST",
						url : "<c:url value='/answer/answerDelete' />",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : {
							answer : answer
						},
						success : function(result) {
							if(result === 'delSuccess') {
								console.log('댓글 삭제 성공!');
							} else{
								console.log('댓글 삭제 실패!');
							}
						},
						error : function() {
							console.log('통신 실패!');
						}
						
					}); // 댓글 삭제 비동기
				}
				
			} // 댓글 삭제
			
		}); // 댓글 수정, 삭제
		
		
	}); //jQuery end

</script>

</html>

