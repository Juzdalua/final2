<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.col { background-color: #e6e6e6;
		   font-weight: bold;}
		
</style>

<script>

  function goEnd(){
	  location.href="<%= request.getContextPath()%>/list2.pz";
  }
	
</script>
<body>
<h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="<%= request.getContextPath()%>/list1.pz">고객센터</a></span></h2>
<div class="container">
  <br/>
  <ul class="nav nav-tabs" style="font-size: 13pt;">
    <li><a href="<%= request.getContextPath()%>/list1.pz">  F    A    Q  </a></li>
    <li class="active"><a href="<%= request.getContextPath()%>/list2.pz"> 공 지 사 항 </a></li>
    <li><a href="<%= request.getContextPath()%>/list3.pz"> 1 : 1 문의 </a></li>
  </ul>
</div>
 
<br/>
<h2 align="left"><span style="margin-left:24%; font-weight:bold; font-size:23pt">공지사항 상세페이지</span></h2> 
<br/>
 <hr style="width: 60%; ">
<form name="detailFrm">
 <h2 align="left"><span style="margin-left:24%; font-weight:bold; font-size:16pt">${noticevo.title}</span></h2> 
 <h4  align="left"><span style="margin-left:24%">영화관:${noticevo.theatername}&nbsp;&nbsp;|&nbsp;&nbsp;
    등록일 : ${noticevo.writedate}&nbsp;&nbsp;|&nbsp;&nbsp;
   조회수 : ${noticevo.cnt}</span></h4>
<br/>
<hr style="width: 60%;">
<br/><br/>
<div class="container" style="width:50%; border :0px solid gray">
 <h4 align="left">${noticevo.msg}</h4>
 <br/><br/><br/><br/>
<button type="button" style="width:90px; height:40px; background-color:#351F65;" onClick="goEnd();"><span style="color: white; font-size:12t; font-weight:bold">목록</span></button>
         
</div>

 </form>
</body>
</html>

