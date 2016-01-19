<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 style="color: #800000" align="center">Registration details</h3>
	</div>
	<div class="panel-body">
		<form:form commandName="user"
			cssClass="form-horizontal registrationForm col-sm-6 col-sm-offset-3">
			<c:if test="${success eq true }">
				<div class="alert alert-success" align="center">Registration
					successfully</div>

			</c:if>
			<div class="form-group">
				<label for="firstName">First Name
					<strong style="color: red">* </strong></label>

				<form:input path="firstName" cssClass="form-control"
					placeholder="First Name" />

			</div>
			<div class="form-group">

				<label for="lastName">Last Name</label>
				<form:input path="lastName" cssClass="form-control"
					placeholder="Last Name" />
				<form:errors path="lastName"></form:errors>
			</div>

			<div class="form-group">
				<label for="userName">Username
					<strong style="color: red">* </strong></label>
				<form:input path="userName" cssClass="form-control"
					placeholder="Username"  />
				<form:errors path="userName"></form:errors>
			</div>

			<div class="form-group">
				<label for="adresse">Address</label>
				<form:input path="address" cssClass="form-control"
					placeholder="Address" />
				<form:errors path="address"></form:errors>
			</div>


			<div class="form-group ">
				<label for="email">Email Address</label>
				<form:input path="email" placeholder="Email" cssClass="form-control" />
				<form:errors path="email" ></form:errors>
			</div>

			<div class="form-group ">
				<label for="password">Password
					<strong style="color: red">* </strong></label>
				<form:password path="userPassword" cssClass="form-control"
					placeholder="Password" />
				<form:errors path="userPassword"></form:errors>


			</div>
			<!-- <div class="form-group">
				<label for="password" class="control-label col-sm-2">Confirm:</label>
				<div class="col-sm-6">
					<input type="Password" name="password_again" id="password_again"
						class="form-control">
				</div>

			</div> -->
			<div class="form-group">
				<input type="submit" class="btn btn-lg btn-primary submit"
					value="Register">

			</div>
		</form:form>

	</div>






</div>