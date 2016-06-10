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
						<h4>Make deposit</h4>
						<a href="#" class="minimize"></a>
					</div>
					<!-- End .panel-heading -->

					<div class="panel-body">

						<form:form class="form-horizontal col-sm-offset-3"
							id="admin-create-user-form" commandName="banqueForm" role="form">
							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Select
									Account</label>
								<div class="col-lg-4">
									<form:select class="form-control required" path="codeCpte">
										<form:option value="" label="select an account"></form:option>
										<form:options itemLabel="codeCompte" items="${comptes }"
											itemValue="codeCompte" />
									</form:select>
									<form:errors path="codeCpte" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>
							<!-- End .control-group  -->
							<div class="form-group">
								<label class="col-lg-2 control-label" for="required">Amount</label>
								<div class="col-lg-4">
									<form:input class="required form-control" type="text"
										name="montant" id="montant" path="montant" />
									<form:errors path="montant" cssClass="fieldValidationError"></form:errors>
								</div>
							</div>


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

	</tiles:putAttribute>

</tiles:insertDefinition>

