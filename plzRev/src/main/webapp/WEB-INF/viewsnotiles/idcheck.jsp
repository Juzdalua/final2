<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    



 
  
   <script src="<%= request.getContextPath() %>/js/jquery-2.0.0.js"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/BootStrapStudy/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/BootStrapStudy/js/bootstrap.min.js">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>  
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/uistyles/jquery-ui.css">
<script src="<%= request.getContextPath() %>/BootStrapStudy/js/bootstrap.js"></script>
  
  
    
 
<script type="text/javascript">

	$(document).ready(function(){
		
		alert("${type}");
		
		$("#userid").keydown(function(event){
			
			var keyCode = event.keyCode;
			
			if(keyCode == 13)
				goCheck();
			
		});//$("#userid").keydown 
		
	});//$(document).ready
	
	function goCheck(){
		
		var userid = document.getElementById("userid");
		var useridVal = userid.value;
		
		//입력값 잘못됨
		if(!useridVal || useridVal.trim()==""){
			alert("ID를 입력하세요");
			userid.value="";
			userid.focus();
			return;
		}//if
		
		//제대로 입력함
		else{
		   
			var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var bool = re.test(useridVal);
			
			if(!bool){
				alert("ID 형식에 어긋납니다.");
				return;
			}//if
			
			else{
				var frm = document.frmIdCheck;
				frm.method = "post";
				frm.action = "idcheck.pz";
				frm.submit();
			}
			//자신에게 submit해서 메소드방식이 post인지 get인지 구분하자.
		}//else
		
	}//goCheck--------------------------------------------------
	
	
	//**팝업창에서 부모창으로 값 넘기기  
	function setUserID(userid){
		
		//opener는 팝업창을 열게한 부모창. --> 회원가입창		
		var openerfrm = opener.document.registerFrm;
		
		//부모창에 중복검사한 아이디를 입력하고 중복검사창을 닫자.
		openerfrm.userid.value = userid;
		
		//다음 입력란인 비밀번호 입력창 활성화하기.
		openerfrm.pwd.disabled = false;
		openerfrm.pwd.focus();
		
		//팝업창 닫기 --> 팝업창을 열게한 부모창으로 복귀한다.
		self.close();
		//self는 팝업창 자기자신. --> 중복검사창	
		
	}//setUserID()----------------------------------------------
</script>
    
    
<c:if test="${method == 'GET' }">
	<form name="frmIdCheck">
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="userid">아이디찾기</label>  
		  <div class="col-md-2">
		  <input id="userid" name="userid" type="text" placeholder="semi@plz.Rev" class="form-control input-md" required>		    
		  </div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="btnOk"></label>
		  <div class="col-md-4">
		    <button id="btnOk" name="btnOk" class="btn btn-primary" onClick="goCheck();">검색</button>
		  </div>
		</div>
	</form>
</c:if>


<c:if test="${method == 'POST' }">

	<c:if test="${isUseuserid == 0}">
			<div align="center">
				ID로 [<span style="color: maroon; font-weight: bold;" >${userid }</span>]사용 가능합니다.
				<br/><br/>
				<button type="button" class="btn btn-primary" onClick="setUserID('${userid}');">사용하기</button>
			</div>		
	</c:if>
	
	<c:if test="${isUseuserid == 1}">
		<div align="center">
			[<span style="color: maroon; font-weight: bold;">${userid }</span>]는 이미 사용중 입니다.
			<br/><br/>
			<!-- 사용불가 메세지를 띄우고 다시 회원가입 폼을 보여주기. -->
			<form name="frmIdCheck">
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="userid">아이디찾기</label>  
				  <div class="col-md-2">
				  <input id="userid" name="userid" type="text" placeholder="ID를 입력하세요" class="form-control input-md" required>		    
				  </div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="btnOk"></label>
				  <div class="col-md-4">
				    <button id="btnOk" name="btnOk" class="btn btn-primary" onClick="goCheck();">검색</button>
				  </div>
				</div>
			</form>
		</div>
	</c:if>
</c:if>