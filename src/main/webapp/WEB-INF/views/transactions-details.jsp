<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css"><%@taglib
	uri="http://www.springframework.org/tags" prefix="spring"%>

<html>



<c:choose>
	<c:when test="${!empty operations }">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 style="color: #800000; text-align: center;" >Transactions Details</h3>
			</div>
			<div class="panel-body">
				<table class="table table-hover table-responsive table-striped ">
					<thead>
						<tr>
							<th>Type Operation</th>
							<th>Amount</th>
							<th>Date Time</th>
					</thead>
					<c:forEach items="${operations }" var="op">
						<tr>
							<td><c:out value="${op }"></c:out></td>
							<td><c:out value="${op.montant }"></c:out></td>
							<td><c:out value="${op.dateOperation }"></c:out></td>


						</tr>





					</c:forEach>




				</table>


				<div class="panel-footer" style="text-align: center;">
					<c:forEach begin="0" end="${banqueForm.nombrePages-1 }" var="p">

						<c:choose>
							<c:when test="${p==banqueForm.page }">
								<a class="btn btn-primary active">${p+1 }</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary"
									href='<spring:url value="/accounts/transactions/${code}?page=${p} "></spring:url>'>
									${p+1} </a>

							</c:otherwise>
						</c:choose>


					</c:forEach>
				</div>



				<p>
					<a href='<spring:url value="/accounts"></spring:url>'>Back to
						Accounts</a>
				</p>


			</div>




		</div>





	</c:when>
	<c:otherwise>
		<div class="panel panel-default ">


			<div class="panel-body">

				<h4 style="color: red; text-align: center;">No transaction
					found in the database !</h4>


			</div>
		</div>
	</c:otherwise>



</c:choose>

</html>