<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script>
	function go(name){
      
      document.getElementById('movie').value = name;
      
	}

</script>    
    
<c:forEach var="movievo" items="${movieList}">
 <span style="cursor:pointer;" onclick="go('${movievo.theatername}');">${movievo.theatername}</span>
 
</c:forEach>