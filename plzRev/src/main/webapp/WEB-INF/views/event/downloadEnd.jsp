<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	<c:if test="${n == 1}">
		alert("쿠폰 다운로드 성공!!");
		 var bool = confirm("쿠폰 확인하러 마이페이지로 가겠습니까? ");
		  if(bool){
			  location.href="<%= request.getContextPath() %>/mypage.pz"; 
		  }
	</c:if>
	
	<c:if test="${n != 1}">
		alert("쿠폰다운로드 실패!!!");<%-- 
		location.href="<%= request.getContextPath() %>/event.pz"; 
		 --%>
	</c:if>
	
</script>

    
    
    
    
    