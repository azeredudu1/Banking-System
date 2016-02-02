<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://github.com/dandelion/datatables"
	prefix="datatables"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<html>
<tiles:insertDefinition name="template1">

	<tiles:putAttribute name="body">
		<div class="panel panel-default ">
			<c:if test="${!empty message }">
					<div class="alert alert-success" id="removeMe">
						<h4 align="center">${message }<a href="#" class="pull-right"
								onclick="removeDiv('removeMe');">&times;</a>
						</h4>

					</div>
				</c:if>
			<div class="panel-header">
				

				<datatables:table id="compte" data="${comptes }" row="compte"
					pageable="true" pagingType="listbox"
					cssClass="table table-striped table-hover" lengthChange="true"
					info="true" themeOption="redmond" theme="jqueryui" sortable="true">
					<datatables:column title="" sortable="false">
						<spring:url value="/accounts/${compte.codeCompte}" var="detailUrl"></spring:url>
						<a style="color: #800000" href="${detailUrl }">Details</a>
					</datatables:column>
					<datatables:column title="Account Number" property="codeCompte"
						sortable="true"></datatables:column>
					<datatables:column title="Type" sortable="true">
						<c:out value="${compte }"></c:out>
					</datatables:column>
					<datatables:column sortable="true" title="Balance" property="solde"></datatables:column>
					<datatables:column sortable="true" title="Currency"
						property="currency"></datatables:column>
					<datatables:column sortable="true" title="Date of creation"
						property="dateCreation"></datatables:column>

				</datatables:table>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
<script type="text/javascript">
	$(function() {
		$("#removeMe").fadeIn(5000);
		$("#removeMe").fadeOut(5000);
		setTimeout("$('#removeMe').hide();", 4000);
	})
</script>
</html>
