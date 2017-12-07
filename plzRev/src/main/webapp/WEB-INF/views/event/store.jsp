<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style>
  a{
         color: black;         
      }
      
</style>


<script type="text/javascript">

</script>


<img src="resources/jhy_images/메가박스스토어.PNG" width="1750px;" height="350px;"/> 
<nav class="navbar navbar-inverse" style="background-color: #351F65;">
  <div class="container-fluid" style="border: 0px solid gray;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#best">베스트</a></li>
          <li><a href="#snack">매점 이용권</a></li>
          <li><a href="#movie">영화 관람권</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>    

<div class="container" style="border :0px solid gray">

<div id="best" align="left" style=" margin-top: 5%;">
  <span style="font-size:20pt; font-weight:bold;">베스트 (TOP.4) </span>
<br/>
    <c:forEach var="bestvo" items="${bestList}">
	<div class="col-sm-3">
	<a href="storeDetail.pz?name=${bestvo.name}">
	<img src="resources/jhy_images/${bestvo.img_main}" class="w3-hover-opacity" style="width:170px; height:170px;" alt="Image"></a><br/>
	<p><span style="font-weight: bold; font-size:12pt;">${bestvo.name}</span><br/>
	${bestvo.coupon_price} 원
	</p>
    </div>
  </c:forEach>
</div>

<div id="snack" align="left" style="margin-top: 30%;">
  <span style="font-size:20pt; font-weight:bold;">매점 이용권</span>
  <br/>
  <c:forEach var="snackvo" items="${snackList}">
	<div class="col-sm-3">
	<a href="storeDetail.pz?name=${snackvo.name}">
	<img src="resources/jhy_images/${snackvo.img_main}" class="w3-hover-opacity" style="width:170px; height:170px;" alt="Image"></a><br/>
	<p><span style="font-weight: bold; font-size:12pt;">${snackvo.name}</span><br/>
	${snackvo.coupon_price} 원 
	</p>
    </div>
  </c:forEach>
</div>

<div id="movie" align="left" style="margin-top: 30%;" >
  <span style="font-size:20pt; font-weight:bold;">영화 관람권</span>
  <br/>
  <c:forEach var="movievo" items="${movieList}">
	<div class="col-sm-3">
	<a href="storeDetail.pz?name=${movievo.name}">
	<img src="resources/jhy_images/${movievo.img_main}" class="w3-hover-opacity" style="width:170px; height:170px;" alt="Image"></a><br/>
	<p><span style="font-weight: bold; font-size:12pt;">${movievo.name}</span><br/>
	${movievo.coupon_price} 원 
	</p>
    </div>
  </c:forEach>
</div>

</div>
<br/><br/><br/><br/>
</body>
</html>
