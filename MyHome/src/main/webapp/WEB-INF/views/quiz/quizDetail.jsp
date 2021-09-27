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
</style>


</head>

<body>
	<form action='<c:url value="/quiz/quizModify" />' method="get" id="quizDetailForm">
		<div class="contentForm col-xs-12 col-md-12">
			<input type="hidden" name="title" value="">
			<input type="hidden" name="content" value="">
			<input type="hidden" name="type" value="">
			<div class="input-group input-group-sm" role="group" aria-label="...">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th width="30%">글쓴이</th>
							<td width="70%">${article.writer }</td>
						</tr>
						<tr>
							<th style="padding-bottom: 15px;">제목</th>
							<td>
								<div id="quiz_title">${article.title }</div>
							</td>
						</tr>
						<tr>
							<th style="padding-bottom: 15px;">날짜</th>
							<td><fmt:formatDate value="${article.regDate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th style="padding-bottom: 15px;">분류</th>
							<td>
								<div id="quiz_type">${article.type }</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr height="200" valign="top" style="background-color: #fff;">
							<td colspan="4">
								<c:if test="${article.fileLoca != null }">
									<img alt="가구 이미지" src="/img/${article.fileLoca }" class="inimg">
								</c:if>
								<div id="quiz_content" contentEditable="false" class="boast_inwrite" style="overflow:auto">${article.content }</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">조회수: ${article.views }</td>
						</tr>
						<tr style="background-color: #fff;">
							<td colspan="2"
								style="border-bottom: hidden; border-left: hidden; border-right: hidden;">
								<div class="btn-group btn-group-sm " style="margin-left: 69%;" role="group" aria-label="...">
									<input type="submit" id="modBtn" class="btn btn-info btns" value="수정">
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
							<textarea class="form-control" id="replyContent" rows="3" placeholder="댓글을 작성해주세요"></textarea>
							<button type="button" id="replyRegBtn" class="btn btn-info">등록</button>
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
		//수정 버튼 클릭
		$('#modBtn').click(function() {
			const title = $('#quiz_title').text();
			const content = $('#quiz_content').text();
			const type = $('#quiz_type').text();
			console.log(title);
			console.log(content);
			$('input[name=title]').val(title);
			$('input[name=content]').val(content);
			$('input[name=type]').val(type);
		});
	
		//목록 버튼 클릭
		$('#listBtn').click(function() {
			location.href = "<c:url value='/quiz/quizList?pageNum=${page.pageNum}&condition=${page.condition}&keyword=${page.keyword}&sort=${page.sort }' />"			
		});
		
		//삭제 버튼 클릭
		$('#delBtn').click(function() {
			const result = confirm('정말 삭제 하시겠습니까?');
			
			if(result) {
				$('#quizDetailForm').attr('action', '<c:url value="/quiz/quizDelete?quizNum=${article.quizNum}&pageNum=${page.pageNum}" />');
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
							getList(1);
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
		
		// 날짜 보정 함수
		function timeStamp(millis) {
			
			const today = new Date();
			const gap = today.getTime() - millis;
			
			let time;
			if(gap < 60*60*24*1000) {
				if(gap < 60*60*1000) {
					time = '방금전';
				} else{
					time = parseInt(gap/(60*60*1000)) + '시간 전';
				}
			} else {
				const regDate = new Date(millis);
				const year = regDate.getFullYear();
				const month = regDate.getMonth() + 1;
				const day = regDate.getDate();
				
				time = year + "-" + month + "-" + day;				
			}
		
			return time;
		}
		
		// 댓글 목록
		let strAdd = "";
		let pStrAdd = "";

		getList(1);
		
		function getList(pageNum) {
			
			const quizNum = '${article.quizNum}';
			
			$.getJSON(
				"<c:url value='/answer/answerList/" + quizNum + "/" + pageNum + "'/>",
				function(data) {
					
					const list = data.list;
					const qpc = data.qpc;
					
					strAdd = '';
					
					for(let i=0; i<list.length; i++) {
						strAdd += "<div id='reply-" + list[i].answerNum + "' class='reply-wrap'>";
						strAdd += "<div class='reply-image'>";
						strAdd += "<img src='${pageContext.request.contextPath}/resources/img/icon.png' alt='prof' class='userimg'>";
						strAdd += "</div>";
						strAdd += "<div class='reply-content'>"
						strAdd += "<div class='reply-group'>";
						strAdd += "<strong class='left'>" + list[i].writer + "</strong>";
						strAdd += "<small class='left'>" + timeStamp(list[i].regDate) + "</small>"
						strAdd += "<div class='btn-group-sm' role='group'>";
						strAdd += "<a href='" + list[i].answerNum + "' r_page='" + pageNum + "' class='btn btn-info delReply' style='color:#fff;'>삭제</a>";
						strAdd += "<a href='" + list[i].answerNum + "' r_content='" + list[i].content +"' r_page='" + pageNum + "' class='btn btn-info modReply' style='color:#fff;'>수정</a>";
						strAdd += "</div>"; 
						strAdd += "</div>";
						strAdd += "<div id='reply-con'><p>" + list[i].content + "</p></div>";
						strAdd += "</div>"
						strAdd += "</div>"
					}
					$('#reply-list').html(strAdd);
					
					if(list.length > 0) {
												
						pStrAdd = '';
						
						pStrAdd += "<ul class='pagination justify-content: center'>";
						
						if(qpc.prev) {
							pStrAdd += "<li class='page-item'><button id='" + --qpc.beginPage + "' class='page-link'> 이전 </button></li>"
							++qpc.beginPage;
						}
						
						for(let j=qpc.beginPage; j<=qpc.endPage; j++) {
							pStrAdd += "<li class='page-item'><button id='" + j + "' class='page-link'>" + j + "</button></li>"
						}
						
						if(qpc.next) {
							pStrAdd += "<li class='page-item'><button id = '" + ++qpc.endPage + "' class='page-link'> 다음 </button></li>"
						}
						
						pStrAdd += "</ul>";
						
						$('#answerPage').html(pStrAdd);
						
						
					} // 댓글 페이징
					
					
				} // 통신 성공 시 함수

			); // json end
					
		} // 댓글 목록 함수
		
		// 댓글 페이징 이벤트
		$('#answerPage').on('click', '.page-item button', function() {
			getList($(this).attr('id'));
		});
		
		// 댓글 수정, 삭제
		$('#reply-list').on('click', 'a', function(e) {
			
			e.preventDefault();
			
			// 댓글 페이지 번호
			let r_page = $(this).attr('r_page');
			const answerNum = $(this).attr('href');
			
			// 댓글 삭제
			if($(this).hasClass('delReply')) {
				
				const delResult = confirm('댓글을 삭제하시겠습니까?');
				
				if(delResult) {
					$.ajax({
						type : "POST",
						url : "<c:url value='/answer/answerDelete' />",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : answerNum,
						success : function(result) {
							if(result === 'delSuccess') {
								console.log('댓글 삭제 성공!');
								getList(r_page);
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
			
			const r_content = $(this).attr('r_content');
			// 댓글 수정
			if($(this).hasClass('modReply')) {
				
				
				var modStr = '';
				modStr += "<div id='reply-'" + answerNum + " class='reply-wrap'>";
				modStr += "<div class='reply-image'>";
				modStr += "<img src='${pageContext.request.contextPath}/resources/img/icon.png' alt='prof' class='userimg'>";
				modStr += "</div>";
				modStr += "<div class='reply-content'>";
				modStr += "<div class='reply-group clearfix'>";
				modStr += "<textarea class='form-control' id='modContent' name='content' rows='3'>"+r_content+"</textarea>";
				modStr += "<button type='button' id='replyModBtn' class='btn btn-info'>수정</button>";
				modStr += "<button type='button' id='cancleBtn' class='btn btn-info'>취소</button>";
				modStr += "</div>";
				modStr += "</div>";
				
				$('#reply-' + answerNum).replaceWith(modStr);
				
				$('#cancleBtn').click(function() {
					getList(r_page);
				}); // 취소 버튼
				
				$('#replyModBtn').click(function() {
					
					const mod_content = $('#modContent').val();
					
					$.ajax({
						type : "POST",
						url : "<c:url value='/answer/answerModify'/>",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : JSON.stringify({
							'content' : mod_content,
							'answerNum' : answerNum
						}),
						success : function(result) {
							if(result === 'modSuccess') {
								console.log('댓글 수정 성공!');
								getList(r_page);
							} else {
								console.log('댓글 수정 실패!')
							}
						},
						error : function() {
							console.log('통신 실패');
						}
						
					}); // 댓글 수정 비동기 
					
					
					
				}); // 댓글 수정 버튼
			} // 댓글 수정
			
			
		}); // 댓글 수정, 삭제
		
		
	}); //jQuery end

</script>

</html>

