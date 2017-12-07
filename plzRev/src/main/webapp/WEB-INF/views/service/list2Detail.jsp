<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.col { background-color: #e6e6e6;
		   font-weight: bold;}
		
</style>

<script>

	$(document).ready(function(){
	   
		
		
		
	});
	
	function searchKeep() {
		<c:if test="${search != 'null' && not empty search}">  
		   $("#search").val("${search}");  // 검색에 대한 검색어를 유지시킨다.
		</c:if>
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
<h3>상세내용</h3>
<div class="container">
  <table class="table" style="text-align: center;">
    <thead>
      <tr>
 		<th></th>
      </tr>
      
    </thead>
    
    <tbody>
    
		
	   
	 
	</tbody>
  </table>
</div>
<div align="center" style="width: 70%; margin-left: 50px;">
	
		${pagebar}
	</div>

</body>
</html>

