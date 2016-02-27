<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/waitMe.css">

<tiles:insertDefinition name="template1">
	<tiles:putAttribute name="body">
		<div class="panel panel-default">
			<div class="panel-heading">

				<h3 style="color: #800000" align="center">Deposit Informations</h3>

			</div>
			<div class="panel-body " id="SELECTOR">
				<form:form cssClass="form-horizontal depositForm"
					modelAttribute="banqueForm" action="deposit" method="post">
					<div class="form-group col-sm-12">
						<label for="codeCompte"
							class="col-sm-3 col-sm-offset-1 control-label">From
							Account <strong style="color: red">* </strong>
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
						<label for="montant"
							class="col-sm-3 col-sm-offset-1 control-label">Amount <strong
							style="color: red">*</strong>
						</label>
						<div class="col-sm-6 ">

							<form:input path="montant" cssClass="form-control"
								placeHolder="Amount" />
							<form:errors path="montant" cssStyle="color:red;"></form:errors>
						</div>
					</div>

					<div class="form-group col-sm-12">
						<div class="col-sm-offset-4 col-sm-8">
							<button type="submit" class="btn btn-success" id="demo"
								name="action">ok</button>
						</div>
					</div>
					<!-- <button type="button" class="btn btn-success" name="action"
					id="demo">test</button> -->
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
										$(element).closest('.form-group')
												.removeClass('has-success')
												.addClass('has-error');

									},
									unhighlight : function(element) {
										$(element).closest('.form-group')
												.removeClass('has-error')
												.addClass('has-success');

									},
									messages : {
										codeCpte : "Must select an account!",
										montant : "The Amount must be equal or greater than 100 !"
									}, submitHandler:function(form){
										run_waitMe(current_effect);
										this.submit();
										}
								});
				// none, bounce, rotateplane, stretch, orbit, 
				// roundBounce, win8, win8_linear or ios
				var current_effect = 'roundBounce'; // 

				function run_waitMe(effect) {
					$('#SELECTOR').waitMe({

						//none, rotateplane, stretch, orbit, roundBounce, win8, 
						//win8_linear, ios, facebook, rotation, timer, pulse, 
						//progressBar, bouncePulse or img
						effect : effect,

						//place text under the effect (string).
						text : 'Loading... ',

						//background for container (string).
						bg : 'rgba(255,255,255,0.7)',

						//color for background animation and text (string).
						color : '#000',

						//change width for elem animation (string).
						sizeW : '',

						//change height for elem animation (string).
						sizeH : '',

						// url to image
						source : '',

						// callback
						onClose : function() {
						}

					});
				}

			});
		</script>



	</tiles:putAttribute>
</tiles:insertDefinition>


