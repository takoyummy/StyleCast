<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.stylecast.common.model.vo.PageInfo, com.stylecast.daily.model.vo.Report, java.util.ArrayList" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int brCategory = (int)request.getAttribute("brCategory");
%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!--bootstrap-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
        <!--bootstrap end-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!--font-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
            rel="stylesheet">
        <!--font end-->

        <style>

            div {
                /*border: 1px solid black;*/
                box-sizing: border-box;
            }

            * {
                font-family: 'Noto Sans KR', sans-serif;
            }

            .wrap {
                width: 1200px;
                height: 1300px;
                margin: auto;
            }

            .wrap > div {
                width: 100%;
            }
            /* table {
                overflow: auto;
            } */
            table {
                border-collapse: collapse;
            }
            table th {
                position: sticky;
                top: 0;

            }
            table tr:hover {
                cursor: pointer;
            }

            table thead th {
                text-align: center;
            }
            table tbody tr td {
                text-align: center;
            }
        
       		.hidden-col{display: none;}
            
            #table_box {
                width: 100%;
                height: 70%;
            }
            #header {
                height: 12%;
            }
            #content {
                height: 88%;
                width: 90%;
                margin: auto;
            }
            #content > div {
                float: left;
                height: 100%;
            }

            #side {
                width: 20%;
            }
            #form {
                width: 80%;
                padding-top: 40px;
            }

            #menu {
                margin-top: 10%;
                width: 99%;
                float: left;
                padding-left: 10px;
            }
            #menu div {
                width: 100%;
                margin-bottom: 40px;
            }
            #menu a {
                color: black;
                text-decoration: none;
            }
            #line {
                width: 1.5px;
                height: 80%;
                float: right;
                background: lightgrey;
            }

            #line2 {
                width: 100%;
                height: 1.5px;
                background-color: lightgray;
            }

            #content_of_form {
                height: 73%;
                padding-left: 50px;
                /*overflow: auto;*/
            }
            #blank_box {
                height: 8%;
            }
            #search_box {
                display: inline-flex;
                float: right;
                margin-bottom: 10px;
            }
            #img_btn {
                background-color: white;
                border: none;
            }
            #input_search {
                width: 200px;
            }
            #post_btn {
                margin-right: 7px;
            }
            #warn_btn {
                float: right;
                margin-left: 7px;
            }
            #delete_rept_btn {
                float: right;
            }
            #warn_box {
                height: 70px;
      	  .hidden-col{display: none;}
            /* #table_body {
                overflow: auto;
            }
            #table_box {
                overflow: auto;
            } */
            #prof_img {
                height: 70%;
                padding: 20px;
            }
        	#prof_img>img{width: 100px; height: 100px;}
            #prof {
                height: 17%;
                width: 99%;
                float: left;
            }
            #menu div,
            #prof div {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <!--???????????? ?????? ???-->
        <!--modal form submit??? ?????? ???-->
        <!-- https://codevang.tistory.com/287 -->
        <!--??????????????????????????? form?????? -->
        <!--https://all-record.tistory.com/172-->
        
        <%@ include file="../common/menubar.jsp" %>
        
        <div class="wrap">

            <div id="content">
                <div id="side">

                    <div id="line"></div>
                    <div id="prof">
                        <div id="prof_img" align="center"><img src="<%= contextPath %>/<%= loginUser.getProfImg() %>" class="rounded-circle"/></div>
                        <div id="prof_nick" align="center"><b><%=loginUser.getMemName()%></b></div>
                    	<input id="contextpath" type="hidden" value="<%= contextPath %>">
                    </div>
                    <div id="menu">
                        <div>
                            <h4>
                                <a href="<%=contextPath%>/memlist.adm?blackListYN=N&&currentPage=1">????????????</a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="<%= contextPath %>/codilist.ad?currentPage=1">????????????</a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="<%= contextPath %>/trdlist.adm?currentPage=1">???????????????</a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="<%=contextPath%>/rptList.adm?brCategory=0&&currentPage=1">
                                    <b>???????????????</b>
                                </a>
                            </h4>
                        </div>
                    </div>
                </div>

                <script>
                    $("#menu a").click(function () {
                        $("#menu a").css("font-weight", "normal");
                        $(this).css("font-weight", "bold");
                    })
                </script>

                <div id="form">
                    <!-- <h2 style="text-align: center;"> <b>???????????????</b> </h2> -->
                    <!-- <br> <div id="line2"></div> -->
                    <div id="content_of_form">
                        <div id="blank_box">
                            <h5>
                                <b>????????? ??????</b>
                            </h5>
                        </div>
                        <div id="control_box">
                            <button type="button" class="btn btn-primary" id="post_btn">?????????</button>
                            <button type="button" class="btn btn-primary" id="comment_btn">??????</button>
            				<form action="<%= contextPath %>/rptSearch.adm" method="post">
	                            <div id="search_box">
	                                <select class="form-select" name="searchCategory">
	                                    <option selected="selected" value="mem_id">?????????</option>
	                                    <option value="rmem_id">????????????</option>
	                                    <option value="rpt_category">??????</option>
	                                </select>
	                                <input id="input_search" class="form-control" type="text" placeholder="????????????" name="searchText">
	                                <input type="hidden" name="boardCategory" value="<%=brCategory%>">
	                                <button id="img_btn" type="submit"><img src="<%=contextPath %>/resources/images/loupe.png"></button>
	                            </div>
                            </form>
                        </div>
                        <div id="table_box">
                            <form name="report_detail">
                                <table class="table table-hover">
                                    <thead class="table-secondary">
                                        <th></th>
                                        <th>?????????</th>
                                        <th>????????? ?????????</th>
                                        <th>??????</th>
                                        <th>?????????</th>
                                        <th colspan="2" class="hidden-col"></th>
                                    </thead>
                                    <tbody>
                                    
                                    <%if(list.isEmpty()){ %>
                                    <!-- ????????? ???????????? ?????? ?????? -->
										<tr>
				                            <td colspan="5">???????????? ???????????? ???????????? ????????????.</td>
				                            <td colspan="2" class="hidden-col"></td>
				                        </tr>
				                        
                                    <%} else{%>
                                    	<!-- ????????? ???????????? ?????? ?????? -->
                                    	<%for(Report report : list){ %>
	                                        <tr>
	                                            <td>
	                                                <input class="form-check-input" type="checkbox" name="rptNo" value="<%=report.getRptNo() %>"></td>
	                                            <td><%=report.getMemId() %></td>
	                                            <td><%=report.getrMemId() %></td>
	                                            <td><%=report.getRptCategory() %></td>
	                                            <td><%=report.getEnrDate() %></td>
                            					<td class="hidden-col"><%=report.getDailyNo() %></td>
                            					<td class="hidden-col"><%=report.getContent() %></td>
	                                        </tr>
                                        <%} %>
                                    <%} %>
                                    </tbody>
                                </table>

                            </form>

                        </div>
                        
                        <script>
                        	// ?????? ????????? ?????? ??????
                        	$("#post_btn").click(function(){
                        		location.replace("<%=request.getContextPath()%>/rptList.adm?brCategory=0&&currentPage=1");
                        	});
                        	
                        	$("#comment_btn").click(function(){
                        		location.replace("<%=request.getContextPath()%>/rptList.adm?brCategory=1&&currentPage=1");
                        	});
                        </script>

                        <script>
                            $("table tr").click(function () {
                                if(event.target.type=='checkbox') return;
                                
                                // ????????? ????????? ???
                                var dailyNo = $(this).children().eq(5).text();
                                var rptCategory = $(this).children().eq(3).text();
                                var content = $(this).children().eq(6).text();
                                //console.log(dailyNo);
                                //console.log(rptCategory);
                                //console.log(content);
                                
                                // ?????? ?????? ??????
                                var mDailyNo = $("#exampleModal form").children().eq(0).children("p");
                                var mRptCategory = $("#exampleModal form").children().eq(1).children("p");
                                var mContent = $("#exampleModal form").children().eq(2).children("div");
								
                                $(mDailyNo).html(dailyNo);
                                $(mRptCategory).html(rptCategory);
                                if(content == "null"){
                                	$(mContent).html("");
                                } else{
                                	$(mContent).html(content);
                                }
                                
                                $("#exampleModal").modal('show');
                            });
                        </script>
                        
                        <script>
	                        function openWindow(){
	                        	var mDailyNo = $("#exampleModal form").children().eq(0).children("p").html();
	                        	window.open("<%=contextPath%>/detail.da?dno=" + mDailyNo);
	                        }
                        </script>
                        
                        <!-- ????????????-->
                        <div
                            class="modal fade"
                            id="exampleModal"
                            tabindex="-1"
                            aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"><b>???????????? ??????</b></h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label"><b>?????????</b></label>
                                                <p>125448</p>
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label"><b>??????</b></label>
                                                <p>??????</p>
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label"><b>????????????</b></label>
                                                <div style="height: 100px; border-radius: 4px; background-color:gainsboro;">?????? ?????? ?????? ????????? ??? ????????? ????????? ????????????. ???????????????.</div>
                                                <!-- <textarea class="form-control" id="message-text" disabled>?????? ?????? ?????? ????????? ??? ????????? ????????? ????????????. ???????????????.</textarea> -->
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" onclick="openWindow();">???????????????</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        
                        <!-- ????????? ?????? ?????? -->
                        <div id="warn_box">
                            <button
                                type="button"
                                class="btn btn-primary"
                                id="warn_btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModalToggle" disabled>????????????</button>
                            <button
                                type="button"
                                class="btn btn-primary"
                                id="delete_rept_btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModalToggle_rept" disabled>????????? ??????</button>
                        </div>
                        <!-- Modal -->
                        <div
                            class="modal fade"
                            id="exampleModalToggle"
                            aria-hidden="true"
                            aria-labelledby="exampleModalToggleLabel"
                            tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalToggleLabel">
                                            <b>?????? ??????</b>
                                        </h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ?????? ?????? ???????????????????
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                                        <button
                                            class="btn btn-primary"
                                            data-bs-target="#exampleModalToggle2"
                                            data-bs-toggle="modal"
                                            data-bs-dismiss="modal"
                                            onclick="rptProcess(report_detail);">????????????</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            class="modal fade"
                            id="exampleModalToggle2"
                            aria-hidden="true"
                            aria-labelledby="exampleModalToggleLabel2"
                            tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalToggleLabel2">
                                            <b>?????????</b>
                                        </h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ?????????????????????!
                                    </div>
                                    <div class="modal-footer">
                                        <button
                                            class="btn btn-primary"
                                            data-bs-toggle="modal"
                                            data-bs-dismiss="modal"
                                            onclick="">??????</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Modal End-->
                        <!-- Modal -->
                        <div
                            class="modal fade"
                            id="exampleModalToggle_rept"
                            aria-hidden="true"
                            aria-labelledby="exampleModalToggleLabel"
                            tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalToggleLabel">
                                            <b>????????? ??????</b>
                                        </h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ???????????? ?????????????????????????
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                                        <button
                                            class="btn btn-primary"
                                            data-bs-target="#exampleModalToggle_rept2"
                                            data-bs-toggle="modal"
                                            data-bs-dismiss="modal"
                                            onclick="rptDelete(report_detail);">????????????</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <script>
                        	// ????????? ?????? submit
                        	function rptDelete(formName){
                        		formName.action = "/StyleCast/rptDelete.adm";
                        		formName.method = "post";
                        		formName.submit();
                        	}
                        	
                        	// ????????? ?????? submit
                        	function rptProcess(formName){
                        		formName.action = "/StyleCast/rptProcess.adm";
                        		formName.method = "post";
                        		formName.submit();
                        	}
                        </script>
                        
                        <script>
                        	// ???????????? ?????? ?????? ??????????????? ??????/?????? ?????? ?????????
                        	$("table input:checkbox").click(function(){
                        		if($("table input:checkbox").is(":checked") == true){
                        			$("#warn_box button").attr("disabled", false);
                        		}else{
                        			$("#warn_box button").attr("disabled", true);
                        		}
                        	});
                        </script>
                        
                        <div
                            class="modal fade"
                            id="exampleModalToggle_rept2"
                            aria-hidden="true"
                            aria-labelledby="exampleModalToggleLabel2"
                            tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalToggleLabel2">
                                            <b>?????????</b>
                                        </h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ?????????????????????!
                                    </div>
                                    <div class="modal-footer">
                                        <button
                                            class="btn btn-primary"
                                            data-bs-toggle="modal"
                                            data-bs-dismiss="modal"
                                            onclick="">??????</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div id="page_box" class="text-center">
                            <div align="center" class="btn-group me-2" role="group" aria-label="First group">

							<% if(currentPage != 1){ %>
            					<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=contextPath%>/rptList.adm?brCategory=<%=brCategory%>&&currentPage=<%=currentPage-1%>';"> &lt; </button>
							<% } %>

            				<% for(int p=startPage; p<=endPage; p++){ %>
            	
            					<% if(p != currentPage){ %>
	            					<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=contextPath%>/rptList.adm?brCategory=<%=brCategory%>&&currentPage=<%= p %>';"><%= p %></button>
	            				<% }else { %>
	            					<button type="button" class="btn btn-outline-secondary" disabled><%= p %></button>
            					<% } %>
            	
            				<% } %>
						<% if(currentPage == 1 && maxPage == 0 && endPage == 0){ %>
						
						<% } else if(currentPage != maxPage){ %>
            				<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=contextPath%>/rptList.adm?brCategory=<%=brCategory%>&&currentPage=<%=currentPage+1%>';"> &gt; </button>
						<% } %>
			
        					</div>
                        </div>
                        
                        <!--Modal End-->

                        <!-- <div id="page_box"> <nav aria-label="Page navigation example"> <ul
                        class="pagination justify-content-center"> <li class="page-item disabled"> <a
                        class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a> </li>
                        <li class="page-item"> <a class="page-link" href="#">1</a> </li> <li
                        class="page-item"> <a class="page-link" href="#">2</a> </li> <li
                        class="page-item"> <a class="page-link" href="#">3</a> </li> <li
                        class="page-item"> <a class="page-link" href="#">&raquo;</a> </li> </ul> </nav>
                        </div> -->

                    </div>
            	
            	<script>
            		// ????????? ????????? ??????
            		$(function(){
            			
            			var cp = $("#contextpath").val();
            			
            			$.ajax({
			        		url:"profImgSelect.me",
			        		data:{
			        			memNo:<%=loginUser.getMemNo()%>
			        		},
			        		type:"post",
			        		success:function(profImg){
								$("#content #prof_img img").attr("src", cp + profImg);
			        		},error:function(){
			        			console.log("????????? ????????? ???????????? ??????");
			        		}
			        	})
            		})
            	</script>

                </div>
            </div>
        </div>
    </body>
</html>