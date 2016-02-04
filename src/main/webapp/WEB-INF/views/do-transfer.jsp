<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
	<tiles:insertDefinition name="template1">
<tiles:putAttribute name="body">
<div class="panel panel-default">
	<div class="panel-heading">

		<h3 style="color: #800000" align="center">Transfer Informations</h3>

	</div>
	<div class="panel-body">
		<c:if test="${!empty message }">
			<div class="alert alert-danger" id="removeMe">
				<h4 align="center"><span class="glyphicon glyphicon-alert"></span> ${message }<a class="pull-right"
						onclick="removeDiv('removeMe');" href="#">&times;</a>
				</h4>

			</div>
		</c:if>
		<c:if test="${!empty exception }">
			<div class="alert alert-danger" id="removeMe">
				<h4 align="center"><span class="glyphicon glyphicon-alert"></span> ${exception }<a class="pull-right"
						onclick="removeDiv('removeMe');" href="#">&times;</a>
				</h4>

			</div>
		</c:if>
		<form:form cssClass="form-horizontal tranferForm"
			modelAttribute="banqueForm" action="transfer" method="post">
			<div class="form-group col-sm-12">
				<label for="codeCompte"
					class="col-sm-3 col-sm-offset-1 control-label">From Compte
					<strong style="color: red">*</strong>
				</label>
				<div class="col-sm-6">

					<form:select cssClass="form-control" path="codeCpte">
						<form:option value="" label="select an account"></form:option>
						<form:options itemLabel="codeCompte" itemValue="codeCompte"
							items="${comptes }" />

					</form:select>
					<form:errors path="codeCpte" cssStyle="color:red"></form:errors>
				</div>
			</div>
			<div class="form-group col-sm-12">
				<label for="codeCompte"
					class="col-sm-3 col-sm-offset-1 control-label">To <strong
					style="color: red">*</strong>
				</label>
				<div class="col-sm-6">

					<form:input path="codeCpte2" placeholder="Receiver account number"
						cssClass="form-control" />
					<form:errors path="codeCpte2" cssStyle="color:red"></form:errors>
				</div>
			</div>
			<div class="form-group col-sm-12">
				<label for="montant" class="col-sm-3 col-sm-offset-1 control-label">Amount
					<strong style="color: red">*</strong>
				</label>
				<div class="col-sm-6">

					<form:input path="montant" cssClass="form-control"
						placeHolder="Amount" />
					<form:errors path="montant" cssStyle="color:red"></form:errors>
				</div>
			</div>

			<div class="form-group col-sm-12">
				<div class="col-sm-offset-4 col-sm-8">
					<button type="submit" class="btn btn-success" name="action">ok</button>
				</div>
			</div>
		</form:form>



	</div>
	<div class="panel-footer" style="text-align: left;">

		<p class="">
			<a href='<spring:url value="/accounts"></spring:url>'>Back to
				Accounts</a>
		</p>
	</div>


</div></tiles:putAttribute></tiles:insertDefinition>

<script type="text/javascript">
	$(function() {
		$('.tranferForm')
				.validate(
						{
							rules : {

								codeCpte : {
									required : true
								},
								codeCpte2 : {
									required : true
								},
								montant : {
									required : true,
									min : 100
								}
							},
							highlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-success').addClass('has-error');

							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error').addClass('has-success');

							},
							messages : {
								codeCpte : "Must select an account!",
								codeCpte2 : "Must enter the recipient account!",
								montant : "The Amount must be equal or greater than 100 !"
							}
						});

	});
</script>