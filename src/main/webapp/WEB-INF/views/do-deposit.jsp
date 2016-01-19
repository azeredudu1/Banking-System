<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel panel-default">
	<div class="panel-heading">

		<h3 style="color: #800000" align="center">Deposit Informations</h3>

	</div>
	<div class="panel-body">
		<form:form cssClass="form-horizontal depositForm"
			modelAttribute="banqueForm" action="deposit" method="post">
			<div class="form-group col-sm-12">
				<label for="codeCompte"
					class="col-sm-3 col-sm-offset-1 control-label">From Compte
					<strong style="color: red">* </strong>
				</label>
				<div class="col-sm-6">

					<form:select class="form-control" path="codeCpte">
						<form:option value="" label="select an account"></form:option>
						<form:options itemLabel="codeCompte" items="${comptes }"
							itemValue="codeCompte" />

					</form:select>
					<form:errors path="codeCpte" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			<div class="form-group col-sm-12">
				<label for="montant" class="col-sm-3 col-sm-offset-1 control-label">Amount
					<strong style="color: red">*</strong>
				</label>
				<div class="col-sm-6 ">

					<form:input path="montant" cssClass="form-control" placeHolder="Amount" />
					<form:errors path="montant" cssStyle="color:red;"></form:errors>
				</div>
			</div>

			<div class="form-group col-sm-12">
				<div class="col-sm-offset-4 col-sm-8">
					<button type="submit" class="btn btn-default" name="action">ok</button>
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
</div>
<script type="text/javascript">
	$(function() {
		$('.depositForm')
				.validate(
						{
							rules : {

								codeCpte : {
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
								montant : "The Amount must be equal or greater than 100 !"
							}
						});

	});
</script>


