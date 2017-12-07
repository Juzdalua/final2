<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  
  $(document).ready(function(){
	  
	  $("#changePasswd").hide();
 
 	 
		$(".requiredInfo").each(function(){
			   $(this).blur(function(){
				   var data = $(this).val().trim();
				   if(data.length == 0) {
					   $(this).parent().find(".error").show();				   
					   
				   }//if
				   else{
					   $(this).parent().find(".error").hide();	
					  
				   }
			   });
			   
		   });// end of $(".requiredInfo").each()------------
	  
	  
	  var bool1 = false;
	  $("#newpasswd1").blur(function(){
		   
		   var pwd = $(this).val();
		   
		   var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
		   // 암호는 숫자/영문자/특수문자/ 포함 형태의 
		   // 8~15자리 이내만 허락해주는 정규표현식 객체생성
		   
		   var bool = pattern.test(pwd);
		   
		   if(!bool) {
			//   $(this).parent().find(".error").show();
			     $(this).next().show();
				 $(this).val("");
				 bool1 = false;
				 
		   }
		   else{
			  /*  $(this).next().hide();
			   */ bool1 = true;
		   }
			 
	   });// end of $("#pwd").blur()----------------------
	   
	   var bool2 = false;
	   $("#newpasswd2").blur(function(){
		   
		   var pwd = $("#newpasswd1").val();
		   var pwdcheck = $(this).val();
		   		   
		   if(pwd != pwdcheck) {
		//   $(this).parent().find(".error").show();
		     $(this).next().show();
			 $(this).val("");	
			 bool2 = false;
		   }
		   else{
			  /*  $(this).next().hide();
			   */ bool2 = true;
		   }
			 
	   });// end of $("#pwdcheck").blur()----------------------	 
	   
		$("#btnChange").click(function(){		
			
			
			
			if(bool1 && bool2){
				
				var frm = passwdFrm;
				frm.method = "post";
				frm.action = "changePasswd.pz";
				frm.submit();
				
			}//if
		 
		});//btnOk

  });

 function goCheck(){
	 
	 
	 var password = passwdFrm.passwd.value;
	 
	 if(password=="${passwd}"){
		 alert("비밀번호가 확인되었습니다.");
		 var bool = confirm(" 비밀번호를 변경하시겠습니까?? ");
		  if(bool){
			 $("#confirmPasswd").hide();
			 $("#changePasswd").show();
	 }
	 }else{
		 alert("비밀번호가 틀렸습니다.");
	 }
	 
	
 }
   

</script>
<body>
<form name="passwdFrm">
<div class="container" id="confirmPasswd">
	<br/><br/><br/><br/>
	<h2>비밀번호 확인</h2>
	<br/><br/>
	<table>
	<tbody>
	   <tr>
	      <td>이메일&nbsp;&nbsp;</td>
	      <td>${email}</td>
	   </tr>
	   <tr>
	      <td>&nbsp;</td>
	      <td>&nbsp;</td>
	   </tr>
	   <tr>
	      <td>비밀번호&nbsp;&nbsp;</td>
	      <td><input type="password" id="passwd" placeholder="암호를 입력하세요."  class="form-control input-md"/></td>
	   </tr>
	</tbody>
	</table>
	<br/><br/>
	<button type="button" id="btnOk"onClick="goCheck();">확인하기</button>
</div>

<div class="container" id="changePasswd">
<br/><br/><br/><br/>
	<h2>비밀번호 변경</h2>
	<br/><br/>
	<table>
	<tbody>
	   <tr>
	      <td>새 암호 &nbsp;&nbsp;</td>
	      <td><input id="newpasswd1" name="newpasswd1" type="password" placeholder="암호를 입력하세요." class="form-control input-md requiredInfo" required>
	     <span class="help-block error">암호는 영문자,숫자,특수기호를 혼합한 8~15글자를 입력하세요.</span>
	      </td>
	   </tr>
	   <tr>
	      <td>&nbsp;</td>
	      <td>&nbsp;</td>
	   </tr>
	   <tr>
	      <td>새암호 확인&nbsp;&nbsp;</td>
	      <td><input id="newpasswd2" name="newpasswd2" type="password" placeholder="암호를 다시 입력하세요." class="form-control input-md requiredInfo" required>
	       <span class="help-block error">암호와 동일하게 입력하셔야 합니다.</span> </td>
	   </tr>
	</tbody>
	</table>
	<br/><br/>
	<button type="button" id="btnChange">변경하기</button>

</div>


</form>
</body>