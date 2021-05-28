<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleCast</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <style>
        /*div{border: 1px solid gray; box-sizing: border-box;}*/
        *{font-family: 'Noto Sans KR', sans-serif;}
        #background { 
			margin: auto;
			background-repeat:no-repeat;
			background-position:0 0;
			background-size:100% 100%;
		}
        .wrap{
            width:1200px;
            height:1300px;
            margin: auto;
            position: relative;
        }
        .wrap>#box{
            width: 350px;
            height: 700px;
            top: 350px;
            left: 425px;
            position: absolute;
            border-radius: 20%;
            background-color: white;
            font-size: 16px;
            text-align: center;
        }
        #box_wrap{margin-top: 20px;}

        #enroll_form>h2{margin: auto; font-weight:bold; color: gray;}

        #enroll_form_input_info>input[type = text], input[type = password]{width: 300px; height: 35px; margin: auto;}
        #enroll_form_input_info>input[type = email]{width: 52.6%; height: 35px; margin-right: 115px; display: inline-block;}
        #enroll_form_input_info>#emailAuthenticate{position: absolute; margin-left: -30%;}

        #enroll_form_input_info>#userId, #userNname{margin-bottom: 8px;}
        #enroll_form_input_info>a{color: gray;}
        #enroll_form_input_info>h6{color: black; font-weight: bold;}
        #enroll_form_input_info>button:hover{cursor: pointer;}

    </style>
     <script>

	    $(document).ready(function(){ 
	        
		    var numberOfImages=3; 
		    var imageNum = Math.round(Math.random()*(numberOfImages-1))+1;
		    var imgPath=('./resources/images/login_img/img_'+imageNum+'.jpg');
		    $('#background').css('background-image', ('url("'+imgPath+'")'));
		     
		    });
		    
  	</script>
</head>
<body> 
	
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="wrap" id="background">
        <div id="box">
            <div id="box_wrap">
                <div id="logo">
                    <a href="">
                        <img src="resources/image/logo.jpg" alt="로고입니다" width="60%">
                    </a>
                </div>
                <div id="enroll_form">
                    <h2>가입</h2><br>
                    <form action="<%= contextPath %>/insert.me" id="enroll_form_input" method="post">
                        <div id="enroll_form_input_info">
                            <input type="text" id="userId" name="memId" class="form-control" placeholder="ID" maxlength="12" required>
                            <input type="email" name="email" class="form-control" placeholder="E-mail" required>
                            <input type="button" class="btn btn-secondary btn-sm" name="emailAuthenticate" id="emailAuthenticate" value="재전송">
                            <br><br>
                            <input type="text" name="authenticateNumber" class="form-control" id="authenticateNumber" style="width: 35%; margin-right: 5px; display: inline-block;" placeholder="인증번호" required>
                            <input type="button" style="margin-right: 90px; margin-bottom: 10px; width: 80px;"class="btn btn-secondary btn-sm" name="emailAuhenticate" id="emailAuhenticate" value="확인">
                            <br><br>
                            <input type="password" name="memPwd" class="form-control" style="margin-bottom: 3px;" placeholder="비밀번호(8자 이상 영문/숫자/특수문자)" maxlength="15" required>
                            <input type="password" class="form-control" placeholder="비밀번호확인" maxlength="15" required>
                            <br>
                            <input type="text" id="userNname" name="memName" class="form-control" placeholder="닉네임" required>
                            <br>
                            <input type="radio" class="form-check-input" name="gender" value="M" checked> <label for="radioM">남자</label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="form-check-input" name="gender" value="F"> <label for="radioF">여자</label>
                            <br>
                            <input type="checkbox" class="form-check-input" name="form" id="infoForm" value="infoForm" required>
                            <a href="">개인정보 처리방침 동의</a>
                            <br>
                            <input type="checkbox" class="form-check-input" name="form" id="serviceForm" value="serviceForm" required>
                            <a href="" style="margin-right: 18%;">사용약관 동의</a>
                            <br>
                            <button type="submit" class="btn btn-dark" style="width: 130px;">가입</button>
                            <br><br>
                            <a href="<%=contextPath%>/login.me">여기서 로그인</a>
                            <br>
                            <h6> 이용 중 도움이 필요하시면<br>
                            help@stylecast.com으로 문의해 주세요.</h6>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>