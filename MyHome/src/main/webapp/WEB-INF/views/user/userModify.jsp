<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 회원정보 수정 </title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/resources/css/correction.css" rel="stylesheet">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
  
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원정보 수정</h4>
        <form action="<c:url value='/user/userModify' />" method="post" enctype="multipart/form-data" class="validation-form" novalidate>
          <div class="row">

            <div class="mb-3"> <label for="nickname">닉네임</label> 
            	<input type="text" class="form-control" id="id" value="${userInfo.nickName }" readonly required>

              <div class="mb-3"> 
              	<label for="password">비밀번호</label> 
              		<input type="password" class="form-control" id="pw" placeholder="비밀번호를 적어주세요" required>
                <div class="invalid-feedback"> 비밀번호.
                </div>
                <div class="mb-3"> 
                	<label for="passwordCH">비밀번호확인</label> 
                		<input type="password" class="form-control" id="pw" placeholder="비밀번호를 다시 한번 적어주세요" required>
                  <div class="invalid-feedback"> 비밀번호 확인해주세요.
                  </div>
                  <div class="mb-3">
                  <label for="phoene">전화번호</label> <br>
                    <select id="mPhone1" name="phone1">
                      <option value="010" ${userInfo.phone1==010?selected:'' }>010</option>
                      <option value="011">011</option>
                      <option value="016">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select>-
                    <input id="mPhone2" name="phone2" type="text" value="${userInfo.phone2 }" size="2" maxlength="4"autocomplete="off">-
                    <input id="mPhone3" name="phone3" type="text" value="${userInfo.phone3 }" size="2" maxlength="4" autocomplete="off">
                  </div>

                  <input class="ka-api" type="text" id="sample6_postcode" name="zipNum" value="${userInfo.zipNum }" placeholder="우편번호">
                  <input class="ka-api" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                  <input class="ka-api" type="text" id="sample6_address" name="addrBasic" value="${userInfo.addrBasic }"><br>
                  <input class="ka-api" type="text" id="sample6_detailAddress" name="addrDetail" value="${userInfo.addrDetail }">

                  <div class="user-img">
                    <div class="user-img user-title">프로필 이미지</div>
                    <div id="holder"></div>
                    <textarea rows="5" cols="80" name="contents">
                    </textarea><br>
                      <input type="file" name="file">
                </div>



                  <div class="row">
                    <div class="col-md-8 mb-3"> <label for="Attention">관심분야</label>
                      <div class=invalid-checkbox>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-1">가구</label>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-2"> 패브릭</label><br>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-3"> 조명</label>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-4"> 장식/소품</label><br>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-5"> 가전</label>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-6"> 생필품</label><br>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-7"> 캠핑용품</label>
                        <label><input class="checkcss" type="checkbox" name="interest" value="Attention-8"> 주방용품</label>
                      </div>
                    </div>
                 </div>

                    <div class="mb-4"></div> <button class="btn btn-info btn-lg btn-block" type="submit">수정 완료</button>
        </form>
      </div>
    </div>
  </div>



</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // 조합된 참고항목을 해당 필드에 넣는다.
          document.getElementById("sample6_extraAddress").value = extraAddr;

        } else {
          document.getElementById("sample6_extraAddress").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
  
  // jquery start
  $(function() {
	  
	  const interests = '${userInfo.interest}'.split(',');
	  console.log(interests)
	  
	  for(var i=0; i<interests.length; i++) {
		  for(var j=0; j<$('.checkcss').length; j++) {
			  if(interests[i] == $('.checkcss')[j].val()) {
				  $('.checkcss')[j].attr('checked', 'checked');
			  }
		  }
	  }
	
}); //end jquery
</script>
</html>