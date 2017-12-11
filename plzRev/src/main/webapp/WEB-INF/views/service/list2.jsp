<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
   .col { background-color: #e6e6e6;
         font-weight: bold;}
      
</style>

<script>

   $(document).ready(function(){
      
      
      
      
   });
   
   function searchKeep() {
      <c:if test="${search != 'null' && not empty search}">  
         $("#search").val("${search}");  // 검색에 대한 검색어를 유지시킨다.
      </c:if>
   }
   

   function goSearch() {
      
      var frm = document.searchFrm;
      var search = $("#search").val();
      
      if(search.trim() == "") {
         alert("검색어를 입력하세요!!");
         $("#search").focus();
         return;
      }
      else {
         frm.submit();
      }
   }
   
   
</script>
<body>
  <h2 align="left"><span style="font-weight: bold; margin-left: 13%;"><a href="<%= request.getContextPath()%>/list1.pz">고객센터</a></span></h2>
<div class="container">
  <br/>
  <ul class="nav nav-tabs" style="font-size: 13pt;">
    <li><a href="<%= request.getContextPath()%>/list1.pz">  F    A    Q  </a></li>
    <li class="active"><a href="<%= request.getContextPath()%>/list2.pz"> 공 지 사 항 </a></li>
    <li><a href="<%= request.getContextPath()%>/list3.pz"> 1 : 1 문의 </a></li>
  </ul>
</div>
 
 <br/>
<form name="searchFrm">
   <span style="padding-right: 0%; font-weight: bold; font-size: 13pt; display: inline;">총 게시물 [ ${totalCount} ]</span>
   <span style="padding-left:33%; font-weight: bold; color:white; display: inline;">검색&nbsp;<input type="text" size="45" name="search" id="search" style=" color:black;" placeholder="제목을 입력하세요."/></span>
   <button type="button" style=" margin-left: 5px; width: 70px; text-align: center;border:#a04dff; background-color: #a04dff; color:white;  height: 30px;"  onClick="goSearch();">검색</button>
</form>
<br/>

<div class="container">
  <table class="table" style="text-align: center;">
    <thead>
      <tr>
        <th style="width: 8%; text-align: center; font-size: 12pt;">글번호</th>
        <th style="width: 2%; text-align: center; font-size: 12pt;">영화관</th>
        <th style="width: 42%; text-align: center; font-size: 12pt;">제목</th>
        <th style="width: 10%; text-align: center; font-size: 12pt;">등록일</th>
        <th style="width: 10%; text-align: center; font-size: 12pt;">조회수</th>
      </tr>
      
    </thead>
    
    <tbody>
       
     <c:if test="${not empty noticeList}">
      <form name="detailFrm"> 
      <c:forEach var="nvo" items="${noticeList}">
        <c:if test="${nvo.important==1}">
         <tr class="col">
           <td style="width: 10%;">${nvo.serviceno}</td>
           <td style="width: 10%;">${nvo.theatername}</td>
           <td style="width: 60%;"><a href="list2Detail.pz?serviceno=${nvo.serviceno}">${nvo.title}</a></td>
           <td style="width: 10%;">${nvo.writedate}</td>
           <td style="width: 10%;">${nvo.cnt}</td>
         </tr>
        </c:if> 
         <c:if test="${nvo.important==0}">
         <tr>
           <td style="width: 10%;">${nvo.serviceno}</td>
           <td style="width: 10%;">${nvo.theatername}</td>
           <td style="width: 60%;"><a href="list2Detail.pz?serviceno=${nvo.serviceno}">${nvo.title}</a></td>
           <td style="width: 10%;">${nvo.writedate}</td>
           <td style="width: 10%;">${nvo.cnt}</td>
         </tr>
        </c:if> 
       </c:forEach> 
       </form> 
      </c:if>  
     
    
   </tbody>
  </table>
</div>
<div align="center" style="width: 70%; margin-left: 50px;">
   
      ${pagebar}
   </div>

</body>
</html>
