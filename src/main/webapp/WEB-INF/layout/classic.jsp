<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<!-- <link rel="stylesheet" href="../../resources/files/css/style.css"> -->
<link rel="stylesheet"
	href="../../resources/files/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/justified-nav.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
</head>
<body style="background-color: #330019;">

	<div class="container" style="margin-bottom: 15px;">
		<security:authorize access="!isAuthenticated()">



			<h4 class="pull-right">
				<a style="color: white;"
					href='<spring:url value="/register"></spring:url>'>Register </a> |
				<a style="color: white;"
					href='<spring:url value="/login"></spring:url>'>Login </a>
			</h4>

			<h4></h4>
		</security:authorize>

		<security:authorize access="isAuthenticated()">
			<%-- 	<spring:url value="/j_spring_security_logout" var="logoutUrl"></spring:url> --%>
			<h4 class="pull-right">
				<a style="color: white;">Hi ${name }, </a> <a style="color: white;"
					href='<spring:url value="/logout"></spring:url>'>Logout</a>
			</h4>

		</security:authorize>
		<!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
		<div class="masthead">
			<h3 class="text-muted">Logo ..</h3>

			<nav>
			<ul class="nav nav-justified">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			</nav>
		</div>
	</div>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>

	<div class="container">
		<div class="panel panel-default ">
			<div class="row">
				<div class="col-sm-3 pull-left">
					<tiles:insertAttribute name="menu"></tiles:insertAttribute>
				</div>
				<div class="col-sm-9  ">
					<tiles:insertAttribute name="body"></tiles:insertAttribute>

				</div>
			</div>


		</div>


	</div>


	<div class="container panel-footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	<script type="text/javascript">
		function removeDiv(divId) {
			$("#" + divId).remove();
		}
	</script>

</body>
</html>