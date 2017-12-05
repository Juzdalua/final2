<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	
	$(document).ready(function(){
		alert("${type}");
		//에러감추기
		$(".error").hide();
		$("#userid").attr('disabled', true);
		
		//아이디 중복검사
		$("#useridBtn").click(function(){
			
			window.open("idcheck.pz", "idcheck",
		    "left=500px; top=100px; width=500px; height=200px;");
			
		});//아이디 중복검사

		
		//=====================유효성 검사s
		//공백검사
		
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
		
		
	   //암호검사
	   var bool1 = false;
	   $("#pwd").blur(function(){
		   
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
			   $(this).next().hide();
			   bool1 = true;
		   }
			 
	   });// end of $("#pwd").blur()----------------------
	   
	   //암호 재검사
	   var bool2 = false;
	   $("#pwd2").blur(function(){
		   
		   var pwd = $("#pwd").val();
		   var pwdcheck = $(this).val();
		   		   
		   if(pwd != pwdcheck) {
		//   $(this).parent().find(".error").show();
		     $(this).next().show();
			 $(this).val("");	
			 bool2 = false;
		   }
		   else{
			   $(this).next().hide();
			   bool2 = true;
		   }
			 
	   });// end of $("#pwdcheck").blur()----------------------	   
	   
	 	//성명검사
	 	var bool3 = false;
	   $("#name").blur(function(){
		   
		  var name = $("#name").val();
		 var re = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;

		 var bool = re.test(name);
		   		   
		   if(!bool) {
		//   $(this).parent().find(".error").show();
		     $("#name").next().show();				 
		     $("#name").val("");
		     bool3 = false;
		   }
		   else{
			   $("#name").next().hide();
			   bool3 = true;
		   }
		   
	   });//
	   
	 	var bool4 = false;
		   $("#birth").blur(function(){
			   
			  var birth = $("#birth").val();
			 var re = new RegExp(/^[0-9]{7}$/);

			 var bool = re.test(birth);
			   		   
			   if(!bool) {
			//   $(this).parent().find(".error").show();
			     $("#birth").next().show();				 
			     $("#birth").val("");
			     bool4 = false;
			   }
			   else{
				   $("#birth").next().hide();
				   bool4 = true;
			   }
			   
		   });//
	   
		//회원가입버튼클릭
		$("#btnOk").click(function(){		
			
			if(bool1 && bool2 && bool3 && bool4){
			   
				var frm = registerFrm;
				frm.method = "post";
				frm.action = "memberRegister.pz";
				frm.submit();
			}//if
		 
		});//btnOk
		
	});

</script>
	    
	
	<form class="form-horizontal" name="registerFrm">
	<fieldset>
	
	<!-- Form Name -->
	<legend style="text-align: center; ">회원가입</legend>

	<!-- 이메일 -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="userid">이메일</label>  
	  <div class="col-md-4">
	  <input id="userid" name="userid" type="text" placeholder="중복검사를 하세요." class="form-control input-md requiredInfo" required>
	  <button type="button" name="useridBtn" id="useridBtn">중복검사</button>
	  </div>
	</div>
	
	
	<!-- Password input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="passwd">암호</label>
	  <div class="col-md-4">
	    <input id="pwd" name="pwd" type="password" placeholder="암호를 입력하세요." class="form-control input-md requiredInfo" required>
	    <span class="help-block error">암호는 영문자,숫자,특수기호를 혼합한 8~15글자를 입력하세요.</span>
	  </div>
	</div>
	
	<!-- Password input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="passwd2">암호확인</label>
	  <div class="col-md-4">
	    <input id="pwd2" name="pwd2" type="password" placeholder="암호를 다시 입력하세요." class="form-control input-md requiredInfo" required>
	    <span class="help-block error">암호와 동일하게 입력하셔야 합니다.</span>
	  </div>
	</div>
	
	
	<!-- 성명 -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="name">성명</label>  
	  <div class="col-md-4">
	  <input id="name" name="name" type="text" placeholder="성명을 입력하세요." class="form-control input-md requiredInfo" required>
	  <span class="help-block error">성명을 입력하세요.</span>  
	  </div>
	</div>
	
	<!-- 생년월일 -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="name">생년월일</label>  
	  <div class="col-md-4">
	  <input id="birth" name="birth" type="text" placeholder="주민번호 둘째자리 첫번째 수까지 입력하세요." class="form-control input-md requiredInfo" required>
	  <span class="help-block error">1111111</span>  
	  </div>
	</div>
	
	<!-- Button (Double) -->
	<div class="form-group" align="left">
	  <label class="col-md-4 control-label" for="btnOk"></label>
	  <div class="col-md-8">
	    <button id="btnOk" name="btnOk" class="btn btn-info">회원가입</button>
	    <button type="reset" id="btnReset" name="btnReset" class="btn btn-danger">취소</button>
	  </div>
	</div>
	
	
	</fieldset>
	</form>
		       
		       
		       
	       
	       
       
       
       
       
       
       