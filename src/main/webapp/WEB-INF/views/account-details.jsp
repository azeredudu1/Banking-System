<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel panel-default">
	<div class="panel-heading">
		<center>
			<h3 style="color: #800000">Account details</h3>
		</center>
	</div>
	<div class="panel-body" style="text-align: center;">

		<h4>Account Number</h4>

		<p>
			<c:out value="${compte.codeCompte }"></c:out>
		</p>

		<h4>Account Type</h4>

		<p>${compte }</p>

		<h4>Balance</h4>

		<p>
			<c:out value="${compte.solde }"></c:out>
		</p>

		<h4>Date of creation</h4>

		<p>
			<c:out value="${compte.dateCreation }"></c:out>
		</p>




	</div>
	<div class="panel-footer" style="text-align: center;">
		<p>
			<a
				href='<spring:url value="/accounts/transactions/${compte.codeCompte }"></spring:url>'>View
				All Transactions</a>
		</p>
		<p>
			<a href='<spring:url value="/accounts"></spring:url>'>Back to
				Accounts</a>
		</p>
	</div>


</div>


