<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

	<c:if test="${n==1}">
	     alert("비밀번호 변경 성공!");
		location.href = "<%=request.getContextPath()%>/mypage.pz";
	</c:if>
		
	<c:if test="${n==0}">
	    alert("비밀번호 변경 실패...!");
	    location.href = "<%=request.getContextPath()%>/mypage.pz";
	</c:if>
</script>