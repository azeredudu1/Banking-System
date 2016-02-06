<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<style>
.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<html>
<tiles:insertDefinition name="template2">
	<tiles:putAttribute name="body">
		<div class="container" style="padding-bottom: 20px;">
			<div class="panel panel-default" style="height: 450px;">
				<div class="panel-heading">
					<h3 class="form-signin-heading" style="color: #800000;" >
						<center>Please sign in</center>
					</h3>
				</div>
				<div class="panel-body" style="height: 300px;">
					<h4 colspan="2" style="color: red">
						<i><center>${message}</center></i>
					</h4>
					<form class="form-signin" action="j_spring_security_check"
						method="post">


						<label for=name " class="sr-only">Username</label> <input
							type="text" id="inputEmail" class="form-control"
							name="j_username" placeholder="Username" required autofocus>
						<label for="inputPassword" class="sr-only">Password</label> <input
							type="password" id="inputPassword" name="j_password"
							class="form-control" placeholder="Password" required>
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								Remember me
							</label>
						</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
							in</button>
					</form>

				</div>
				<div class="panel panel-footer">
					<h4>
						<a href='<spring:url value="/welcome"></spring:url>'>Change
							User</a>
					</h4>
					<marquee>
						<h4><i>Banking System Management</i></h4>
					</marquee>
				</div>

			</div>

		</div>





	</tiles:putAttribute>
</tiles:insertDefinition>






</html>