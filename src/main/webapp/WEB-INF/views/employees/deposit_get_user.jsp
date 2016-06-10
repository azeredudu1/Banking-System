<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://github.com/dandelion/datatables"
	prefix="datatables"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertDefinition name="employee">

		<tiles:putAttribute name="body">


			<div id="heading" class="page-header">
				<h1>
					<i class="icon20 i-stack-plus"></i>Deposit
				</h1>
			</div>

			<div class="row">

				<div class="col-lg-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="icon">
								<i class="icon20 i-stack-minus"></i>
							</div>
							<h4>Deposit...</h4>
							<a href="#" class="minimize"></a>
						</div>
						<!-- End .panel-heading -->

						<div class="panel-body">
							<c:if test="${success eq true }">
								<div class="alert alert-success" align="center" id="removeMe">
									User successfully created<a href="#" class="pull-right"
										onclick="removeDiv('removeMe');">&times;</a>
								</div>

							</c:if>
							<c:if test="${!empty deleteSuccess }">
								<div class="alert alert-success" align="center" id="removeMe">
									${deleteSuccess }<a href="#" class="pull-right"
										onclick="removeDiv('removeMe');">&times;</a>
								</div>

							</c:if>
							<c:if test="${!empty updateSuccess }">
								<div class="alert alert-success" align="center" id="removeMe">
									${updateSuccess }<a href="#" class="pull-right"
										onclick="removeDiv('removeMe');">&times;</a>
								</div>

							</c:if>
							

							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-bordered table-hover" id="dataTable">
								<thead>
									<tr>
										<th>Choose customer :</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}">
										<tr>
											<td class="center"><spring:url value="/do_deposit"
													var="newAccount">
													<spring:param name="idUser" value="${user.idUser }"></spring:param>
												</spring:url> <a href="${newAccount }"><c:out
														value="${user.firstName} ${user.lastName }" /></a></td>


										</tr>
									</c:forEach>
								</tbody>

							</table>
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
</body>
</html>