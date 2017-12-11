<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.col_half { /* width: 49%;  */}
.col_third { /* width: 32%;  */}
.col_fourth { /* width: 23.5%; */ }
.col_fifth { /* width: 18.4%;  */}
.col_sixth { /* width: 15%; */ }
.col_three_fourth { /* width: 74.5%; */}
.col_twothird{ /* width: 66%; */}
.col_half,
.col_third,
.col_twothird,
.col_fourth,
.col_three_fourth,
.col_fifth{
	position: relative;
	display:inline;
	display: inline-block;
	float: left;
	margin-right: 3%;
	margin-bottom: 20px;
	/* margin-left: 2%; */
}
.end { margin-right: 0 !important; }

/*-=-=-=-=-=-=-=-=-=-=- */
/* Flip Panel */
/*-=-=-=-=-=-=-=-=-=-=- */

.wrapper{ width: 100%;  background-color: white; hoverflow: hidden; border: 0px solid yellow; margin-left: 5%; }

.panel {
	border: 0px solid aqua;
	margin-bottom: 50px;
	height: 190px;
	width:300px;  
	position: relative;
	-webkit-perspective: 600px;
	-moz-perspective: 600px;
}

.panel .front,
.panel .back {
	
	text-align: center;
}
	
.panel .front {
	border:0px solid pink;
	height: 190px;
	position: absolute;
	top: 0;
	z-index: 900;
	text-align: center;
	-webkit-transform: rotateX(0deg) rotateY(0deg);
	   -moz-transform: rotateX(0deg) rotateY(0deg);
	-webkit-transform-style: preserve-3d;
	   -moz-transform-style: preserve-3d;
	-webkit-backface-visibility: hidden;
	   -moz-backface-visibility: hidden;
	-webkit-transition: all .4s ease-in-out;
	   -moz-transition: all .4s ease-in-out;
		-ms-transition: all .4s ease-in-out;
		 -o-transition: all .4s ease-in-out;
			transition: all .4s ease-in-out;
}

.panel .back {
	border:0px solid black;
	height: auto;
	position: absolute;
	top: 0;
	z-index: 1000;
	-webkit-transform: rotateY(-180deg);
	   -moz-transform: rotateY(-180deg);
	-webkit-transform-style: preserve-3d;
	   -moz-transform-style: preserve-3d;
	-webkit-backface-visibility: hidden;
	   -moz-backface-visibility: hidden;
	-webkit-transition: all .4s ease-in-out;
	   -moz-transition: all .4s ease-in-out;
		-ms-transition: all .4s ease-in-out;
		 -o-transition: all .4s ease-in-out;
			transition: all .4s ease-in-out;
}
.panel.flip .front {

	z-index: 900;
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
}
.panel.flip .back {

	z-index: 1000;
	-webkit-transform: rotateX(0deg) rotateY(0deg);
	-moz-transform: rotateX(0deg) rotateY(0deg);
}
.box1{

	border:0px solid blue;
	width: 300px;
	height: 190px;
	margin: 0 auto;
	/* padding: 15px; */
	border-radius: 10px;
	/* -moz-border-radius: 10px;
	-webkit-border-radius: 10px; */
}
.box2{

	border:0px solid red;
	background-color: black;
	color:white;
	width: 300px;
	height: 190px;
	margin: 0 auto;
    padding-top: 15px;
    padding-left: 20px; 
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}
}
</style>


<script>
$(document).ready(function(){
	$('.hover').hover(function(){
		$(this).addClass('flip');
	},function(){
		$(this).removeClass('flip');
	});
	
	
});



function goSearch(name) {
	
	var frm = document.searchFrm;
	var search = $("#search").val();
	
	if(search.trim() == "") {
		alert("검색어를 입력하세요!!");
		$("#search").focus();
		return;
	}
	else {
		frm.submit();
		frm.action="cardMain.pz";
	}
	
	
}
</script>

<div style="margin-bottom: 50%;">
<div>
<div style="width: 100%; background-color: #333333;  height: 350px;">
	<div style="padding-top: 7%;">
		<h3 style="color:white;">예매를 부탁해</h3>
		<br/><br/>
		<form name="searchFrm">
			<input type="hidden" id="name" name="name" value="${name}"/>
			<span style="font-weight: bold; color:white; margin-left: 30px;"><input type="text" size="45" name="search" id="search" style=" color:black;"/></span>
			<button type="button" class="btn btn-default btn-sm"style="background-color: #b3b3b3; border:#b3b3b3; "onClick="goSearch('${name}');"><span style="width: 30px;"class="glyphicon glyphicon-search"></span></button>
		</form>
	</div>
	<br/>
</div>
<br/>

<span style="font-size: 14pt; font-weight: bold;">| <a href="cardMain.pz">할인신용카드</a> | </span>&nbsp;
<span style="font-size: 9pt; font-weight: bold; padding-right: 68%;">사용실적에 따른 청구할인</span>
<br/><br/><br/>
<div align="left" style="padding-left: 80px;">
<c:forEach var="map" items="${companyList}">
	<span id="name" name="name" style="margin-left: 8px; font-weight: bold;">&nbsp;
		<a href="cardMain.pz?name=${map.name}">${map.name}</a>
		<span style="margin-left: 15px;margin-right: 10px;">|</span>
	</span>
</c:forEach>
</div>
<br/>
</div>
	<div class="wrapper">
		<c:if test="${not empty cardlist}">
		<c:forEach var="map" items="${cardlist}">
	      <div class="col_third">
	        <div class="hover panel">
	          <div>
		          <div class="front">
		            <div class="box1" align="center">
		             <img alt="이미지" src="<%= request.getContextPath()%>/resources/images/kyj/${map.img}">
		            </div><p>
		          </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		          <span style="font-size: 12.8pt; font-weight: bold;">${map.cardname}</span><br/>
		          ${map.type}
	          </div>  
	          <div class="back">
	            <div class="box2" align="left">
	              <span style="font-size: 9pt;">${map.contents}</span>
	            </div>
	          </div>
	          
	        </div>
	     </div>
	     
	   </c:forEach>
	</c:if>
	    <c:if test="${empty cardlist}">
	 		<span style="padding-right: 8%; font-size: 15pt; margin-top: 30%;">검색하신 카드는 존재하지 않습니다.</span>
	    </c:if>
	 </div>
	


</div>