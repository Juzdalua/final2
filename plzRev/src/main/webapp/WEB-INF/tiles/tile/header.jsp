<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
      body {
        margin: 0;
      }
      #fixed-menu {
         width: 100%;
		  background-color: #ffffff;
		  position: fixed;
		  top: 0px;
		  left: 0px;
      }
      #main-content {
        width: 100%;
        margin-top: 120px;
      }
      #fixed-menu li {
        display: inline-block;
        margin-right: 30px;
      }
      
      table,tr,th{
      	border:1px solid #e6e6e6;
      	padding-left:40px;
      	padding-right:40px; 
      	font-size:12pt; 
      	height:100%;      
      	border-bottom: none;	    	      	
      }
      
      table{
      	border-left:none;
      	border-right:none;
      }
      
      a{
      	color: black;      	
      }
      a:hover, a:active{
      	text-decoration: none;
      }
</style>

<script src="<%=request.getContextPath()%>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    
<script>    
    
    
</script>

<body>
    <div id="fixed-menu" align="center" style="border-bottom:1px solid #e6e6e6; height:50px;">
      <table>
      	<tr style="border-left:none; border-right:none;">
      		<th style="border-left:none;"><a href="index.pz"><img src="<%=request.getContextPath() %>/resources/images/megabox.png"></a></th>
      		<th><a href="#">영화</a></th>
      		<th><a href="#">영화관</a></th>
      		<th><a href="#">스토어</a></th>
      		<th><a href="#">이벤트</a></th>
      		<th><a href="#">고객센터</a></th>
      		<c:if test="${sessionScope.loginuser == null }">      		
      			<th><a href="<%=request.getContextPath()%>/login.pz">로그인</a></th>
      		</c:if>
      		<c:if test="${sessionScope.loginuser != null }">      		
      			<th><a href="#">MY페이지</a></th>
      			<th><a href="<%=request.getContextPath()%>/logout.pz">로그아웃</a></th>
      		</c:if>
      	</tr>
      </table>  
      
    </div>
    <div id="main-content">
      
    </div>
</body>
  
</html>