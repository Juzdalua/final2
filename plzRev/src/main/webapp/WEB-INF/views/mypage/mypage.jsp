<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>mymovie</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
  
  
</head>
<style>
   .megabox-color{color:#351F65;}
   .white-color{background-color:white;}
   li{ border:1px solid #e6e6e6;
      background-color:#f1f1f1;}
   .background{border:5px solid #f1f1f1;}
   .table{border-top:2px solid #351F65;}
   .th-color{background-color:#f1f1f1;} 
   .couponMouse{cursor:pointer;
            color:#351F65;
            font-weiht:bold;}
   .modal-content-detail{  background-color: #fefefe;
                      margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                      border: 1px solid #888;
                      width: 40%; /* Could be more or less, depending on screen size */
                      height: 50%;
                      }
   .button-detail {
             background-color: #4CAF50;
             color: white;
             padding: 14px;
             margin: 8px 0;
             border: none;
             cursor: pointer;
             width: 100%;
         }
         
   .button-detail:hover {
       opacity: 0.8;
   }
   @media screen and (max-width: 300px) {
       
       .cancelbtn-detail {
          width: 100%;
          padding-bottom:300px;
          margin-bottom:300px;
       }
   }   
   
</style>
<script type="text/javascript">
   
   $(document).ready(function(){
       
      $("#btnTotalCountCouJSON").hide();
      $("#btnCountCouJSON").hide(); 
      $("#btnSignal").hide();
      $("#btnTotalCountQnaJSON").hide();
      $("#btnCountQnaJSON").hide(); 
      
      
      // 쿠폰더보기... 버튼을 클릭했을 경우 이벤트 등록하기
      $("#btnMoreCou").click(function(){
         displayCoupon($(this).val(), parseInt($("#numSignal").text()));
      });
      
      // '나의 쿠폰함'메뉴를 누르면 새로고침된다.
      $("#mycoupon").click(function(){
         $("#menu1-display").empty();
         $("#btnMoreCou").show();
         $("#countCoupon").text(parseInt('0')); 
         $("#totalCountCoupon").text(parseInt('${totalcntCoupon}')); 
         $("#numSignal").text(parseInt('1'));
         displayCoupon("1","1");
      });
      
      
      // 영화관련 쿠폰 메뉴를 누른 경우
      $("#movie_coupon").click(function(){
         $("#menu1-display").empty();
         $("#btnMoreCou").show();
         $("#countCoupon").text(parseInt('0')); 
         $("#totalCountCoupon").text(parseInt('${cntMovieCoupon}')); 
         $("#numSignal").text(parseInt('2'));
         displayCoupon("1","2");
      });
      
      // 매점관련 쿠폰 메뉴를 누른 경우
      $("#store_coupon").click(function(){
         $("#menu1-display").empty();
         $("#btnMoreCou").show();
         $("#countCoupon").text(parseInt('0'));
         $("#totalCountCoupon").text(parseInt('${cntStoreCoupon}')); 
         $("#numSignal").text(parseInt('3'));
         displayCoupon("1","3");
      });
      
      $("#myqna").click(function(){
      
         $("#menu3-display").empty();
         $("#btnMoreQna").show();
         $("#countQna").text(parseInt('0')); 
         $("#totalCountQna").text(parseInt('${totalcntQna}')); 
         
          displayQna("1");
      });
      
      $("#btnMoreQna").click(function(){
         displayQna($(this).val());
      });
      
   });//end of $(document).ready(function()----------------------
   
     function show(coupon_no){
         //modal을 띄워준다.  
          
          var form_data = { "coupon_no" : coupon_no 
                       ,"email" : $("#email").val()};
          
         $.ajax({
            url: "couponDetailAjax.pz",
            type: "get",
            data: form_data,
            dataType: "HTML",
            success: function(data){
            
               var html = "";
               
               if (data == null || data.length == 0) {
                  html += "<td colspan='5' style='text-align:center; text-size:20pt;'>상품정보가 없습니다.</td>"; 
                  $("#couponDetailContent").empty();
                  $("#couponDetailContent").html(html);
               }
               
               else {
                  $("#couponDetailContent").empty();
                  $("#couponDetailContent").html(data);
               }// end of if~else-----------------
               
                         
            },// end of success: function(data)----------
            error: function(request, status, error){
               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
            
         });
          
         document.getElementById('couponDetail').style.display='block';
      };//   function show(coupon_no)----------------------------   
         
   var len =8; // 더보기... 클릭에 보여줄 상품의 갯수 단위 크기
         
   // category_signal --> 1: 전체 / 2: 영화관련 / 3: 매점관련
   function displayCoupon(start, signal){
      // display 할 쿠폰정보를 추가해주는 함수(Ajax 로 처리)
      
       var form_data = { "start" : start
                        ,"len"   : len                
                       ,"email" : $("#email").val()
                       ,"category_signal" : signal
                       };
       
      $.ajax({
         url: "mypage_coupon.pz",
         type: "get",
         data: form_data,
         dataType: "JSON",
         success: function(data){
         
            var html = "";
            // 목록이 전체,영화,매점중 어디에 필터링 됐는지 구분하는 문자 넣어주기
             
            if (data == null || data.length == 0) {
               html += "<td colspan='5' style='text-align:center; text-size:20pt;'>!쿠폰 내역이 없습니다.</td>"; 
               
               $("#btnMoreCou").hide();
               // 결과를 출력하기
               $("#menu1-display").html(html);
            }
            
            else {
               
               $.each(data, function(entryIndex, entry){
                  html += " <tr> "
                  html += "        <td>"+entry.rno+"</td>";
                         /*  <!-- 1 - 영화 관람권 / 2- 매점 교환권  / 3- 영화 할인권 / 4 - 매점 할인권 / 5 - 일반 이벤트 --> */
                  html += "        <td>"+entry.category_name+"</td>";
                  
                  html += "        <td><span onClick='"+show(entry.coupon_no)+"'>"+entry.fk_name+"("+entry.coupon_no+")</a></td>";
                  
                  html += "        <td>"+entry.buy_date+" ~ "+entry.unable_date+"</td>";
                  html += "        <td>"+entry.status_name+"</td>";
                  html += " </tr> "
               }); // end of $.each()-------------
               
               // 조회해온 상품의 정보를 출력하기
                $("#menu1-display").append(html);
                 
                // >>>> !!!! 중요 !!!! "더보기..." 버튼의 value 속성에 값을 지정해주기(중요!!!!) <<<<<
                $("#btnMoreCou").val(parseInt(start)+len);
                 
                // 웹브라우저상에 count 출력하기
                $("#countCoupon").text( parseInt($("#countCoupon").text()) + data.length );
                
               //$("#numSignal").text(parseInt(category_signal));
                
                // totalCountCoupon 와 countCoupon 의 값이 일치하는 경우에는 
                // "더보기..." 버튼의 비활성화 처리해야 한다.
                if ( parseInt($("#totalCountCoupon").text()) == parseInt($("#countCoupon").text()) ) 
                { 
                   $("#btnMoreCou").hide();
                }
               
            }// end of if~else-----------------
            
                      
         },// end of success: function(data)----------
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
         }
         
      });
   
   }

   

   
   function showQna(serviceno){
      
      var modal = document.getElementById('QnAdetail');
      
      modal.style.display="block";
       
      window.onclick = function(event) {
          if (event.target == modal) {
               modal.style.display = "none";
            }
       }   
   
      var form_data = { "serviceno":serviceno };

      $.ajax({
         url: "qnaDetail.pz",
         type: "GET",
         data: form_data,
         dataType: "html",
         success: function(data){
           $("#qnaDetail").empty();
           $("#qnaDetail").append(data);
          } 
      });
      
   }
   
   
   
   function displayQna(start){
      
    var form_data = { "start" : start
                     ,"len"   : len                
                    ,"email" : $("#email").val()
                  };
   
      $.ajax({
         url: "mypage_qna.pz",
         type: "get",
         data: form_data,
         dataType: "JSON",
         success: function(data){
         
            var html = "";
            // 목록이 전체,영화,매점중 어디에 필터링 됐는지 구분하는 문자 넣어주기
             
            if (data == null || data.length == 0) {
               html += "<td colspan='5' style='text-align:center; text-size:20pt;'>!문의 내역이 없습니다.</td>"; 
               
               $("#btnMoreQna").hide();
               // 결과를 출력하기
               $("#menu3-display").html(html);
            }
         
         else {
            
            $.each(data, function(entryIndex, entry){
               html += " <tr> "
               html += "        <td>"+entry.rno+"</td>";
               html += "        <td>"+entry.serviceno+"</td>";
               html += "        <td><span style='cursor:pointer;' onClick='showQna("+entry.serviceno+")'>"+entry.title+"</span></td>";
               html += "        <td>"+entry.writedate+"</td>";
               html += "        <td>"+entry.status_name+"</td>";
               html += " </tr> "
            }); // end of $.each()-------------
            
            // 조회해온 상품의 정보를 출력하기
             $("#menu3-display").append(html);
              
             // >>>> !!!! 중요 !!!! "더보기..." 버튼의 value 속성에 값을 지정해주기(중요!!!!) <<<<<
             $("#btnMoreQna").val(parseInt(start)+len);
           
             // 웹브라우저상에 count 출력하기
             $("#countQna").text( parseInt($("#countQna").text()) + data.length );
             
         // "더보기..." 버튼의 비활성화 처리해야 한다.
             if ( parseInt($("#totalCountQna").text()) == parseInt($("#countQna").text()) ) 
             { 
                $("#btnMoreQna").hide();
             }
            
         }// end of if~else-----------------
         
                   
      },// end of success: function(data)----------
      error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
      
   });
      }
</script>
<body>
<input type="hidden" id="email" name="email" value="${email}">
<input type="hidden" id="point" name="point" value="${point}">
<div class="container background">
   <div class="container" style="text-align:left; " >
      <h2><span class="megabox-color">마이시네마</span></h2>
     <div class="row " style="padding-right:50px;">
           <div class="col-sm-12" style="background-color:#351F65; color:white;">
            <h5><span style="font-weight:bold;">${name }님 환영합니다!</span></h5>
          </div>
          <div class="col-sm-6 " >
            <h3>My Point</h3><br>
            <c:if test="${point > 99}">
               <span style="background-color:blue; color:white; font-size:9pt; font-weight:bold;">사용가능</span>
            </c:if>
            <c:if test="${point < 100}">
               <span style="background-color:red; color:white; font-size:9pt; font-weight:bold;">사용불가</span>
            </c:if>
            
            <span style="text-align:right;">${point}<span style="color:orange;">P</span></span>
          </div>
          <div class="col-sm-6 " style="border-left:1px solid #f2f2f2;">
            <h3>보유 쿠폰 정보</h3><br>
            <h6>사용 가능한 영화쿠폰 &nbsp;&nbsp;${SerMovieCoupon }</h6>
            <h6>사용 가능한 매점쿠폰 &nbsp;&nbsp;${serStoreCoupon }</h6>
            <br><br>
          </div>
     </div>
     
   </div>
   <br>
</div>
  
   
<div class="container">
<br><br>
   <div class="container">
             <ul class="nav nav-tabs">
                <li id="myrev" class="active"><a data-toggle="tab" href="#home" title="예매/구매내역 보기">예매 내역</a></li>
                <li id="mycoupon"><a data-toggle="tab" href="#menu1">나의 쿠폰함</a></li>
                <li id="myreview"><a data-toggle="tab" href="#menu2">나의 리뷰</a></li>
                <li id="myqna"><a data-toggle="tab" href="#menu3">나의 문의내역</a></li>
                <li id="myinfo"><a data-toggle="tab" href="#menu4">나의 정보관리</a></li>
          </ul>
          <br/><br/>
          
          <div class="tab-content">
          <div id="home" class="tab-pane fade in active">
             <h3 style="font-size: 20pt;">요약</h3>
             
           </div>
           
           
          <div id="menu1" class="tab-pane fade">
             <div style="text-align:left; height:50px; margin-top:-2%;">
                <a id="movie_coupon" style="cursor:pointer;">영화관람/할인권</a>&nbsp;|&nbsp;
                <a id="store_coupon" style="cursor:pointer;">매점교환/할인권</a>
             </div>
              <br><br>
              
              <p style="text-align:left !important;">쿠폰명을 클릭하시면 상세한 쿠폰 정보를 확인하실 수 있습니다.
                 <!-- &nbsp;<button type="button" id="ser_coupon" style="float:right;">검색</button>&nbsp;
               <select name="colname" id="colname" style="height:28px; float:right;">
                  <option value="all" selected>전체</option>
                  <option value="ser">사용가능</option>
                  <option value="nonser">사용불가</option>
               </select>&nbsp;
                -->
              </p>  
                
               <table class="table">
                <thead>
                  <tr>
                    <th class="th-color">번호</th>
                    <th class="th-color">분류</th>
                    <th class="th-color">쿠폰명(번호)</th>
                    <th class="th-color">사용기간</th>
                    <th class="th-color">쿠폰상태</th>
                  </tr>
                </thead>
                <tbody id="menu1-display" >
               
                  </tbody>
                  </table>
               
            <div style="margin-top: 20px; margin-bottom: 20px;">
              <button type="button" class="btn btn-default btn-block" id="btnMoreCou" value=""> 더보기</button>
            <button type="button" id="btnTotalCountCouJSON">TotalCount : <span id="totalCountCoupon"></span></button>
            <button type="button" id="btnCountCouJSON">Count : <span id="countCoupon">0</span></button>
            <button type="button" id="btnSignal">Signal : <span id="numSignal">1</span></button>
           </div>
          </div>
          <div id="couponDetail" class="modal-head">
     
                 <form class="modal-content-detail animate" name="loginFrm">
                   <h3>쿠폰 상세 정보</h3>
                   <div class="container-head" id="couponDetailContent">
                     
                   </div>
               
                   <div class="container-head" style="background-color:#f1f1f1">
                     <button class="button-detail" type="button" onclick="document.getElementById('couponDetail').style.display='none'" class="cancelbtn-detail">close</button><br>
                     
                   </div>
                 </form>
             </div>
        <!--  
          <div id="menu2" class="tab-pane fade">
            <h3>Q & A</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
          </div> -->


          <div id="menu3" class="tab-pane fade">
            <br><br>
              
              <p style="text-align:left !important;">문의 내용을 클릭하시면 상세한 문의 상세정보를 확인하실 수 있습니다.
                 
              </p>  
                
               <table class="table">
                <thead>
                  <tr>
                    <th class="th-color">번호</th>
                    <th class="th-color">문의내역 번호</th>
                    <th class="th-color">제목</th>
                    <th class="th-color">글쓴 날짜</th>
                    <th class="th-color">문의 상태</th>
                  </tr>
                </thead>
                <tbody id="menu3-display" >
               
                  </tbody>
                  </table>
               
            <div style="margin-top: 20px; margin-bottom: 20px;">
              <button type="button" class="btn btn-default btn-block" id="btnMoreQna" value=""> 더보기</button>
            <button type="button" id="btnTotalCountQnaJSON">TotalCount : <span id="totalCountQna"></span></button>
            <button type="button" id="btnCountQnaJSON">Count : <span id="countQna">0</span></button>
           </div>
            </div>
            
           <!-- 문의내역 상세정보 모달 -->
         <div id="QnAdetail" class="modal-head">
              <form class="modal-content-detail animate" name="qnaFrm">
              <h2>문의 상세정보 </h2>
             <div class="container-head" id="qnaDetail">     
             </div>
              <div class="container-head" style="background-color:#f1f1f1">
               <button class="button-detail" type="button" onclick="document.getElementById('QnAdetail').style.display='none'" class="cancelbtn-detail">돌아가기</button><br>
             </div>
           </form>
         </div>
            
            
          <div id="menu4" class="tab-pane fade" style="text-align:center;">
             <div class="btn-group btn-group-justified">
              <a href="editInfo.pz" class="btn btn-default btn-lg">내 정보 수정</a>
              <a href="checkPoint.pz" class="btn btn-default btn-lg">포인트내역 조회</a>
              <a href="#" class="btn btn-default btn-lg">탈퇴</a>
            </div>
            
          </div>
            
         </div>

          </div>
 </div>

</body>
</html>