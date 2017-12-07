<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://service.iamport.kr/js/iamport.payment.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>

   div.section > div {width:100%;display:inline-flex;}
   div.section > div > input {margin:0px;padding-left:5px;font-size:10px;padding-right:5px;max-width:10%;text-align:center;}
  .btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0px;}
  .btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0px;}
  .title-attr{margin-top:0px;margin-bottom:0px;color:black;}
</style>

<script type="text/javascript">
    
   $(document).ready(function(){

	   totalMoeny("1");
	
	  $(".btn-minus").on("click",function(){
	      var now = $(".section > div > input").val();
	      if ($.isNumeric(now)){
	          if (parseInt(now) -1 > 0){ now--;}
	          $(".section > div > input").val(now);
	          totalMoeny(parseInt(now));
	      }else{
	          $(".section > div > input").val("1");
	      }
	  });        
	  
	  $(".btn-plus").on("click",function(){
	      var now = $(".section > div > input").val();
	      
	      if ($.isNumeric(now)){
	    	  if(parseInt(now) + 1 > 8){ now--;}
	          $(".section > div > input").val(parseInt(now)+1);
	          totalMoeny(parseInt(now)+1);
	      }else{
	          $(".section > div > input").val("1");
	      }
	  });  


	}); //end of $(document).readty() --------
	  

	
	function totalMoeny(rqty) {
	
		var coupon_price ="${detail.coupon_price}";
		
    	var form_data = { 
    			"rqty":rqty,
    			"coupon_price":coupon_price};

	$.ajax({
		url: "totalMoneyAjax.pz",
		type: "GET",
		data: form_data,
		dataType: "html",
		success: function(data){
							
			  $("#totalMoney").empty();
        	  $("#totalMoney").html(data);
		 				
		},// end of success: function(data)----------
		error: function(){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	    }
	});
	
	}
	
  function goBuy(){
      var email = "${sessionScope.loginuser.email}";
      if(email==""){
		  alert("로그인 먼저 해주세요~");
		  return;
		  
	  }else{
		 
		  var total =parseInt("${detail.coupon_price}")*parseInt(document.buyFrm.rqty.value);
		  
		  IMP.init('imp01353496'); 
		  IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:예매를 부탁해',
			    amount :total,
			    buyer_email : email,
			    buyer_name : '${sessionScope.loginuser.name}'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
					var buyFrm = document.buyFrm;
					buyFrm.action = "<%= request.getContextPath() %>/buyEnd.pz";
					buyFrm.method = "post";
					buyFrm.submit();
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			    }
	
			    alert(msg);
			});
	  }
  	
  }//end of goSubmit()

    
</script>

<form name="buyFrm">
 <h2 align="left"><span style="margin-left:24%">${detail.name}</span></h2> 
 <h4  align="left"><span style="margin-left:24%">NO.${detail.store_eventno}</span></h4>&nbsp;&nbsp;


<div class="container" style="border : 0px solid gray">
  <div class="row">
     <hr style="width: 80%;">
     <div class="col-xs-7" style="border: 0px solid gray">
     <h4>판매기간:${detail.start_day}~</h4><br/>
     <img src="<%= request.getContextPath() %>/resources/jhy_images/${detail.img_main}" alt="Image"></a><br/><br/>
     </div>
     
     <div class="col-xs-4" style="border:0px solid gray;">
          <h3 style="font-weight: bold; text-align: left;">${detail.name}</h3>
          <hr style="width: 98%;">  
          <h5 style="text-align: left;">사용가능 영화관 :전체영화관  </h5><br/>
          <h5 style="text-align: left;">유효기간 : 쿠폰사용 유효기간은 쿠폰다운로드 이후 30일 이내 입니다. (일자기준)</h5><br/>
          <h5 style="text-align: left;">판매수량 :1회 8개 구매가능. </h5><br/>
          <h5 style="text-align: left;">구매 후 취소 :구매한 관람권은 환불 불가합니다.</h5>
          <hr style="width: 98%;"> 
          <div align="left" style="margin-left:2%;">
          <span>·판매가:</span>
          <span style="margin-left:60%; font-size:12pt;"><fmt:formatNumber value="${detail.coupon_price}" pattern="###,###"/>원</span>
          </div>
          <br/>
          <div class="section" align="left" style="margin-left:2%;">
          <div>
          <span>·수량:</span>
            <div style="margin-left:60%; "class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
            <input id="rqty" name="rqty" value="1" />
            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
           </div>
          </div>
          <br/> 
          <div align="left" style="margin-left:2%;" id="totalMoney">
          </div>
        
          <br/><br/><br/>
          
          
          <c:if test="${detail.status==1}">
          <button type="button" style="width:200px; height:50px; background-color:#351F65;" onClick="goBuy();"><span style="color: white; font-size:13pt; font-weight:bold">구매하기</span></button>
          </c:if>
          <input type="hidden" name="loginuser" value="${sessionScope.loginuser}" />
          <input type="hidden" name="store_eventno" value="${detail.store_eventno}" />
          <input type="hidden" name="coupon_price" value="${detail.coupon_price}" />

		   <br/><br/><br/><br/>
	
      </div>
     </div>
 </div>
 </form>
 
