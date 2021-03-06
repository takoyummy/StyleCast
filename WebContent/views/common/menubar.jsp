<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.stylecast.member.vo.Member"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	String adminYN = "N";
	String memName = null;
	if(loginUser!=null){
		adminYN = loginUser.getAdminYN();
		memName = loginUser.getMemName();
	}
%>
<!DOCTYPE html>
<html >
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <!--돋보기 이미지-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    <!--돋보기 이미지end-->
    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <!--font end-->
    <title>Document</title>
    
    <style>
        
        
        #header{height:156px; width:1200px; margin: auto; font-family: 'Noto Sans KR', sans-serif;}

        #header>div{float:left;}

        #header_1{width:22%; height:90%}
        #logoimg{
            height:100px; 
            width:100%; 
            margin-top: 25px;
            }

        #header_2{width:48%;height:90%}
        #header_2>div{
            height:auto; 
            margin-left:55px; 
            padding-top:55px; 
            float:left;
            }
        #header_2>div>a{
            text-decoration:none; 
            color:black;
            font-weight: 500;
            }

        #header_3{width:20%; height:90%;}
        .search-box{
            padding: 10px;
            margin-top:55px;
            margin-left:100%;
            top: 50%;
            left: 50%;
            transform: translate(-100%,-0%);
            height: 40px;
            background-color: #fff;
            border: 1px solid black;
            border-radius: 30px;
            transition: 0.4s;
            width:40px;
        }
        .search-box:hover{
            box-shadow: 0px 0px .5px 1px black;
            width: 250px;
        }
        .search-btn{
            text-decoration: none;
            float: right;
            width: 18px;
            height: 18px;
            background-color: #fff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: black;
        }
        .search-box:hover > .search-btn{
            background-color: #fff;
        }
        .search-txt{
            display: flex;
            padding: 0;
            width: 0px;
            border:none;
            background: none;
            outline: none;
            float: left;
            font-size: 10px;
            line-height: 20px;
            transition: .4s;
        }
        .search-box:hover > .search-txt{
            width: 210px;
            padding: 0 6px;
        }

        #header_4{width:10%; 
            height:100%; 
            text-align: center; 
            position: relative; 
            z-index: 1;
            }
        #login{
            border-radius:5px; 
            border:none; padding:7px 10px;
            font-size: 15px;
            margin-top: 56px;
            }

        #navi{
            list-style-type:none;
            margin:0;
            padding:0;
            height:100%;
            font-weight:300;
        }
        #navi>li{
            float: left;
            width:100%;
            height:100%;
            text-align:center;
        }
        #navi a{
            text-decoration:none;
            font-size:10px;
            color:white;
            font-weight:900;
            display:block;
            transform:scale(1);
        }
        #profile{margin-top:50px;
            margin-left:35px;
            height:50px;
            width:50px;
            }
        #hide{width:120px; 
            height:105px; 
            background-color:darkgray;
            }
        #hide>div{
            width:100%;
            height: 33%;
            padding-top:10px;
            }
        #hide a{font-weight: 300;}
        #bookmk,#logout{margin-top:10px;}

        #profile>img{width:50px; height:50px;}
        #profile>div{width:50px; height:20px;}
        #hide a:hover{color: rgb(241, 196, 15);}
        #navi>li>ul{
            list-style-type:none;
            padding:0;
            display:none;
        }
        #navi>li>ul a{font-size:15px;}
        #navi>li>div:hover+ul{display:block;}
        #navi>li>ul:hover{display:block; }

        #header_6{
            width:100%; 
            height:1%; 
            background-color: gray;
            }

    </style>
