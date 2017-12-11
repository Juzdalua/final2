<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script>
	function go(name){
      
      document.getElementById('movie').value = name;
      
	}

</script>    
    
<c:forEach var="movievo" items="${movieList}">
<button style="cursor:pointer; margin-left: 0px; margin-right: 5px; margin-bottom: 10px; background-color: #4d4d4d;  border-radius:5px;color:white; border: #4d4d4d; width: 30%;" onclick="go('${movievo.theatername}');">${movievo.theatername}</button>
</c:forEach>