<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table style="border:0px solid black; width:88%;">

<tbody>
   <tr>
      <td>문의 번호 &nbsp;&nbsp;</td>
      <td>${qnavo.serviceno}</td>
   </tr>
   <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
   </tr>
   
   <tr>
      <td>영화관 &nbsp;&nbsp;</td>
      <td>${qnavo.theatername}</td>
   </tr>
   <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
   </tr>
   
   <tr>
      <td>제목 &nbsp;&nbsp;</td>
      <td>${qnavo.title}</td>
   </tr>
   <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
   </tr>
   
   <tr>
      <td>내용 &nbsp;&nbsp;</td>
      <td>${qnavo.msg}</td>
   </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
   </tr>
    
    <tr>
      <td>글쓴 날짜&nbsp;&nbsp;</td>
      <td>${qnavo.writedate}</td>
   </tr>
   <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
   </tr>
   
   <tr>
      <td>문의 상태 &nbsp;&nbsp;</td>
      <c:if test="${qnavo.commentcount== 1}">
         <td>답변 완료</td>
      </c:if>
      <c:if test="${qnavo.commentcount==0}">
         <td>답변 대기</td>
      </c:if>
   </tr>

</tbody>
</table>