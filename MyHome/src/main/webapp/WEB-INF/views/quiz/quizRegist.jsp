<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>  QnA  </title> 
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <style>
        #contentForm {
            width: 40%;
            margin: 0 auto;
            padding-top: 12%;
        }
        .table>thead>tr>th,
        .table>tbody>tr>th {
            background-color: #e6ecff;
            text-align: center;
        }
        .btns{
            text-align: right;
        }
        .boast_inwrite{
            background-color: white;
            width: 100%;
            height: 300px;
            overflow:auto;
        }
        .inimg{
		    width: 100%;
		    height: auto;
		    text-align: center;
		}
    </style>


</head>

<body>
    <form action='<c:url value="/quiz/quizRegist" />' method="post" enctype="multipart/form-data">
        <div id="contentForm"> 
	        <input type="hidden" name="content" value="">	         
            <div class="input-group input-group-sm" role="group" aria-label="...">
                <table class="table table-striped table-bordered">
                    <thead>
                       
                        <tr>
                            <th style="padding-bottom: 15px;">제목</th>
                            <td>
                            	<input type="text" name="title" class="form-control" aria-describedby="basic-addon1" autofocus="autofocus">
                            </td>
                        </tr>
                        <tr>
                            <th style="padding-bottom: 15px;">분류</th>
                            <td>     
                                <select class="form-control" name="type" id="#">
									<option>시공</option>
									<option>도배</option>
									<option>타일</option>
									<option>건축자재</option>
									<option>건축설비</option>
									<option>장판</option>
									<option>필름시트</option>
								</select>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2"> 
                            	<div class="quiz-content-wrap">
                            		<div contentEditable="true" id="textArea" class="boast_inwrite" ><p id="content"></p></div>
                            	</div>
                            	<!-- 이미지 미리보기 
                            		<div class="img-wrap inimg">
                            			<img id="img" />
                            		</div>
                            	 -->
                                <input type="file" id="input_img" name="file">
                            </td>
                        </tr>
                    </tbody>
                </table>
	        	<div class="btn-group btn-group-sm" role="group" aria-label="..."> 
	            	<input type="submit" id="regist-btn" class="btn btn-primary btns" value="글쓰기"> 
	            </div>
            </div>
        </div>
    </form>

</body>

<script>
	
	// jquery start
	$(function() {
		
		// 글 내용 보내기
		$('#regist-btn').click(function() {
			const content = $('#content').text();
			console.log(content);
			$('input[name=content]').val(content);
		});
		
		
		// div값 p태그로 옮기기
		var contents;
		$('.quiz-content-wrap').on('keyup', function() {
			const textArea = $('#textArea').text();
			contents = textArea  
			$('#content').text(contents);
			
		});
		<%-- 이미지 미리보기 --%>
		var sel_file;
		var strAdd;
		
		$('#input_img').change(function(e) {
			
			strAdd += "<div class='img-wrap'>";
			strAdd += "<img src='' id='img' class='inimg' />";
			strAdd += "</div>";
			$('#content').html(strAdd);
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			
			filesArr.forEach(function(f) {
				if(!f.type.match(reg)){
					alert('이미지파일만 업로드 가능합니다.');
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#img').attr("src", e.target.result); // 읽은 파일 결과
				}
				reader.readAsDataURL(f);
			});
		}); // 이미지 파일 값 변경 시 수행
		
		
		
	}); // jquery end

</script>


</html>