</head>
<body>

	<script>
		var msg = "<%= alertMsg %>";
		// var msg = "메세지" / "null"
		
		if(msg != "null"){
			alert(msg);
			// 알람창 띄워준 후 session에 담긴 해당 메세지는 지워줘야 됨
			// 안그러면 menubar.jsp가 로딩될때마다 매번 alert가 계속 뜸
			<% session.removeAttribute("alertMsg"); %>
		}
		
		function searchData(){ // 검색창 enter시 검색하는 기능
			document.getElementById("search-form").submit();
		}
		function formSubmit(){
				document.getElementById("search-form").submit();
		}	
	</script>

        <div id="header">
            <div id="header_1">
                <a href="<%= contextPath %>"><img id="logoimg"src="<%=contextPath %>/resources/images/logo.jpg"></a>
                    <input id="contextpath" type="hidden" value="<%= contextPath %>">
            </div>

            <div id="header_2">
                <div id="daily"><a href="<%=contextPath%>/list.da?currentPage=1"><font size="5px" id="font_daily">Daily</font></a></div>
                <div id="trending"><a href="<%=contextPath%>/list.th"><font size="5px" id="font_trending">Trending</font></a></div>
                <div id="qna"><a href="<%= contextPath %>/list.qna?currentPage=1"><font size="5px" id="font_qna">QnA</font></a></div>
                <div id="notice"><a href="<%= contextPath %>/list.no?currentPage=1"><font size="5px" id="font_notice">Notice</font></a></div>
            </div>

            <div id="header_3">
            	<form id="search-form" name="search-form" action="<%= contextPath %>/search.ma?currentPage=1" method="post" onsubmit="return false">
	                <div class="search-box">
	                    <input type="text" class="search-txt" name="search_text" placeholder="Type to search" onkeypress="if(event.keyCode == 13){searchData();}" />
	                    <a class="search-btn" href="#" onclick="formSubmit(); return false;">
	                      <i class="fas fa-search"></i>
	                    </a>
	                </div>
                </form>
            </div>
            
            <div id="header_4">
                
               <% if(loginUser == null){ %>
                	<button type="button" id="login" onclick="loginPage();" class="btn btn-dark">로그인/가입</button>
               <% }else{ %>
  
	     		<ul id="navi">
	              	<li>
	                    <div>
	                    <% if(loginUser.getMemId().equals("admin")) { %>
	                        <a id="profile" href="<%= contextPath %>/myPage.me">
	                            <img src="<%= contextPath %>/<%= loginUser.getProfImg() %>" class="rounded-circle">
	                        </a>
	                    <% }else { %>
	                    	<a id="profile" href="<%= contextPath %>/myPage.me">
	                            <img src="<%= contextPath %>/<%= loginUser.getProfImg() %>" class="rounded-circle">
	                        </a>
	                    <% } %>
	                        <b><%= loginUser.getMemName() %></b>
	                    </div>
	                    <ul id="hide">
	                        <div id="mypage"><a href="<%= contextPath %>/myPage.me">마이페이지</a><div>
	                        <div id="bookmk"><a href="<%= contextPath %>/bookmark.me">북마크</a><div>
	                        <div id="logout"><a href="<%= contextPath %>/logout.me">로그아웃</a><div>
	                    </ul>
	        		</li>
	            </ul>
	          
                <% } %>
                <script>
                	function loginPage(){
                		location.href = "<%=contextPath%>/loginPage.me";
                	}
                </script>
            </div>
            <div id="header_6">
           	</div>       
        </div>
            	
            	<script>
            		// 프로필 이미지 갱신
            		$(function(){
            			
            			var cp = $("#contextpath").val();
            			
            			<% if(loginUser != null) {%>
            			$.ajax({
			        		url:"profImgSelect.me",
			        		data:{
			        			memNo:<%=loginUser.getMemNo()%>
			        		},
			        		type:"post",
			        		success:function(profImg){
								$("#header_4 #navi img").attr("src", cp + profImg);
			        		},error:function(){
			        			console.log("프로필 이미지 불러오기 실패");
			        		}
			        	})
			        	<%} %>
            		})
            	</script>
            	
</body>
</html>