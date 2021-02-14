<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Together - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
	<link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/together/resources/vendors/fontawesome/css/all.min.css">
 	<link rel="stylesheet" href="/together/resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="/together/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/together/resources/vendors/owl-carousel/owl.theme.default.min.css">
	<link rel="stylesheet" href="/together/resources/vendors/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" href="/together/resources/css/style.css">
<!-- 	<link rel="stylesheet" href="/together/resources/css/selectbox_dropdown.css"> -->
</head>
<body>

<div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
     
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>

	<script src="/together/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
 	<script src="/together/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/together/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="/together/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/together/resources/js/mail-script.js"></script>
	<script src="/together/resources/js/main.js"></script>
<!-- 	<script src="/together/resources/js/selectbox_dropdown.js"></script> -->


</body>
</html>