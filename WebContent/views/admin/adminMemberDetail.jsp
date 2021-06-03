<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                font-weight: 300;
            }

            .wrap {
                width: 1200px;
                height: 1300px;
                margin: auto;
            }

            .wrap > div {
                width: 100%;
            }
            table thead th {
                text-align: center;
            }
            table tbody tr td {
                text-align: center;
            }
            #table_box{
                height: 75%;
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
                overflow: auto;
            }
            #blank_box {
                height: 8%;
            }
            #search_box {
                display: inline-flex;
                float: left;
                margin-bottom: 10px;
            }
            #img_btn {
                background-color: white;
                border: none;
            }
            #input_search {
                width: 200px;
            }

            #black_box {
                float: right;
            }
            #prof_img{height: 70%; padding: 20px;}
            #prof{height: 17%;width: 99%; float: left;}
            #prof div, #menu div{width: 100%;}
        </style>
    </head>
    <body>
        <!--참고하면 좋은 글-->
        <!--modal form submit에 관한 글-->
        <!-- https://codevang.tistory.com/287 -->
        <!--자바스크립트문으로 form전송 -->
        <!--https://all-record.tistory.com/172-->
        <%@ include file="../common/menubar.jsp" %>
        <div class="wrap">

            <div id="header"></div>

            <div id="content">
                <div id="side">

                    <div id="line"></div>
                    <div id="prof">
                        <div id="prof_img" align="center"><img src="images/prof.PNG"></div>
                        <div id="prof_nick" align="center"><b>닉네임</b></div>
                    </div>
                    <div id="menu">
                        <div>
                            <h4>
                                <a href=""><b>회원관리</b></a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="">메인관리</a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="">트렌딩관리</a>
                            </h4>
                        </div>
                        <div>
                            <h4>
                                <a href="">게시글관리</a>
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
                    <!-- <h2 style="text-align: center;">
                        <b>회원관리</b>
                    </h2> -->
                    <!-- <br>
                    <div id="line2"></div> -->
                    
                    <div id="content_of_form">
                        <div id="blank_box"><h5><b>회원관리</b></h5></div>
                        <div id="control_box">
                            <div id="search_box">
                                <select class="form-select">
                                    <option selected="selected" value="1">아이디</option>
                                    <option value="2">이메일</option>
                                    <option value="3">닉네임</option>
                                </select>
                                <input id="input_search" class="form-control" type="text" placeholder="검색내용">
                                <button id="img_btn" type="button"><img src="images/loupe.png"></button>
                            </div>
                            <div id="black_box">
                                <div class="form-check form-switch">
                                    <label class="form-check-label" for="flexSwitchCheckDefault">
                                        <b>블랙회원 보이기 OFF/ON</b>
                                    </label>
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                                </div>
                            </div>
                        </div>
                        <div id="table_box">
                            <form name="mem_detail">
                                <table class="table table-bordered table-hover">
                                    <thead class="table-secondary">
                                        <th width="10%">경고횟수</th>
                                        <th>회원번호</th>
                                        <th width="20%">이메일</th>
                                        <th width="20%">아이디</th>
                                        <th>닉네임</th>
                                        <th>블랙 여부</th>
                                        <th>블랙 적용/해제</th>
                                    </thead>
                                    <tbody>
                                        <!--검색 결과가 없을 경우 아래의 tr만 보이게-->
                                        <!-- <tr> <td colspan="7">검색 결과가 없습니다.</td> </tr> -->
                                        <tr>
                                            <td>2번</td>
                                            <td>1121</td>
                                            <td>abcadf1232@naver.com</td>
                                            <td>asdafsda</td>
                                            <td>에코</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>1번</td>
                                            <td>211</td>
                                            <td>samoc@naver.com</td>
                                            <td>adasd1</td>
                                            <td>아메리카노</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>1</td>
                                            <td>red@naver.com</td>
                                            <td>sd1</td>
                                            <td>배고파</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>2</td>
                                            <td>kain@naver.com</td>
                                            <td>sfa11</td>
                                            <td>토비</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>3</td>
                                            <td>saf@naver.com</td>
                                            <td>a1</td>
                                            <td>바바</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>4</td>
                                            <td>oc@naver.com</td>
                                            <td>dasd1</td>
                                            <td>포동</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>5</td>
                                            <td>ocnmuseum@naver.com</td>
                                            <td>ada1</td>
                                            <td>코코아</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>7</td>
                                            <td>lalala@naver.com</td>
                                            <td>adas1</td>
                                            <td>퉁퉁이</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>9</td>
                                            <td>afoc@naver.com</td>
                                            <td>adasd1</td>
                                            <td>타코</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>0번</td>
                                            <td>11</td>
                                            <td>af2411@naver.com</td>
                                            <td>adasd1</td>
                                            <td>핏짜</td>
                                            <td>N</td>
                                            <td align="center">
                                                <button
                                                    type="button"
                                                    class="btn btn-secondary btn-sm black_btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModalToggle">블랙 적용</button>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </form>

                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalToggleLabel"><b>블랙 적용</b></h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  정말로 블랙 처리 하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                  <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">적용하기</button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalToggleLabel2"><b>확인창</b></h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  적용되었습니다!
                                </div>
                                <div class="modal-footer">
                                  <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="blackMem(mem_detail)">확인</button>
                                </div>
                              </div>
                            </div>
                          </div>
                        <script>
                            //no는 전달된 회원번호를 의미합니다.
                            var no = 0;
                            $('.black_btn').click(function() {
                                var btn = $(this);
                                var tr = btn
                                    .parent()
                                    .parent();
                                var td = tr.children();

                                no = td
                                    .eq(1)
                                    .text();
                                console.log(no);

                            });

                            function blackMem(formName) {
                                console.log("전달된 no는 " + no);
                                formName.action = "";
                                formName.method = "post";
                                formName.submit();

                            }
                        </script>
                        <br>
                        <div id="page_box">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">&raquo;</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>

                </div>
            </div>

        </div>

    </body>
</html>