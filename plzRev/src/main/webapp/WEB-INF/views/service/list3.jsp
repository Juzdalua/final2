<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(document).ready(function(){
	   
	});
	
	function goInsert() {
		var radio = Frm.ok.value;
		var title = Frm.title.value;
		var movie = Frm.movie.value;
		var msg = Frm.msg.value;
		var email = Frm.email.value;
		
	    if(movie == "" ||msg == ""  ||title == ""){
			alert("필수입력란을 채워주세요!");
			return;
		}else{

			if(radio != "11"){
				alert("약관에 동의 하셔야 합니다.");
				return;
			}
			else{
				var frm = document.Frm;
				
				frm.method = "get";
				frm.action = "list3_insert.pz";
				frm.submit();
			}	
		
		}
		
	   
	}
	
	function  goSearch() {
		var search = Frm.search.value;
	
		
	   var form_data = { "search":search };

	      $.ajax({
	         url: "movieList.pz",
	         type: "GET",
	         data: form_data,
	         dataType: "html",
	         success: function(data){
	           $("#movieList").empty();
	           $("#movieList").append(data);
	          } 
	      });
		
	}
	
</script>
<style>

body {
    background: #fff;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;	
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#333333;
}
</style>

<body>

  <h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="<%= request.getContextPath()%>/list1.pz">고객센터</a></span></h2>
<div class="container" style="margin-top: 10px;">
  <br/> <br/>
  <ul class="nav nav-tabs" style="font-size: 13pt;">
    <li><a href="<%= request.getContextPath()%>/list1.pz">  F    A    Q  </a></li>
    <li><a href="<%= request.getContextPath()%>/list2.pz"> 공 지 사 항 </a></li>
    <li class="active"><a href="<%= request.getContextPath()%>/list3.pz"> 1 : 1 문의 </a></li>
  </ul>
</div>

<div class="container">
    <div class="col-md-10" style="padding-left: 174px;">
    <br/><br/>
    <form name="Frm">
        <h3 class="entry-title"><span style="padding-right: 80%;">1:1 문의 작성</span> </h3>
         <br/>
        
		<div align="center">
			<div style="text-align: left; vertical-align: middle;">
				<iframe src="<%= request.getContextPath() %>/agree.pz" width="100%" height="250px" class="box" ></iframe>
			</div>
		</div>
		
		<div>
			<div align="right">
				<input type="radio" name="radio" id="ok" value="11" /><label for="ok">동의함</label>&nbsp;&nbsp;
				<input type="radio" name="radio" id="no" value="10" checked/><label for="no">동의하지않음</label>
			</div>
		</div>
		<br/>
	</div>
	</div>
	 
	 <h3 class="entry-title"><span style="padding-right: 45%;">문의사항</span> </h3><p>
		<p style="border: 1px solid black;margin-right:27px; width: 50.7%;"></p>
		<br/>
		<div style="width: 40%; text-align: left; padding-bottom: 100px;">
		이메일<input id="email" name="email" type="text" size="30" style="border:1px solid LightGray; margin-left:13px;  border-radius: 5px; width: 28%;"  placeholder=" Email@gmail.com"  required />
		&nbsp;<span style="font-size: 9pt;">답변이 등록되면 이메일로 전송됩니다.</span><br/>
		<br/>
		  <!-- Trigger the modal with a button -->
		  영화관&nbsp;&nbsp;<input type="text" id="movie" name="movie" style="border:1px solid LightGray; border-radius: 5px; height: 28px;" size="15px" />&nbsp;
		<!--  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">영화관찾기</button> -->
		   <button type="button" class="btn btn-info btn-sm"  onclick="document.getElementById('myModal').style.display='block'">영화관찾기</button><br/>
		  <!-- Modal -->
		  
		  
     <div id="myModal" class="modal-head">
        <div class="modal-content-head">
          <div class="container-head">
                <button type="button" class="close"  onclick="document.getElementById('myModal').style.display='none'">&times;</button>
                <h4 >영화관 검색</h4>
              </div>
              <div class="container-head">
                   <div>
                      <input type="text" id="search" name="search"/>
                      <button type="button"  style="background-color: #28004d; color:white; border: #28004d;  border-radius: 5px; width: 13%; height: 25px;" onClick="goSearch();">검색</button>
                   </div>    
              </div>
              <div id="movieList" style="padding-left:10%; width: 90%;" onclick="document.getElementById('myModal').style.display='none'"></div><br/>
         <div class="container-head" style="background-color:#f1f1f1">
         <button  type="button" onclick="document.getElementById('myModal').style.display='none'" >닫기</button><br>
        </div>
       </div> 
     </div>
		  <!-- 
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-md">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">영화관 검색</h4>
		        </div>
		       
		        <div class="modal-body">
		          	<div>
		          		<input type="text" id="search" name="search"/>
		          		<button type="button" style="background-color: #28004d; color:white; border: #28004d;  border-radius: 5px; width: 13%; height: 30px;" onClick="goSearch();">검색</button>
		          	</div> 	
		        </div>
		        <div id="movieList" data-dismiss="modal"></div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		<br/>
		<br/> --> <br/>
		제목<input id="title" name="title" type="text" style="border:1px solid LightGray; margin-left:25px; border-radius: 5px; height: 30px;"size="60px;"  placeholder=" 제목을 입력하세요" required /><br/><br/>
		내용<input id="msg" name="msg" type="text" style="border:1px solid LightGray; margin-left:25px; border-radius: 5px;height: 100px; text-align: left;" size="60px;" row="8" placeholder=" 내용을 입력하세요(최대 2000자)" required /><br/><br/>
			
        	<button type="button" style="margin-left: 200px; width: 70px; text-align: center; border: #351F65; background-color: #351F65; color:white; border-radius: 5px; height: 30px;" onClick="goInsert();">등록</button>
		</div>
	</form>
</body>
</html>

<br/><br/><br/>