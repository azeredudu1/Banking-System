<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel panel-default">
	<div class="panel-heading">

		<h3 style="color: #800000" align="center">Account details</h3>

	</div>
	<div class="panel-body">

		<form:form modelAttribute="banqueForm" action="createAccount"
			cssClass="form-horizontal registrationForm col-sm-6 col-sm-offset-3">
			<div class="form-group ">
				<label for="description" class="control-label  ">
					Description</label>

				<form:input path="description" cssClass="form-control"
					placeHolder="account description" />
				<form:errors path="description"></form:errors>

			</div>

			<div class="form-group ">
				<label for="solde" class="control-label "> Initial balance <strong
					style="color: red">* </strong>
				</label>

				<form:input path="solde" cssClass="form-control" />
				<form:errors path="solde"></form:errors>

			</div>
			<div class="form-group ">
				<label for="decouvert" class="control-label ">Overdraft<strong
					style="color: red"> *</strong>
				</label>

				<form:input path="decouvert" cssClass="form-control" />
				<form:errors path="decouvert"></form:errors>

			</div>

			<div class="form-group">
				<label for="currency" class="control-label   ">Currency <strong
					style="color: red">*</strong>
				</label>

				<form:select path="currency" cssClass="form-control"
					itemLabel="select currency">
					<form:option value="Euro">

					</form:option>
					<form:option value="Dollar">

					</form:option>

				</form:select>
				<form:errors path="currency"></form:errors>
			</div>

			<div class="form-group ">

				<button type="submit" class="btn btn-default" name="action">ok</button>

			</div>


		</form:form>


	</div>





</div>