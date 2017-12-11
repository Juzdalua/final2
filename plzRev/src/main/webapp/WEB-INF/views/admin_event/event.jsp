<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
	.w3-block {cursor: pointer;}
</style>

<style>
.megabox-color {
   color: #351F65;
}

.white-color {
   background-color: white;
}

.background {
   border: 5px solid #f1f1f1;
}

.table {
   border-top: 2px solid #351F65;
}

.th-color {
   background-color: #f1f1f1;
}

.couponMouse {
   cursor: pointer;
   color: #351F65;
   font-weiht: bold;
}


</style>
<script>

	$(document).ready(function(){
		
		eventAjax("1","1");
    	$("#totalCount").text(parseInt('${totalIngCount}'));
    	$("#btnMoreEND").hide();
		/* $("#btnTotalNEWCountJSON").hide();
		$("#btnCountJSON").hide(); */
    	
    	
        $("#ingEvent").click(function(){
        	$("#admin_event").empty();
        	$("#countNEW").text(parseInt("0"));
        	eventAjax("1","1");
        	$("#btnMoreEND").hide();
        	$("#btnMoreNEW").show();
        	$("#totalCount").text(parseInt('${totalIngCount}'));
        	
         });
        
        $("#btnMoreNEW").click(function(){
        	eventAjax($(this).val(),"1");
        });
        
        
        
    /*     $("#endEvent").click(function(){
        	$("#admin_event").empty();
        	$("#countNEW").text(parseInt("0"));
        	eventAjax("1","0");
        	$("#btnMoreNEW").hide();
        	$("#btnMoreEND").show();
        	$("#totalCount").text(parseInt('${totalEndCount}'));
         }); */
        
        $("#btnMoreEND").click(function(){
        	eventAjax($(this).val(),"0");
        });
        
    });
	
	 var len = 8; // 더보기... 클릭에 보여줄 상품의 갯수 단위 크기
	    
	 function eventAjax(start,status) {
			
	    	var form_data = { 
					   "start" : start
	                   ,"len" : len	 
	                   ,"status": status
		               };

		$.ajax({
			url: "adminEventJSON.pz",
			type: "GET",
			data: form_data,
			dataType: "JSON",
			success: function(data){
								
				var html = "";
				
				if (data == null || data.length == 0) {
					 html += "<td colspan='5' style='text-align:center; text-size:20pt;'>진행중인 이벤트가 없습니다.</td>"; 
		               
					$("#admin_event").html(html);
				}else {
					$.each(data, function(entryIndex, entry){  
						      html += " <tr> "
			                  html += "        <td>"+entry.rno+"</td>";
			                        /*  <!-- 3- 영화 할인권 / 4 - 매점 할인권 / 5 - 일반 이벤트 --> */
			                  html += "        <td>"+entry.category_name+"</td>";
			                  
			                  html += "        <td><span style='cursor:pointer;'>"+entry.fk_name+"("+entry.store_eventno+")</span></td>";

			                  html += "        <td>"+entry.start_day+" ~ "+entry.end_day+"</td>";
			                  html += "        <td><span style='cursor:pointer;' onclick='deleteReview("+entry.reviewno+")'>삭제 </span></td>";
			                  html += " </tr> "
				
					}); // end of $.each()-------------
					
			        $("#admin_event").append(html);
			    	 
			    	// "더보기..." 버튼의 value 속성에 값을 지정해주기
			    	$("#btnMoreNEW").val(parseInt(start)+len);	 
			    	$("#btnMoreEND").val(parseInt(start)+len);	 
					   
			    	$("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
			    	
			    	// "더보기..." 버튼의 비활성화 처리
			    	if ( parseInt($("#totalCount").text()) == parseInt($("#countNEW").text()) ) { 
			    		 $("#btnMoreEND").hide();
				    	 $("#btnMoreNEW").hide();
			    	}
				  
				}// end of if~else-----------------
			 				
			}/* ,// end of success: function(data)----------
			error: function(){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
		    } */
		});
		
	}// end of function callAjax()---------------
    


</script>


<div style="padding-bottom: 30%;">
<h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="">이벤트 관리 페이지</a></span></h2>
	
	<div class="container" style="margin-top: 10px;">
	  <br/> <br/>
	  <ul class="nav nav-tabs" style="font-size: 13pt;">
	    <li class="active"><a href="<%= request.getContextPath()%>/admin_event.pz">이벤트 보기</a></li>
	    <li><a href="<%= request.getContextPath()%>/admin_registerEvent.pz">이벤트 등록 </a></li>
	  </ul>
	  	<br/><br/>
	<a id="ingEvent" ><span style="margin-left:-79%;">진행중인 이벤트</span></a> &nbsp;|&nbsp;
	<a id="endEvent">종료된 이벤트</a>  
	</div>

<br/><br/>
<div class="container">

<table class="table">
      <thead>
        <tr>
          <th class="th-color">번호</th>
          <th class="th-color">분류</th>
          <th class="th-color">이벤트명</th>
          <th class="th-color">이벤트 진행기간</th>
          <th class="th-color">상태</th>
         </tr>
        </thead>
        <tbody id="admin_event"> </tbody>
         </table>

               <div style="margin-top: 20px; margin-bottom: 20px;">
                  <button type="button" class="btn btn-default btn-block"
                     id="btnMoreNEW" value="">더보기</button>
                 <button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : 
                       <span id="totalCount"></span></button>
                 <button type="button" id="btnCountJSON">Count : 
                      <span id="countNEW">0</span></button>
                  <button type="button" class="btn btn-default btn-block"
                     id="btnMoreEND" value="">더보기</button>
               </div>
            </div>
</div>


