<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
	.w3-block {cursor: pointer;}
</style>


<script>
	$(document).ready(function(){
	   
		
		
	});
	
	function myFunction(id) {
		
	    var x = document.getElementById(id);
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	    }
	
	}
	

	
	
</script>


 <h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="<%= request.getContextPath()%>/list1.pz">고객센터</a></span></h2>

	<div class="container" style="margin-top: 10px;"><br/> <br/>
	  <ul class="nav nav-tabs" style="font-size: 13pt;">
	    <li class="active"><a href="<%= request.getContextPath()%>/list1.pz">  F    A    Q  </a></li>
	    <li><a href="<%= request.getContextPath()%>/list2.pz"> 공 지 사 항 </a></li>
	    <li><a href="<%= request.getContextPath()%>/list3.pz"> 1 : 1 문의 </a></li>
	  </ul>
	</div>
	
	<form name="categoryFrm">
		<div class="container" style="margin-top: 0px; background-color:  #e6e6e6;height: 50px; width: 75%;">
			<ul class="nav" style="text-align: left; padding-left:3px; font-size: 13pt; margin-top: 8px;">
	    	<c:forEach var="vo" items="${codeList}">
	    		<li style="display: inline; font-size: 11pt;">&nbsp;&nbsp;
		    		<a style="display: inline;" href="<%= request.getContextPath()%>/categorylist.pz?categorycode=${vo.categorycode}">
		    		${vo.categoryname}(${vo.cnt})&nbsp;&nbsp;</a>
    			</li>
	    	</c:forEach>
		</ul>
	</div>
	</form>
	<br/>

	<div style="width: 75%; background-color:  #999999; height: 150px; ">
		<br/><p></p>
		<span style="font-weight: bold;">검색&nbsp;<input id="search" type="text" size="65"/></span>
		<button type="button" style="margin-left: 5px; width: 70px; text-align: center; border: #351F65; background-color: #351F65; color:white; height: 30px;" onClick="goSearch();">검색</button><br/>
		<p style="margin-top: 10px;border: 0.5px solid; width: 75.5%;  margin-left: 9%;"></p>
		&nbsp;&nbsp;더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면? <a href="<%= request.getContextPath()%>/list3.pz">▶ 1:1문의 바로가기</a>  <a>▶ 나의 문의 내역 바로가기</a><br/>
	</div>
<br/><br/>

<div class="container">

  <table class="table">
  <p style="border: 1px solid; width: 67.5; "></p>
    <thead>
      <tr>
        <th style="width: 20%; text-align: center;">분류</th>
        <th style="width: 80%; text-align: center;">질문</th>
      </tr>
    </thead>
    
    <tbody>
	    <c:if test="${empty cList}">
		    <c:forEach var="map" items="${faqList}" varStatus="status">
		      <tr>
		      	 <td align="center"  style="text-align: left; font-weight: bold;">Q ${map.categorycode}</a> </td>
			      	<td>
						<p onClick="myFunction('Demo${status.count}')" class="w3-block" style="text-align: left; font-size: 13pt;" /> ${map.title}</p>
					    <div id="Demo${status.count}" class="w3-light-grey w3-hide col-sm-15">	
					    	<p style="height: 50%; padding: 15px;">&nbsp;&nbsp;
					    	 	<span style="font-size: 15pt; color:red; font-style: italic;">A&nbsp;&nbsp;</span> ${map.content}
					    	</p>
					  	</div>
			      </td>
		      </tr>
		    </c:forEach>
	    </c:if>
	      
	    <c:if test="${not empty cList}">
		    <c:forEach var="map" items="${cList}" varStatus="status">
		      <tr>
		      	 <td align="center"  style="text-align: left; font-weight: bold;">Q ${map.categorycode}</a> </td>
			      	<td>
						<p onClick="myFunction('Demo${status.count}')" class="w3-block" style="text-align: left; font-size: 13pt;" /> ${map.title}</p>
					    <div id="Demo${status.count}" class="w3-light-grey w3-hide col-sm-15">	
					    	<p style="height: 50%; padding: 15px;">&nbsp;&nbsp;
					    	 	<span style="font-size: 15pt; color:red; font-style: italic;">A&nbsp;&nbsp; </span>${map.content}
					    	</p>
					  	</div>
			      	</td>
		      </tr>
		    </c:forEach>
		</c:if>
    </tbody>
    
  </table>
</div>


</body>
</html>

