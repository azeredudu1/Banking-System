<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>




<tiles:insertDefinition name="employee">
	<tiles:putAttribute name="body">
		<div id="heading" class="page-header">
			<h1>
				<i class="icon20 i-users"></i> Users
			</h1>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="icon">
							<i class="icon20 i-pencil"></i>
						</div>
						<h4>Edit user</h4>
						<a href="#" class="minimize"></a>
					</div>
					<!-- End .panel-heading -->

					<div class="panel-body">

						<form:form class="form-horizontal col-sm-offset-3" id="admin-edit-user-form"
							action="${pageContext.request.contextPath}/update_user"
							commandName="user" method="POST" role="form">

							<form:input type="text" hidden="hidden" name="userId"
								path="idUser" value="${user.idUser}" />
								<%-- <form:input type="text"  name="dateCreation" 
								path="dateCreation" value="${date}" /> --%>

							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">First
									Name </label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="firstName" id="firstName" path="firstName" minlength="4"
										value="${user.firstName }" />
									<form:errors path="firstName" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Last
									Name </label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="lastName" id="lastName" path="lastName" minlength="4"
										value="${user.lastName }" />
									<form:errors path="lastName" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Username</label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="username" id="user" path="userName" minlength="4"
										value="${user.userName }" />
									<form:errors path="userName" cssClass="fieldValidationError"></form:errors>
									<c:if test="${duplicateUser != null}">
										<p class="fieldValidationError">Username already exists!</p>
									</c:if>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
								<label class="col-lg-2 control-label " for="required">Password</label>
								<div class="col-lg-4">
									<form:input id="password" class="form-control" type="password"
										name="password" path="userPassword"
										value="${user.userPassword }" />
									<form:errors path="userPassword"
										cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
							 	<label class="col-lg-2 control-label" for="range">Re-type
									password</label>
								<div class="col-lg-4">
									<input id="confirm_password" name="confirm_password"
										type="password" class="form-control" value="${user.userPassword }" />
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Required
									email</label>
								<div class="col-lg-4">
									<form:input class="required email form-control" type="text"
										name="email" id="email-field" path="email"
										value="${user.email }" />
									<form:errors path="email" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->
							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Address</label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="address" id="address" path="address" minlength="4"
										value="${user.address }" />
									<form:errors path="address" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>

							<!-- End .control-group  -->


							<c:if test="${user.actived==true}">
								<div class="form-group">
									<label class="col-lg-2 control-label">Actived</label>
									<div class="col-lg-4">
										<form:checkbox class=" form-control" path="actived"
											checked="checked" />
									</div>

								</div>

							</c:if>


							<!-- End .control-group  -->

							<c:if test="${user.actived==false}">
								<div class="form-group">
									<label class="col-lg-2 control-label">Actived</label>
									<div class="col-lg-4">
										<form:checkbox class=" form-control" path="actived" />
									</div>

								</div>

							</c:if>


							<!-- End .control-group  -->

							<div class="form-group">
								<div class="col-lg-offset-2">
									<div class="pad-left15">
										<button type="submit" class="btn btn-primary">Save</button>
										<a href="<c:url value='/users'/>">
											<button type="button" class="btn">Cancel</button>
										</a>
									</div>
								</div>
							</div>
							<!-- End .form-group  -->

						</form:form>
					</div>
					<!-- End .panel-body -->
				</div>
				<!-- End .widget -->
			</div>
			<!-- End .col-lg-12  -->
		</div>
		<!-- End .row-fluid  -->




	</tiles:putAttribute>



</tiles:insertDefinition>

