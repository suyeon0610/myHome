<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ȸ������(������ȸ��)</title>
<link rel="shortcut icon" href="../img/home-icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#fff),
		to(#fff));
	background: -webkit-linear-gradient(bottom left, #fff 0%, #fffc 100%);
	background: -moz-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: -o-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: linear-gradient(to top right, #fff 0%, #fff 100%);
}
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.invalid-checkbox {
	border: #000 solid 1px;
	border-radius: 10px;
	background-color: #fff;
	width: 50%;
}
.code {
	margin-top: 32px;
}
.checkcss {
	margin: 5px;
}
.ka-api {
	margin: 5px;
}
.code2 {
	margin: 0 0 20px 20px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">ȸ������(������ȸ��)</h4>
				<form action="<c:url value='/user/userJoin' />" method="post"
					class="validation-form" novalidate enctype="multipart/form-data"
					onsubmit="return formcheck()" name="fc">
					<div class="mb-3">
						<label for="email">�̸���</label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com"
							required name="id"> <span id="msgId"></span>
						<div class="invalid-feedback">�̸����� �Է����ּ���.</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="emailCode">�����ڵ�</label> <input type="text"
								class="form-control" id="emailCode" placeholder="" value=""
								required name="emailCode"> <span id="msgCodeChk"></span>
						</div>

						<div class="col-md-6 mb-3">
							<button class="btn btn-info code" type="button" id="codeChk"
								style="display: none">Ȯ��</button>
						</div>
						<button class="btn btn-info code2" type="button" id="sendCode">�̸���
							�����ڵ� �߼��ϱ�</button>
					</div>



					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">�г���</label> <input type="text"
								class="form-control" id="nickName" placeholder="(2~15��)"
								value="" required name="nickName"> <span id="msgNickChk"></span>
							<span id="msgNick"></span>
							<div class="invalid-feedback">�г����� �Է����ּ���.</div>
						</div>
						<div class="col-md-6 md-3">
							<button class="btn btn-info code" type="button" id="nickChk">�ߺ�Ȯ��</button>
						</div>
					</div>
					<div class="mb-3">
						<label for="password">��й�ȣ</label> <input type="password"
							class="form-control" id="pw" placeholder="��й�ȣ�� �����ּ���" required
							name="pw"> <span id="msgPw"></span>
						<div class="invalid-feedback">��й�ȣ.</div>
						<div class="mb-3">
							<label for="passwordCH">��й�ȣȮ��</label> <input type="password"
								class="form-control" id="pwChk" placeholder="��й�ȣ�� �ٽ� �ѹ� �����ּ���"
								required name="pwChk"> <span id="msgPwChk"></span>
							<div class="invalid-feedback">��й�ȣ Ȯ�����ּ���.</div>
							<div class="mb-3">
								<label for="phoene">��ȭ��ȣ</label> <br> <select id="phone1"
									name="phone1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>- <input id="phone2" name="phone2" type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=""
									size="2" maxlength="4" autocomplete="off">- <input
									id="phone3" name="phone3" type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=""
									size="2" maxlength="4" autocomplete="off">
							</div>

							<input class="ka-api" type="text" id="sample6_postcode"
								placeholder="�����ȣ" name="zipNum"> <input class="ka-api"
								type="button" onclick="sample6_execDaumPostcode()"
								value="�����ȣ ã��"><br> <input class="ka-api"
								type="text" id="sample6_address" placeholder="�ּ�"
								name="addrBasic"><br> <input class="ka-api"
								type="text" id="sample6_detailAddress" placeholder="���ּ�"
								name="addrDetail"> <input class="ka-api" type="text"
								id="sample6_extraAddress" placeholder="�����׸�" readonly>

							<div class="row">
								<div class="col-md-8 mb-3">
									<label for="Attention">�����о� </label>
									<<div class=invalid-checkbox>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major1"> �ð�</label>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major2"> Ÿ��</label><br>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major3"> ��������</label>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major4"> ���༳��</label><br>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major5"> âȣ/����</label>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major6"> ����</label><br>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major7"> âƲ</label>
                                      <label><input class="checkcss" type="checkbox" name="major" value="major8"> ����Ʈ</label>
                                    </div>
                                    <div class="col-md-8 mb-3"><label>��������</label>
                                        <input type="file" name="file" multiple>
                                    </div>
								<button class="btn btn-info btn-lg btn-block" type="submit">�����ϱ�</button>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>



</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* submit formcheck */
function formcheck(){
	/*1.����üũ*/
	  if(fc.id.value === '') {
		  alert("�̸����� �Է����ּ���.");
	      fc.id.focus();
	      return false;
	  } else if(fc.emailCode.value === '') {
		  alert("�̸��� �����ڵ带 Ȯ�����ּ���");
		  fc.emailCode.focus();
		  return false;
	  } else if(fc.nickName.value === '') {
		  alert("�г����� �Է����ּ���");
		  fc.nickName.focus();
		  return false;
	  } else if(fc.pw.value === '') {
		  alert("��й�ȣ�� �Է����ּ���");
		  fc.pw.focus();
		  return false;
	  } else if(fc.pwChk.value === '') {
		  alert("��й�ȣ�� �Է����ּ���");
		  fc.pwChk.focus();
		  return false;
	/*2.�ùٸ��������Է°�*/
	  } else if(document.getElementById("sendCode").innerHTML != "�����Ǿ����ϴ�") {
		  alert("�̸��� ������ �������ּ���")
		  fc.emailCode.focus();
		  return false;
	  } else if(fc.pw.value != fc.pwChk.value){
		  alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�")
		  fc.pw.focus();
		  return false;
	  } else if(document.getElementById("nickName").style.borderColor != "green"){
		  alert("�г��� �ߺ�Ȯ���� ���ּ���")
		  fc.id.focus();
		  return false;
	  } else {
		  alert('ȸ�������� �Ϸ�Ǿ����ϴ�. �α���â���� �̵��մϴ�');
		  return true;
	  }
}
/*�г��� �ߺ�Ȯ��*/
$('#nickChk').click(function(){
	if($('#nickName').val() === ''){
		alert('�г����� �Է����ּ���');
		return;
	}
	const nickName = $('#nickName').val();
	$.ajax({
		type: "post",
		url: "<c:url value='/user/nickCheck' />",
		data: nickName,
		headers: {
			"Content-type" : "application/json"
		},		
		success: function(data){
			if(data === 'exist') {
				alert('�̹� �����ϴ� �г����Դϴ�');
				document.getElementById("nickName").style.borderColor = "red";
				document.getElementById('msgNick').innerHTML = '�̹� �����ϴ� �г����Դϴ�';
			} else if(data === 'ok') {
				alert('��밡���� �г����Դϴ�');
				document.getElementById("nickName").style.borderColor = "green";
				document.getElementById('msgNick').innerHTML = '��밡���� �г����Դϴ�';
			} 
		}
	});
});
/*�̸��� �����ڵ� �߼�*/
var code = "";
$('#sendCode').click(function() {
	if($('#email').val() === '') {
		alert('���̵�(�̸���)�� �Է����ּ���.');
		return;
	} 
	$("#sendCode").attr('disabled', true);
	const id = $('#email').val();
	$.ajax({
		type: "post",
		url: "<c:url value='/user/idCheck' />",
		data: id,
		headers: {
			"Content-type" : "application/json"
		},
		success: function(data) {
			if(data === 'send'){
				$.ajax({
					type: "post",
					url: "<c:url value='/user/mailCheck' />",
					data: id,
					headers: {
						"Content-type" : "application/json"
					},
					success: function(data) {
						if(data != 'notvalid'){
							$('#codeChk').show();
							code = data;
							alert('������ȣ�� �߼۵Ǿ����ϴ� �̸����� Ȯ�����ּ���');
							document.getElementById("sendCode").innerHTML = "������ȣ�� �߼۵Ǿ����ϴ�";
							document.getElementById("sendCode").style.backgroundColor = "gray";
						} else {
							alert('��ȿ���� ���� �̸����Դϴ�');
							$("#sendCode").attr('disabled', false);
						}
					},
					error: function() {
						alert('�������� �Դϴ�. �����ڿ��� �����ϼ���.');
					}
				});	
			} else if(data === 'exist') {
				alert('�̹� ���Ե� �̸����Դϴ�');
				$("#sendCode").attr('disabled', false);
			}
			
		},
		error: function() {
			alert('�������� �Դϴ�. �����ڿ��� �����ϼ���.');
		}
	});	
});
/* ������ȣ Ȯ�� */
var inputCode = document.getElementById("emailCode");
$('#codeChk').click(function(){
	if( code === document.getElementById("emailCode").value ){
		$('#email').attr('readonly', true);
		$('#emailCode').attr('readonly', true);
		$('#codeChk').hide();
		document.getElementById("sendCode").innerHTML = "�����Ǿ����ϴ�";
	} else {
		alert('������ȣ�� ��ġ���� �ʽ��ϴ� �̸����� Ȯ�����ּ���');
		$('#emailCode').focus();
	}
});
/*���̵� ����(�̸���) �˻� ��ũ��Ʈ*/
var id = document.getElementById("email");
id.onkeyup = function() {
    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regex.test(document.getElementById("email").value )) {
        document.getElementById("email").style.borderColor = "green";
        document.getElementById("msgId").innerHTML = "��밡���� �̸����Դϴ�."; 
    } else {
        document.getElementById("email").style.borderColor = "red";
        document.getElementById("msgId").innerHTML = "���Ŀ� ���� �ʴ� �̸����Դϴ�";
    }
}
/*��й�ȣ ���� �˻� ��ũ��Ʈ*/
var pw = document.getElementById("pw");
pw.onkeyup = function(){
    var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
     if(regex.test(document.getElementById("pw").value )) {
        document.getElementById("pw").style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "��밡���մϴ�";
    } else {
        document.getElementById("pw").style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "��й�ȣ�� ����, ����, Ư�����ڸ� ȥ���Ͽ� 8~20�ڸ� �̳����� �մϴ�(��밡�� Ư������ !@#$%^&*)";
    }
}
/*��й�ȣ Ȯ�ΰ˻�*/
var pwConfirm = document.getElementById("pwChk");
pwConfirm.onkeyup = function() {
    var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
    if(document.getElementById("pwChk").value == document.getElementById("pw").value ) {
        document.getElementById("pwChk").style.borderColor = "green";
        document.getElementById("msgPwChk").innerHTML = "��й�ȣ�� ��ġ�մϴ�";
    } else {
        document.getElementById("pwChk").style.borderColor = "red";
        document.getElementById("msgPwChk").innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
    }
}
/*�г��� ���İ˻�*/
var nform = document.getElementById("nickName");
nform.onkeyup = function() {
	var regex = /^.{2,15}$/;
	if(!regex.test(document.getElementById("nickName").value )){
		document.getElementById("nickChk").setAttribute("disabled", "disabled");
		document.getElementById("nickName").style.borderColor = "red";
		document.getElementById("msgNick").innerHTML = "�г����� 2~15�� �̳������մϴ�";
	} else {
		document.getElementById("nickName").style.borderColor = "#008001";
		document.getElementById("msgNick").innerHTML = "";
		document.getElementById('nickChk').removeAttribute("disabled");
	}
	
}
/* �ּ�ã�� */
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
        // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
        // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
        var addr = ''; // �ּ� ����
        var extraAddr = ''; // �����׸� ����
        //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
        if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
          addr = data.roadAddress;
        } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
          addr = data.jibunAddress;
        }
        // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
        if (data.userSelectedType === 'R') {
          // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
          // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
          if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
          document.getElementById("sample6_extraAddress").value = extraAddr;
        } else {
          document.getElementById("sample6_extraAddress").value = '';
        }
        // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
</script>

</html>