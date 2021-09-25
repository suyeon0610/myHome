<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>  ȸ������(������)  </title> 
  <link rel="shortcut icon" href="../img/home-icon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
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
    .invalid-checkbox{
      border: #000 solid;
      border-radius: 10px;
      background-color:#92b5db ;
    }
    .code{
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">ȸ������</h4>
        <form action="userJoin" method="post" class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3"> <label for="name">�̸�</label> <input type="text" class="form-control" id="name"
                placeholder="" value="" required name="name">
              <div class="invalid-feedback"> �̸��� �Է����ּ���. </div>
            </div>
            <div class="col-md-6 mb-3"> <label for="nickname">�г���</label> <input type="text" class="form-control"
                id="nickname" placeholder="" value="" required name="nickName">
              <div class="invalid-feedback"> �г����� �Է����ּ���. </div>
            </div>
          </div>
          <div class="mb-3"> <label for="email">�̸���</label> <input type="email" class="form-control" id="email"
              placeholder="you@example.com" required name="id">
            <div class="invalid-feedback"> �̸����� �Է����ּ���. </div>
          </div>
          <span id="msgId"></span>
          <div class="col-md-6 mb-3"> <label for="email-code">�����ڵ�</label> <input type="text" class="form-control"
            id="email-code" placeholder="" value="" required>
            <button class="btn btn-primary code" id="sendCode" type="button">������ȣ�߼�</button>
            <span id="codeChk">codeChk</span>
          </div>  
          <div class="mb-3"> <label for="password">��й�ȣ</label> <input type="password" class="form-control" id="pw"
            placeholder="��й�ȣ�� �����ּ���" required name="pw">
          <div class="invalid-feedback"> ��й�ȣ. 
          </div>
          <span id="msgPw">����˸�</span>
          <div class="mb-3"> <label for="passwordCH">��й�ȣȮ��</label> <input type="password" class="form-control" id="pwChk"
            placeholder="��й�ȣ�� �ٽ� �ѹ� �����ּ���" required>
          <div class="invalid-feedback"> ��й�ȣ Ȯ�����ּ���. 
          </div>
          <span id="msgPwChk">���Ȯ�ξ˸�</span>
          <div class="mb-3"><label for="phoene">��ȭ��ȣ</label> <br>
            <select id="mPhone1" name="phone1">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select>-
            <input id="mPhone2" name="phone2" type="number" value="" size="2" maxlength="4" autocomplete="off">-
            <input id="mPhone3" name="phone3" type="number" value="" size="2" maxlength="4" autocomplete="off">
        </div>
		<div class="mb-3"> <label for="address">�׽�Ʈ�� �����ȣ</label> <input type="text" class="form-control" id="address"
              placeholder="����Ư���� ������" required name="zipNum">
            <div class="invalid-feedback"> �׽�Ʈ�� �����ȣ </div>
          </div>

          <div class="mb-3"> <label for="address">�ּ�</label> <input type="text" class="form-control" id="address"
              placeholder="����Ư���� ������" required name="addrBasic">
            <div class="invalid-feedback"> �ּҸ� �Է����ּ���. </div>
          </div> 
          <div class="mb-3"> <label for="address2">���ּ�<span class="text-muted">&nbsp;(�ʼ� �ƴ�)</span></label> <input
              type="text" class="form-control" id="address2" placeholder="���ּҸ� �Է����ּ���." name="addrDetail"> </div>
          <div class="row">
            <div class="col-md-8 mb-3"> <label for="Attention">�����о�</label>
               <div class=invalid-checkbox>
                  <label><input type="checkbox" name="major" value="major-1">�ð�</label>
                  <label><input type="checkbox" name="major" value="major-2">Ÿ��</label><br>
                  <label><input type="checkbox" name="major" value="major-3">��������</label>
                  <label><input type="checkbox" name="major" value="major-4">���༳��</label><br>
                  <label><input type="checkbox" name="major" value="major-6">����</label>
                  <label><input type="checkbox" name="major" value="major-7">âƲ</label>
                  <label><input type="checkbox" name="major" value="major-8">����Ʈ</label>
               </div>
               <div class="col-md-8 mb-3"><label>��������</label>
               <form  action="#" method="post" enctype="#">
                <input type="file" name="profile" multiple>
              </div>
              </select>
              
            </div>
           
          <div class="mb-4"></div> <button class="btn btn-primary btn-lg btn-block" type="submit" id="joinButton">���� �Ϸ�</button>
        </form>
      </div>
    </div>
  </div>
<script>

/*�̸��������ڵ�����*/

var code = "";
$('#sendCode').click(function() {
	if($('#email').val() === '') {
		alert('���̵�(�̸���)�� �Է����ּ���.');
		return;
	}
	const id = $('#email').val();
	$.ajax({
		type: "post",
		url: "/user/mailCheck",
		data: id,
		headers: {
			"Content-type" : "application/json"
		},
		success: function(data) {
			code = data;
			console.log(code);
		},
		error: function() {
			alert('�������� �Դϴ�. �����ڿ��� �����ϼ���.');
		}
	});	
});

/* ������ȣ �� */

var inputCode = document.getElementById("email-code");
inputCode.onkeyup = function(){
	if( code === document.getElementById("email-code").value ){
		document.getElementById("email-code").style.borderColor = "green";
		document.getElementById("codeChk").innerHTML = "������ȣ�� ��ġ�մϴ�";
	} else {
		document.getElementById("email-code").style.borderColor = "red";
		document.getElementById("codeChk").innerHTML = "������ȣ�� ��ġ���� �ʽ��ϴ�";
	}
}

/*���̵� ����(�̸���) �˻� ��ũ��Ʈ*/
var id = document.getElementById("email");
id.onkeyup = function() {
    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regex.test(document.getElementById("email").value )) {
        document.getElementById("email").style.borderColor = "green";
    } else {
        document.getElementById("email").style.borderColor = "red";
        document.getElementById("msgId").innerHTML = "���Ŀ� ���� �ʴ� �̸����Դϴ�"; //�����������ʿ�
    }
}
/*��й�ȣ ���� �˻� ��ũ��Ʈ*/
var pw = document.getElementById("pw");
pw.onkeyup = function(){
    var regex = /^[A-Za-z0-9+]{8,16}$/;
     if(regex.test(document.getElementById("pw").value )) {
        document.getElementById("pw").style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "��밡���մϴ�";
    } else {
        document.getElementById("pw").style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "��й�ȣ�� 8�� �̻��̾�� �մϴ�.";
    }
}
/*��й�ȣ Ȯ�ΰ˻�*/
var pwConfirm = document.getElementById("pwChk");
pwConfirm.onkeyup = function() {
    var regex = /^[A-Za-z0-9+]{8,16}$/;
    if(document.getElementById("pwChk").value == document.getElementById("pw").value ) {
        document.getElementById("pwChk").style.borderColor = "green";
        document.getElementById("msgPwChk").innerHTML = "��й�ȣ�� ��ġ�մϴ�";
    } else {
        document.getElementById("pwChk").style.borderColor = "red";
        document.getElementById("msgPwChk").innerHTML = "��й�ȣ Ȯ�ζ��� Ȯ���ϼ���";
    }
}

</script>


</body>

</html>