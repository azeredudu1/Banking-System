<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<link rel="stylesheet"
	href="../../../resources/files/css/bootstrap.min.css">

<html>

<security:authorize access="isAuthenticated()">
	<%-- <tilesx:useAttribute name="current" /> --%>
	<ul class=" nav nav-tabs-justified nav-pills nav-stacked">
		<li><a href='<spring:url value="/accounts"></spring:url>'><span
				class="glyphicon glyphicon-th"></span> Accounts</a></li>
		<li><a href='<spring:url value="/transferForm"></spring:url>'><span
				class="glyphicon glyphicon-transfer"></span> Make A Transfer</a></li>
		<li><a href='<spring:url value="/depositForm"></spring:url>'><span
				class="glyphicon glyphicon-plus-sign"></span> Make A Deposit</a></li>
		<li><a href='<spring:url value="/withdrawalForm"></spring:url>'><span
				class="glyphicon glyphicon-minus-sign"></span> Withdrawal</a></li>
				<li><a href='<spring:url value="#"></spring:url>'><span
				class="glyphicon glyphicon-check"></span> Exchange Rate</a></li>
	</ul>
	<script type="text/javascript">
		$(function() {
			function stripTrailingSlash(str) {
				if (str.substr(-1) == '/') {
					return str.substr(0, str.length - 1);
				}
				return str;
			}

			var url = window.location.pathname;
			var activePage = stripTrailingSlash(url);

			$('.nav li a').each(function() {
				var currentPage = stripTrailingSlash($(this).attr('href'));

				if (activePage == currentPage) {
					$(this).parent().addClass('active');
				}
			});
		});
	</script>


</security:authorize>

</html>