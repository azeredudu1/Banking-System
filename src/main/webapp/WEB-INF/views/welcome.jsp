<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/files/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertDefinition name="template2">
		<tiles:putAttribute name="body">
			<div class="container">
				<div class="panel panel-default" style="height: 450px;">
					<div class="panel-heading">
						<h3 class="form-signin-heading" style="color: #800000">
							<center>Please sign in</center>
						</h3>
					</div>
					<div class="panel-body " style="height: 320px;">
						<div class="row" style="padding-top: 50px;">
							<div>
								<h4>
									<i colspan="2" style="color: green">
										<center>${message}</center>
									</i>
								</h4>
							</div>
							<!-- </div> -->
							<div class="col-sm-2 col-sm-offset-4">
								<a class="btn btn-primary"
									href='<spring:url value="/accounts"></spring:url>'> <img
									alt="" width="120" height="120"
									class="img-circle img-thumbnail img-responsive"
									src='<spring:url value="/resources/images/user.png"></spring:url>'><br>Customer
								</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-warning"
									href='<spring:url value="/users"></spring:url>'> <img
									alt="" width="120" height="120" class="img-circle"
									src='<spring:url value="/resources/images/admin.jpg"></spring:url>'><br>Employee
								</a>
							</div>
						</div>

					</div>
					<div class="panel panel-footer">
						<marquee>
							<h4><i>Banking System Management</i></h4>
						</marquee>
					</div>
				</div>



			</div>



		</tiles:putAttribute>

	</tiles:insertDefinition>
</body>
</html>