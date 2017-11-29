<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

	<c:if test="${n==1 && gobackURL == null}">		
		location.href = "<%=request.getContextPath()%>/index.pz";
	</c:if>
		
	<c:if test="${n==1 && gobackURL != null}">
		alert("로그인 성공!");
		location.href="${gobackURL}";
	</c:if>
	
	<c:if test="${n==0}">
		alert("암호가 틀림.");
	</c:if>	
		
	<c:if test="${n==-1}">
		alert("아이디없음.");
		javascript:history.back();
	</c:if>
</script>