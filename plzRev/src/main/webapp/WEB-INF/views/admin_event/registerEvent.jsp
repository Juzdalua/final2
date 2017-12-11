<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
	.w3-block {cursor: pointer;}
</style>

<style>
.megabox-color {
   color: #351F65;
}

.white-color {
   background-color: white;
}

.background {
   border: 5px solid #f1f1f1;
}

.table {
   border-top: 2px solid #351F65;
}

.th-color {
   background-color: #f1f1f1;
}

.couponMouse {
   cursor: pointer;
   color: #351F65;
   font-weiht: bold;
}


</style>
<script>

	$(document).ready(function(){
	
        
    });
	

</script>


<div style="padding-bottom: 30%;">
<h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="">이벤트 관리 페이지</a></span></h2>
	
	<div class="container" style="margin-top: 10px;">
	  <br/> <br/>
	  <ul class="nav nav-tabs" style="font-size: 13pt;">
	    <li><a href="<%= request.getContextPath()%>/admin_event.pz">이벤트 보기</a></li>
	    <li class="active"><a href="<%= request.getContextPath()%>/admin_registerEvent.pz">이벤트 등록 </a></li>
	  </ul>
	  	<br/><br/>
	</div>

<br/><br/>
<div class="container">
      <br/>
      <div style="width: 80%; text-align: left; padding-bottom: 100px;">
           이벤트 카테고리 :	
       <div class="dropdown" style="margin-left:5%;">
	</div>
      <br/>
          이벤트 이름 : <input id="title" name="title" type="text" size="30" style="margin-left:5%; border:1px solid LightGray;  border-radius: 5px; width: 28%;"  placeholder="제목을 입력하세요." required /><br/>
      <br/>
          이벤트 시작날짜 : <input id="start_day" name="start_day" type="text" style="border:1px solid LightGray; margin-left:5%; border-radius: 5px;  width: 28%;" placeholder="(2017-12-26)" required /><br/><br/>
          이벤트 종료날짜 :<input id="end_day" name="end_day" type="text" style="border:1px solid LightGray; margin-left:5%; border-radius: 5px;  width: 28%;" placeholder="(2017-12-26)" required /><br/><br/>
          할인액(쿠폰일 경우) :<input id="coupon_price" name="coupon_price" type="text" style="border:1px solid LightGray; margin-left:5%; border-radius: 5px;  width: 28%;" placeholder="할인금을 입력하세요." required /><br/><br/>
          
     <button type="button" style="margin-left: 200px; width: 70px; text-align: center; border: #351F65; background-color: #351F65; color:white; border-radius: 5px; height: 30px;" onClick="goInsert();">등록</button>
   </div>
</div>
</div>

