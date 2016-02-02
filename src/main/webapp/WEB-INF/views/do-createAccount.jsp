<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
	<tiles:insertDefinition name="template1">
<tiles:putAttribute name="body">
<div class="panel panel-default">
	<div class="panel-heading">

		<h3 style="color: #800000" align="center">Account details</h3>

	</div>
	<div class="panel-body">

		<form:form modelAttribute="banqueForm" action="createAccount"
			cssClass="form-horizontal registrationForm col-sm-6 col-sm-offset-3 ">
			<div class="row">
				<div class="thumbnail" style="background-color: #E6E6FA;">
					<div class="col-sm-offset-1">
						<h4>
							<label class="radio-inline"><form:radiobutton
									checked="checked" cssClass="account" path="typeCompte"
									value="CA" name="type" id="current" />Current account</label> <label
								class="radio-inline"><form:radiobutton path="typeCompte"
									name="type" cssClass="account" value="SA" id="saving" />Savings
								account</label>
						</h4>
					</div>

				</div>
			</div>

			<div class="form-group ">
				<label for="description" class="control-label  ">
					Description <strong
					style="color: red">* </strong></label>

				<form:input path="description" cssClass="form-control"
					placeHolder="Account description" />
				<form:errors path="description"></form:errors>

			</div>

			<div class="form-group ">
				<label for="solde" class="control-label "> Initial balance <strong
					style="color: red">* </strong>
				</label>

				<form:input path="solde" cssClass="form-control"  placeHolder="Balance"/>
				<form:errors path="solde"></form:errors>

			</div>
			<div class="form-group" id="overdraft">
				<label for="decouvert" class="control-label ">Overdraft<strong
					style="color: red"> *</strong>
				</label>
				<form:select path="decouvert" cssClass="form-control">
					<form:option value="5000" label="5000"></form:option>
					<form:option value="10000" label="10000"></form:option>
					<form:option value="15000" label="15000"></form:option>
				</form:select>
				<form:errors path="decouvert"></form:errors>

			</div>
			<div class="form-group" id="rate">
				<label for="taux" class="control-label ">Rate<strong
					style="color: red"> *</strong>
				</label>
				<form:select path="taux" cssClass="form-control">
					<form:option value="10" label="10%"></form:option>
					<form:option value="15" label="15%"></form:option>
					<form:option value="20" label="20%"></form:option>
				</form:select>
				<form:errors path="taux"></form:errors>

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





</div></tiles:putAttribute></tiles:insertDefinition>

<script type="text/javascript">
	$(document).ready(function() {
		$("#rate").css("display", "none");
		$('#current').change(function() {
			if (this.checked) {
				$("#overdraft").slideDown("slow").fadeIn("slow");
				$("#rate").slideUp("slow").fadeOut("slow");

			}
		});
		$('#saving').change(function() {
			if (this.checked) {
				$("#rate").slideDown("slow").fadeIn("slow");
				$("#overdraft").slideUp("slow").fadeOut("slow");
			}
		});
		$('.registrationForm')
		.validate(
				{
					rules : {

						description : {
							required : true
						},
						solde : {
							required : true
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
						description : "Must enter a description!",
						solde : "Initial blance is required!",
						
					}
				});


	});
</script>