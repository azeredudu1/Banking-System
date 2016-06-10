<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/petclinic.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="../../resources/files/css/style.css"> -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/justified-nav.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />


<title>Insert title here</title>
</head>
<body
	style="background-image: url('<%=request.getContextPath()%>/resources/images/background-4.jpg ');">
	<div class="container">

		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div class="container">
			<div class="panel panel-default ">
				<div class="row">
					<div class="col-sm-3">
						<tiles:insertAttribute name="menu"></tiles:insertAttribute>
					</div>
					<div class="col-sm-9  ">
						<tiles:insertAttribute name="body"></tiles:insertAttribute>

					</div>
				</div>

				<marquee>
					<h4>
						<i>Banking System Management</i>
					</h4>
				</marquee>

			</div>
		</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/waitMe.js"></script>
	<script type="text/javascript">
		function removeDiv(divId) {
			$("#" + divId).remove();
		}
	</script>

</body>
</html>