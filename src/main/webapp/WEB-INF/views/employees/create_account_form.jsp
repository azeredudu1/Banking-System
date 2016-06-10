<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<tiles:insertDefinition name="employee">
	<tiles:putAttribute name="body">



		<div id="heading" class="page-header">
			<h1>
				<i class="icon20 i-stack-list"></i> Accounts
			</h1>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="icon">
							<i class="icon20 i-stack-plus"></i>
						</div>
						<h4>Add new</h4>
						<a href="#" class="minimize"></a>
					</div>
					<!-- End .panel-heading -->

					<div class="panel-body">

						<form:form
							class="form-horizontal col-sm-offset-3 registrationForm "
							id="admin-create-user-form"
							
							commandName="banqueForm"  role="form">
							<div class="thumbnail col-lg-7"
								style="background-color: #E6E6FA; margin-bottom: 30px;">
								<div class="form-group">

									<h4 align="center">
										<label class="radio-inline"><form:radiobutton
												checked="checked" cssClass="account" path="typeCompte"
												value="CA" name="type" id="current" />Current account</label> <label
											class="radio-inline"><form:radiobutton
												path="typeCompte" name="type" cssClass="account" value="SA"
												id="saving" />Savings account</label>
									</h4>

								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Description</label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="description" id="description" path="description"
										minlength="4" />
									<form:errors path="description" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Initial
									Balance</label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="solde" id="solde" path="solde" />
									<form:errors path="solde" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->


							<div class="form-group" id="overdraft">
								<label class="col-lg-2 control-label" for="required">Overdraft</label>
								<div class="col-lg-4">
									<form:select path="decouvert" cssClass="form-control">
										<form:option value="5000" label="5000"></form:option>
										<form:option value="10000" label="10000"></form:option>
										<form:option value="15000" label="15000"></form:option>
									</form:select>
									<%-- <form:errors path="decouvert" cssClass="fieldValidationError"></form:errors> --%>
								</div>
							</div>
							<!-- End .control-group  -->

							<div class="form-group" id="rate">
								<label class="col-lg-2 control-label" for="required">Interest</label>
								<div class="col-lg-4">
									<form:select path="taux" cssClass="form-control required">
										<form:option value="10" label="10%"></form:option>
										<form:option value="15" label="15%"></form:option>
										<form:option value="20" label="20%"></form:option>
									</form:select>
									<%-- <form:errors path="decouvert" cssClass="fieldValidationError"></form:errors> --%>
								</div>
							</div>
							<!-- End .control-group  -->
							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Currency</label>
								<div class="col-lg-4">
									<form:select path="currency" cssClass="form-control required"
										itemLabel="select currency">
										<form:option value="Euro">
										</form:option>
										<form:option value="Dollar">
										</form:option>
									</form:select>
								</div>
							</div>
							

							<!-- End .control-group  -->
							<div class="form-group">
								<div class="col-lg-offset-2">
									<div class="pad-left15">
										<button type="submit" class="btn btn-primary" name="action">Save</button>
										<a href="<c:url value='/all_accounts'/>">
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
		<script type="text/javascript">
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
			/* 		$('.registrationForm').validate(
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
							}); */
		</script>

	</tiles:putAttribute>

</tiles:insertDefinition>

