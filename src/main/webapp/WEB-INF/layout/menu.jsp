<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<link rel="stylesheet" href="../../resources/files/css/bootstrap.css">

<html>

<security:authorize access="isAuthenticated()">
	<%-- <tilesx:useAttribute name="current" /> --%>
	<ul class=" nav nav-tabs-justified nav-pills nav-stacked">
		<li class="active"><a
			href='<spring:url value="/accounts"></spring:url>'><span
				class="glyphicon glyphicon-th"></span> Accounts</a></li>
		<li><a href='<spring:url value="/createAccount"></spring:url>'><span
				class="glyphicon glyphicon-plus"></span> Open New Account</a></li>
		<li><a href='<spring:url value="/transferForm"></spring:url>'>Make
				A Transfer</a></li>
		<li><a href='<spring:url value="/depositForm"></spring:url>'>Make
				A Deposit</a></li>
		<li><a href='<spring:url value="/withdrawalForm"></spring:url>'><span
				class="glyphicon glyphicon-minus"></span> Withdrawal</a></li>
	</ul>



</security:authorize>

</html>