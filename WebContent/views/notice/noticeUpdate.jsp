<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.stylecast.common.model.vo.* ,com.stylecast.notice.model.vo.*"%>
<%
	ArrayList<BoardImage> list = (ArrayList<BoardImage>)request.getAttribute("list");
	Notice n = (Notice)request.getAttribute("n");
	int[] bNo = new int[3];
	String[] bPath = new String[3];
	for(int i=0; i<list.size(); i++){
		bPath[i] = null;
		bNo[i] = 0;
		if(list !=null){
				bNo[i] = list.get(i).getImgNo();
				bPath[i] = request.getContextPath() +"/" + list.get(i).getImgPath();
			}
			
	}
		
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
        rel="stylesheet">
    <!--font end-->
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--jQuery end-->

    <script>
            
            $(function(){
                
                $("#img1").click(function(){
                    $("#input-img1").click();
                })
                $("#img2").click(function(){
                    $("#input-img2").click();
                })
                $("#img3").click(function(){
                    $("#input-img3").click();
                })
            })
        
			
            function loadImg(inputFile, num){
                // inputFile : ?????? ????????? ?????? input type="file" ????????????
                // num : ????????? input???????????? ?????? ??? ?????? ???????????? ???????????????????????????

                //console.log(inputFile.files.length);
            
                if(inputFile.files.length == 1){ 
                    // ????????? ????????? ????????? ?????? 
                    // => ????????? ????????? ??????????????? ??? ????????? ?????? ?????? ????????????
                	// ????????? ??????
                    if(!/\.(gif|jpg|jpeg|png)$/i.test(inputFile.files[0].name)){
                    	alert('gif, jpg, png??? ??????????????? ?????? ????????? ????????? ????????? ?????????.\n\n?????? ?????? : ' + inputFile.files[0].name);
                    	return;
                    }
                    
                    // ????????? ???????????? FileReader ?????? ??????
                    var reader = new FileReader();
                    
                    // ????????? ??????????????? ????????? => ?????? ????????? ??????????????? ?????? ?????? ??? ???????????? ????????? url ?????????
                    reader.readAsDataURL(inputFile.files[0]);
                    
                    // ?????? ????????? ??? ??????????????? ??? ????????? ????????? ??????
                    reader.onload = function(e){
                        // ??? ????????? ????????? ????????? ????????????
                        switch(num){
                        case 1: $("#img1").attr("src", e.target.result); break;
                        case 2: $("#img2").attr("src", e.target.result); break;
                        case 3: $("#img3").attr("src", e.target.result); break;
                        }
                    }
                    
                }else{ // ????????? ????????? ???????????? ?????? => ???????????? ????????????
                    switch(num){
                    case 1: $("#img1").attr("src", null); break;
                    case 2: $("#img2").attr("src", null); break;
                    case 3: $("#img3").attr("src", null); break;
                    }
                }
			
           function goBack(){
            	window.history.back();
            }
       
            }
    </script>

    <style>
    	.wrap{width:1200px; height:1300px;  margin: auto;}
        .wrap>div{width:100%;}
            
       	#content{
                font-family: 'Noto Sans KR', sans-serif;
                font-weight: 300;
        }

        #head_of_notice{
            font-weight: bold;
            margin-top: 30px;
            margin-left: 80px;
            margin-bottom: 10px;
        }
        #detail_box{
            width: 80%;
            margin: auto;
            margin-top: 20px;
        }
        #notice_contents{
            height: 500px;
            overflow: auto;
            /* div???????????? ???????????? ????????? ?????? ????????? ?????? */
        }
        #button_box{
            margin: auto;
            width: 80%;
        }
        #notice_submit, #notice_cancel{
            float: right;
            margin: 3px;
        }
        #image_lists{
            max-height: 200px;
            overflow: auto;
        }
        #image_lists img{
            margin: 2px;
        }
        #font_notice{
        	color: rgb(241, 196, 15);
        
        } 
    </style>
    
</head>
<body>
     <%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
    <!--  
        <div id="header">
            <div id="header_1">??????</div>
            <div id="header_2">?????????</div>
            <div id="header_3">??????</div>
            <div id="header_4">?????????</div>
        </div>
       -->
        <div id="content">
            <div id="head_box">
                <h3 id="head_of_notice">Notice</h3>
            </div>
            <form action="<%= contextPath %>/update.no" id="enroll-form" method="post" enctype="multipart/form-data">
            <input type="hidden" name="nno" value="<%=n.getNoticeNo()%>"/>
            <div id="detail_box">
                <table class="table">
                    <tr>
                        <th width=13%>??????</th>
                        <td colspan="3"><input type="text" name="title" value="<%=n.getNoticeTitle()%>" style="font-weight:300" placeholder="????????? ??????????????????" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required></td>
                    </tr>
                    <tr>
                        <th>??????</th>
                        <td colspan="3">
                            <div id="notice_contents">
                                <textarea class="form-control" name="content" placeholder="????????? ??????????????????" id="floatingTextarea2" style="height: 100%; font-weight:300"><%= n.getNoticeContent() %></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th>?????????1</th>
                        <td colspan="3">
                            <div id="input_file" class="input-group">
                            	<input type="hidden" name="originImageNo1" value="<%=bNo[0] %>"/>
                                <input type="file" class="form-control" name="image1" id="input-img1" aria-describedby="inputGroupFileAddon04" aria-label="Upload" onchange="loadImg(this,1);">
                            </div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th>?????????2</th>
                        <td colspan="3">
                            <div id="input_file" class="input-group">
                            	<input type="hidden" name="originImageNo2" value="<%=bNo[1] %>"/>
                                <input type="file" class="form-control" name="image2" id="input-img2" aria-describedby="inputGroupFileAddon04" aria-label="Upload" onchange="loadImg(this,2);">
                            </div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th>?????????3</th>
                        <td colspan="3">
                            <div id="input_file" class="input-group">
                            	<input type="hidden" name="originImageNo3" value="<%=bNo[2] %>"/>
                                <input type="file" class="form-control" name="image3" id="input-img3" aria-describedby="inputGroupFileAddon04" aria-label="Upload" onchange="loadImg(this,3);">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>????????? ??????</th>
                        <td colspan="3">
                            <div id="image_lists">
                            	<input type="hidden" name="originFilePath1" value="<%=bPath[0] %>"/>
                     			<input type="hidden" name="originFilePath2" value="<%=bPath[1] %>"/>
                     			<input type="hidden" name="originFilePath3" value="<%=bPath[2] %>"/>
                            	<img id="img1" name="img1" width="200" height="150" src="<%=bPath[0]%>" onerror="javascript:this.src='<%=contextPath %>/resources/images/add.png'"/>
                            	<img id="img2" name="img2" width="200" height="150" src="<%=bPath[1]%>" onerror="javascript:this.src='<%=contextPath %>/resources/images/add.png'"/>
                            	<img id="img3" name="img3" width="200" height="150" src="<%=bPath[2]%>" onerror="javascript:this.src='<%=contextPath %>/resources/images/add.png'"/>
                            </div>
                        </td>
                    </tr>
                    
                </table>
            </div>
            <div id="button_box">
                <button id="notice_cancel" type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/detail.no?nno=<%=n.getNoticeNo()%>';">??????</button>
                <button id="notice_submit" type="submit" class="btn btn-primary">??????</button>
            </div>
            </form>
        </div>

    </div>

</body>
</html>