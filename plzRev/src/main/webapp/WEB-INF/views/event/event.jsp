<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">


    $(document).ready(function(){
    	
    	callAjax("1","1");
    	$("#totalCount").text(parseInt('${totalIngCount}'));
    	$("#btnMoreEND").hide();
		$("#btnTotalNEWCountJSON").hide();
		$("#btnCountJSON").hide();
	
    	
    	
        $("#ingEvent").click(function(){
        	$("#result").empty();
        	$("#countNEW").text(parseInt("0"));
        	callAjax("1","1");
        	$("#btnMoreEND").hide();
        	$("#btnMoreNEW").show();
        	$("#totalCount").text(parseInt('${totalIngCount}'));
        	
         });
        
        $("#btnMoreNEW").click(function(){
        	callAjax($(this).val(),"1");
        });
        
        /////////////////////////////////////////
        $("#endEvent").click(function(){
        	$("#result").empty();
        	$("#countNEW").text(parseInt("0"));
        	callAjax("1","0");
        	$("#btnMoreNEW").hide();
        	$("#btnMoreEND").show();
        	$("#totalCount").text(parseInt('${totalEndCount}'));
         });
        
        $("#btnMoreEND").click(function(){
        	callAjax($(this).val(),"0");
        });
    });
    
    var len = 4; // 더보기... 클릭에 보여줄 상품의 갯수 단위 크기
    
 	function callAjax(start,status) {
		
    	var form_data = { 
				   "start" : start
                   ,"len" : len	 
                   ,"status" :status
	               };

	$.ajax({
		url: "eventJSON.pz",
		type: "GET",
		data: form_data,
		dataType: "JSON",
		success: function(data){
							
			var html = "";
			
			if (data == null || data.length == 0) {
				html += "준비중입니다.."; 
				
				// 상품 결과를 출력하기
				$("#result").html(html);
			}else {
				$.each(data, function(entryIndex, entry){  // /rev/resources/jhy_images/마티네데이_detail.jpg
					html += "<div class=\"col-sm-3\">";
		        	html += "<a href=\"eventDetail.pz?name="+entry.name+"\">";
		            html += "<img class=\"w3-hover-opacity\" width=\"230px;\" height=\"335px;\" src='resources/jhy_images/"+entry.img_main+"'/>";
		          	html += "</a><br/><br/>";
		        	html += "<p><span style=\"font-weight: bold;\">"+entry.name+"</span></p>";
		        	html += "</div>";	
				}); // end of $.each()-------------
				
		        $("#result").append(html);
		    	 
		    	// "더보기..." 버튼의 value 속성에 값을 지정해주기
		    	$("#btnMoreNEW").val(parseInt(start)+len);	 
		    
		    	$("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
		    	
		    	// "더보기..." 버튼의 비활성화 처리
		    	if ( parseInt($("#totalCount").text()) == parseInt($("#countNEW").text()) ) { 
		    		 $("#btnMoreEND").hide();
			    	 $("#btnMoreNEW").hide();
		    	}
			  
			}// end of if~else-----------------
		 				
		},// end of success: function(data)----------
		error: function(){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	    }
	});
	
	}// end of function callAjax()---------------

	
	
</script>


<a id="ingEvent" ><span style="margin-left:-53%;">진행중인 이벤트</span></a> &nbsp;|&nbsp;
<a id="endEvent">종료된 이벤트</a>

<div class="container" align="center" style="border: 0px solid navy">
<br/><br/><br/>
<div class="container" align="center" style="border: 0px solid navy;" id="result"></div>
<br/><br/>
<button type="button" style="background-color: gray;"class="btn btn-primary btn-block" id="btnMoreNEW" value="" >더 보기 </button>
<button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : <span id="totalCount"></span></button>
<button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button>
<button type="button" style="background-color: gray;"class="btn btn-primary btn-block" id="btnMoreEND" value="" >더 보기 </button><br/><br/>
</div>
