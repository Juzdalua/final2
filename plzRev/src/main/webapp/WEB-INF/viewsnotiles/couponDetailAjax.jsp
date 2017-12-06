<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- b.fk_name
		      ,to_char(a.buy_date, 'yyyy-mm-dd') as buy_date
		      ,to_char(a.unable_date, 'yyyy-mm-dd') as unable_date
		      ,a.discount_money
		      ,b.category
		      ,a.status 
		      -->
		      <!-- 1 - 영화 관람권 / 2- 매점 교환권  / 3- 영화 할인권 / 4 - 매점 할인권 / 5 - 일반 이벤트 -->
<style>
	
</style>
<table style="border:0px solid black; width:70%;">

<tbody>
	<tr>
		<td style="font-weight:bold;">상품명 &nbsp;&nbsp;</td>
		<td colspan=3>${result.fk_name}</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">쿠폰구매일 &nbsp;&nbsp;</td>
		<td colspan=3>${result.buy_date}</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">쿠폰종료일 &nbsp;&nbsp;</td>
		<td colspan=3>${result.unable_date}</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">사용가능금액 &nbsp;&nbsp;</td>
		<td colspan=3>${result.discount_money}원</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">분류 &nbsp;&nbsp;</td>
		<c:if test="${result.category == 1}">
			<td colspan=3>영화 관람권</td>
		</c:if>
		<c:if test="${result.category == 2}">
			<td colspan=3>매점 교환권</td>
		</c:if>
		<c:if test="${result.category == 3}">
			<td colspan=3>영화 할인권</td>
		</c:if>
		<c:if test="${result.category == 4}">
			<td colspan=3>매점 할인권</td>
		</c:if>
		<c:if test="${result.category == 5}">
			<td colspan=3>일반 이벤트</td>
		</c:if>
		
	</tr>
	<!-- 1:사용가능 0 :사용불가  -->
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">상태&nbsp;&nbsp;</td>
		<c:if test="${result.status == 1}">
			<td colspan=3>사용가능</td>
		</c:if>
		<c:if test="${result.status == 0}">
			<td colspan=3>사용불가</td>
		</c:if>
	</tr>
</tbody>
</table>





















