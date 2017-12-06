<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
<span>·총 금액:</span>
<span style="color:#351F65; margin-left:60%; font-size:15pt;font-weight:bold">
<fmt:formatNumber value="${totalMoeny}" pattern="###,###"/>원</span>
 