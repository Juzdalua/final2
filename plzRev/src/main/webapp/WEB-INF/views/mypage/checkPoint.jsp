<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.box1{  position:relative;
			text-align:left; 
			border:3px solid #351F65; 
			height:100px; 
			text-align:center;}
			
	.under-box1{padding-top:30px;}
	.table{border-top:2px solid #351F65;}
    .th-color{background-color:#f1f1f1;} 	            
</style>
<script>
	$(document).ready(function(){
		
		$("#btnTotalCountpointJSON").hide();
		$("#btnCountpointJSON").hide();
		$("#btnPeriod").hide();
		
		displayPoint("1", "7");	//기본적으로 7일이내의 기록을 보여준다.
		
		$("#btnMorepoint").click(function(){
			displayPoint($(this).val(), parseInt($("#numPeriod").text()));
	     });
	});

	function goSearch(){
		var period = $("input[type=radio][name=period]:checked").val();
		
		$("#pointList").empty();
        $("#btnMorepoint").show();
        $("#countPoint").text(parseInt('0')); 
        
		if(period == 0){
			$("#totalCountpoint").text(parseInt('${pointotal}')); 
		}
		else if(period == 7){
			$("#totalCountpoint").text(parseInt('${pointotal7}')); 
		}
		else if(period == 30){
			$("#totalCountpoint").text(parseInt('${pointotal30}')); 
		}
		else if(period == 90){
			$("#totalCountpoint").text(parseInt('${pointotal90}')); 
		}
		
		$("#numPeriod").text(parseInt(period));
		displayPoint("1", period);	// 항목 1번부터 선택한 기한을 조건으로 검색한 리스트를 갖고온다.
	}
	
	var len = 8;
	
	function displayPoint(start, period){
		//ajax로 포인트 조회하기
		var form_data = { "start" : start
		                 ,"len"   : len                
		                 ,"email" : $("#email").val()
		                 ,"period": period
		             };
		
		 $.ajax({
		    url: "mypage_point.pz",
		    type: "get",
		    data: form_data,
		    dataType: "JSON",
		    success: function(data){
		    
		       var html = "";
		       // 목록이 전체,영화,매점중 어디에 필터링 됐는지 구분하는 문자 넣어주기
		        
		       if (data == null || data.length == 0) {
		          html += "<td colspan='5' style='text-align:center; text-size:20pt;'>!포인트 내역이 없습니다.</td>"; 
		          
		          $("#btnMorepoint").hide();
		          // 결과를 출력하기
		          $("#pointList").html(html);
		       }
		    
		    else {
		       
		       $.each(data, function(entryIndex, entry){
		          html += " <tr> "
		          html += "        <td>"+entry.reg_time+"</td>";
		          html += "        <td>"+entry.content+"</td>";
		          html += "        <td>"+entry.type_name+"</td>";
		          html += "        <td style='color:blue;'>"+entry.point_name+"</td>";
		          html += " </tr> "
		       }); // end of $.each()-------------
		       
		       // 조회해온 상품의 정보를 출력하기
		        $("#pointList").append(html);
		         
		        // >>>> !!!! 중요 !!!! "더보기..." 버튼의 value 속성에 값을 지정해주기(중요!!!!) <<<<<
		        $("#btnMorepoint").val(parseInt(start)+len);
		      
		        // 웹브라우저상에 count 출력하기
		        $("#countPoint").text( parseInt($("#countPoint").text()) + data.length );
		        
		    // "더보기..." 버튼의 비활성화 처리해야 한다.
		        if ( $("#totalCountpoint").text() == $("#countPoint").text() ) 
		        { 
		           $("#btnMorepoint").hide();
		        }
		       
		    }// end of if~else-----------------
		    
		              
		 },// end of success: function(data)----------
		 error: function(request, status, error){
		    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 }
		 
		});
	}//end of displayPoint()--------------------------

</script>
<input type="hidden" id="email" name="email" value="${email}">
<span style="margin-left:10%; float:left; font-size:20pt;">포인트 내역을 확인하세요!

</span><br><br>
<br>
<br>
<div class="container">
	
	<div class="container box1" >
		<p class="under-box1"><span>기간</span>&nbsp;
			<input type="radio" name="period" id="7" value="7"><label for="7">최근 7일</label>&nbsp;
			<input type="radio" name="period" id="30" value="30"><label for="30">최근 30일</label>&nbsp;
			<input type="radio" name="period" id="90" value="90"><label for="90">최근 90일</label>&nbsp;
			<input type="radio" name="period" id="0" value="0"><label for="0">전체</label>&nbsp;
			<button type="button" id="btnSearch" onClick="goSearch();">조회</button>
		</p>
	</div>
</div>
<div class="container">
	<br><br><br>
	<table class="table">
	 <thead>
	   <tr>
	     <th class="th-color">이용시간</th>
	     <th class="th-color">내역</th>
	     <th class="th-color">거래유형</th>
	     <th class="th-color">포인트</th>
	   </tr>
	 </thead>
	   <tbody id="pointList" >
	
	  </tbody>
	</table>
	
		
	<div style="margin-top: 20px; margin-bottom: 20px;">
	   <button type="button" class="btn btn-default btn-block" id="btnMorepoint" value=""> 더보기</button>
	   <button type="button" id="btnTotalCountpointJSON">TotalCount : <span id="totalCountpoint">${pointotal7}</span></button>
	   <button type="button" id="btnCountpointJSON">Count : <span id="countPoint">0</span></button>
	   <button type="button" id="btnPeriod">Signal : <span id="numPeriod">7</span></button>
	</div>
</div>












