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
      
      
      
      
      /* Full-width input fields */
.input-type {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
.button-login {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.button-login:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.container-head {
    padding: 16px;
}

.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal-head {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content-head {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close-head {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close-head:hover,
.close-head:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    .psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>

<script src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    
<script>
	
	$(document).ready(function(){
		 
		 $("#btnLOGIN").click(function() {
			 func_Login(event);
		 }); // end of $("#btnLOGIN").click();-----------------------
		 
		 $("#passwd-head").keydown(function(event){
				
				if(event.keyCode == 13) { // 엔터를 했을 경우
					func_Login(event);
				}
		 }); // end of $("#pwd").keydown();-----------------------	
		 
	}); // end of $(document).ready()---------------------------	 
	
	
	function func_Login(event) {
		
		if(${sessionScope.loginuser != null}) {
			 alert("이미 로그인을 하신 상태 입니다 !!");
			 $("#email-head").val(""); 
			 $("#passwd-head").val("");
			 $("#email-head").focus();
			 event.preventDefault();
			 return; 
		 }
		 
		 var userid = $("#email-head").val(); 
		 var pwd = $("#passwd-head").val(); 
		
		 if(userid.trim()=="") {
		 	 alert("아이디를 입력하세요!!");
			 $("#email-head").val(""); 
			 $("#email-head").focus();
			 event.preventDefault();
			 return;
		 }
		
		 if(pwd.trim()=="") {
			 alert("비밀번호를 입력하세요!!");
			 $("#passwd-head").val(""); 
			 $("#passwd-head").focus();
			 event.preventDefault();
			 return;
		 }
	
		 document.loginFrm.action = "/rev/loginEnd.pz";
		 document.loginFrm.method = "post";
		 document.loginFrm.submit();
		 
	}  // end of function func_Login(event)-----------------------------

	// Get the modal
	var modal = document.getElementById('id01');
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>

<body>
    <div class="navbar-fixed-top" id="fixed-menu" align="center" style="border-bottom:1px solid #e6e6e6; height:50px;">
      <table>
      	<tr style="border-left:none; border-right:none;">
      		<th style="border-left:none;"><a href="index.pz"><img src="<%=request.getContextPath() %>/resources/images/megabox.png"></a></th>
      		<th><a href="jun_movie.pz">영화</a></th>
      		<th><a href="booking.pz">예매</a></th>
      		<th><a href="#">영화관</a></th>
      		<th><a href="#">스토어</a></th>
      		<th><a href="#">이벤트</a></th>
      		<th><a href="#">고객센터</a></th>
      		<c:if test="${sessionScope.loginuser == null }">      		

      			<th class="t-style"><a style="cursor:pointer;" onclick="document.getElementById('id01').style.display='block'">로그인</a></th>

      			<th><a href="<%=request.getContextPath()%>/login.pz">로그인</a></th>

      		</c:if>

      		<c:if test="${sessionScope.loginuser != null }">    		
      			<th class="t-style"><a href="mypage.pz">MY페이지</a></th>
      			<th class="t-style"><a href="<%=request.getContextPath()%>/logout.pz">로그아웃</a></th>
      		</c:if> 

      		<c:if test="${sessionScope.loginuser != null }">      		
      			<th><a href="#">MY페이지</a></th>
      			<th><a href="<%=request.getContextPath()%>/logout.pz">로그아웃</a></th>
      		</c:if>

      	</tr>
      </table>  
      
      
	<div id="id01" class="modal-head">
	  
	  <form class="modal-content-head animate" name="loginFrm">
	    
	    <div class="container-head">
	      <label><b>Email</b></label>
	      <input class="input-type" type="text" placeholder="Enter Email" name="email-head" id="email-head" required>
	
	      <label><b>Password</b></label>
	      <input class="input-type" type="password" placeholder="Enter Password" name="passwd-head" id="passwd-head" required>
	        
	      <button type="submit" id="btnLOGIN">Login</button>
	      <input type="checkbox" checked="checked"> Remember me
	    </div>
	
	    <div class="container-head" style="background-color:#f1f1f1">
	      <button class="button-login" type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button><br>
	      <p><span class="psw">Forgot <a href="#">password?</a></span>&nbsp; or 
	      &nbsp;<span class="psw">New here? <a href="register.pz">Join Us!</a></span></p>
	    </div>
	  </form>
	</div>
      
      
    </div>
    <div id="main-content">
      
    </div>
</body>
  
</html>