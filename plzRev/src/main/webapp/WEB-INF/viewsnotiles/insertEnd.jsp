<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	<c:if test="${n == 1}">
		alert("문의 등록 성공!!");
		location.href="<%= request.getContextPath() %>/mypage.pz";
	</c:if>
	
	<c:if test="${n != 1}">
		alert("문의 등록 실패!!!");
		location.href= "javascript:history.back();"; 
		 
	</c:if>
	
</script>

    
    
    
    
    