<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화, 메가박스</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap-3.3.7-dist/css/bootstrap.css">
  <link rel="icon" href="<%=request.getContextPath() %>/resources/images/m.ico"> 

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    
  <style type="text/css">
  	#mycontainer	{ width:90%; margin:0 auto; padding:20px; }
	#myheader		{  height:56px; padding: 10px; }
	#mycontent		{  width:80%; min-height:800px; padding-top: 40px; margin: auto 0;}
	#myfooter		{  height:100px; }
	
	
	</style>
</head>

<body>
	<div id="mycontainer" align="center">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="myheader2">
			<tiles:insertAttribute name="header2" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
			
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>