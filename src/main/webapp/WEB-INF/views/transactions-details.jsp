<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://github.com/dandelion/datatables"
	prefix="datatables"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<html>

<tiles:insertDefinition name="template1">
	<tiles:putAttribute name="body">



		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 style="color: #800000; text-align: center;">Transactions
					Details</h3>
			</div>
			<div class="panel-body">
				<jsp:include page="../views/transactions-datatables.jsp"></jsp:include>
				<div class="panel-footer">

					<p>
						<a href='<spring:url value="/accounts"></spring:url>'>Back to
							Accounts</a>
					</p>

				</div>
			</div>











		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>

</html>