<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	<c:if test="${result == 1}">
		alert("구매 성공!!");
		 var bool = confirm("구매내역을 확인하러 마이페이지로 가겠습니까? ");
		  if(bool){
			  location.href="<%= request.getContextPath() %>/mypage.pz"; 
		  } 
	</c:if>
	
	<c:if test="${result != 1}">
		alert("구매 실패!!!");
		location.href="<%= request.getContextPath() %>/store.pz"; 
		
	</c:if>
	
</script>


  