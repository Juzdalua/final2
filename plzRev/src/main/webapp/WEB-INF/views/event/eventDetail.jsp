<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

  function goDownload() {
		var downFrm = document.downFrm;
		downFrm.action = "<%= request.getContextPath() %>/download.pz";
		downFrm.method = "post";
		downFrm.submit();
	}
  
  function goEnd(){
	  alert("이미 마감된 이벤트로 다운로드 할 수 없습니다.");
  }
</script>

<form name="downFrm">
 <h2 align="left"><span style="margin-left:24%">${detail.fk_name}</span></h2> 
 <h4  align="left"><span style="margin-left:24%">NO.${detail.store_eventno}&nbsp;&nbsp;
   이벤트기간 : ${detail.start_day}~${detail.end_day}</span></h4>

<c:if test="${detail.coupon_price ==null || detail.coupon_price<0}">
  <div class="container" style="border: 0px solid navy;">  
 <hr style="width: 70%;">
 <img src="<%= request.getContextPath() %>/resources/jhy_images/${detail.img_detail}" alt="Image"></a><br/><br/>
 <br/>
</div>
</c:if>

<c:if test="${detail.coupon_price!=null  && detail.coupon_price>0}">
  <div class="container" style="border : 0px solid gray">
  <div class="row">
     <hr style="width: 80%;">
     <div class="col-xs-7 item-photo" style="border: 0px solid gray">
     <img src="<%= request.getContextPath() %>/resources/jhy_images/${detail.img_main}" alt="Image"></a><br/><br/>
     </div>
     <div class="col-xs-4" style="border:0px solid gray;">
          <h3 style="font-weight: bold; text-align: left;">${detail.fk_name}</h3>
          <hr style="width: 98%;">   
          <h5 style="text-align: left;">유효기간 : 쿠폰사용 유효기간은 쿠폰다운로드 이후 30일 이내 입니다. (일자기준)</h5><br/>
          <h5 style="text-align: left;">유의사항 : 쿠폰은 1인당 1매만 다운로드 가능합니다. </h5>
          <hr style="width: 98%;"> 
          <span style="text-align:left !important;">할인 금액:</span><span style="margin-left:60%; font-size:15pt;font-weight:bold"><fmt:formatNumber value="${detail.coupon_price}" pattern="###,###"/>원</span>
          <br/><br/><br/><br/><br/>
          <c:if test="${detail.status==1}">
          <button type="button" style="width:200px; height:50px; background-color:#351F65;" onClick="goDownload();"><span style="color: white; font-size:13pt; font-weight:bold">쿠폰 다운받기</span></button>
          </c:if>
          <c:if test="${detail.status==0}">
           <button type="button" style="width:200px; height:50px; background-color:#351F65;" onClick="goEnd();"><span style="color: white; font-size:13pt; font-weight:bold">쿠폰 이벤트 마감</span></button>
          </c:if>
          <input type="hidden" name="loginuser" value="${sessionScope.loginuser}" />
          <input type="hidden" name="store_eventno" value="${detail.store_eventno}" />
          <input type="hidden" name="coupon_price" value="${detail.coupon_price}" />
          
		   <br/><br/><br/><br/>
      </div>
     </div>
 </div>
 </c:if>
 </form>
 
