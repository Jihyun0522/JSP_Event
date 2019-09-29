<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	background:url('https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=655&q=80') center center/cover no-repeat;
}

/* Add padding to containers */
.container {
  padding: 20px;
  background-color: rgba( 255, 255, 255, 0.5);
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
	background-color: rgba(173, 173, 173, 0.5);
  	text-align: center;
}

.content {
	width: 65%;
	margin: 0 auto;
	text-align: center;
	position: relative;
}

form {
	border: 3px solid #f1f1f1;
	text-align: center;
	vertical-align: middle;
	background-color: rgba( 255, 255, 255, 0.5);
}

.labelText {
	text-align: left; 
	margin-left: 3%;
}

.alert {
	padding: 5px;
	margin: 5px 20px;
	border-radius: 5px;
}

.alert-success {
	background: #a5e8ba;
}

.alert-danger {
	background: #ffabab;
}
</style>
<script>
	$(document).ready(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
            var pwd1=$("#pwd1").val();
            var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
	});
</script>
<body>
	<div class="content">
		<form action="registerProc.jsp" method="post">
			<div class="container">
				<h1>회원가입</h1>
				<p>개인정보는 회원님의 동의 없이 공개되지 않습니다.</p>
				<hr>
				
				<div class="labelText">
					<label for="name"><b>이름</b></label>
				</div>
				<input type="text" name="name" placeholder="이름을 입력하세요." required> 
				<div class="labelText">
					<label for="id"><b>아이디</b></label>
				</div> 
				<input type="text" name="id" placeholder="아이디를 입력하세요." required> 
				<div class="labelText">
					<label for="psw"><b>비밀번호</b></label>
				</div> 
				<input type="password" name="passwd" placeholder="비밀번호를 입력하세요." id="pwd1" required> 
				<div class="labelText">
					<label for="psw-repeat"><b>비밀번호 확인</b></label>
				</div> 
				<input type="password" name="psw-repeat" placeholder="비밀번호를 다시 입력해주세요." id="pwd2" required>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				<button type="submit" class="registerbtn" id="submit">가입하기</button>
			</div>
	
			<div class="container signin">
				<p>
					Already have an account? <a href="login.jsp">LOGIN</a>.
				</p>
			</div>
		</form>
	</div>
</body>