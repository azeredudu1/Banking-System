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
					<i class="icon20 i-users"></i> Customers
				</h1>
			</div>

			<div class="row">

				<div class="col-lg-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="icon">
								<i class="icon20 i-users"></i>
							</div>
							<h4>All customers</h4>
							<a href="#" class="minimize"></a>
						</div>
						<!-- End .panel-heading -->

						<div class="panel-body">
							<c:if test="${success eq true }">
								<div class="alert alert-success" align="center" id="removeMe">
									Customer successfully created<a href="#" class="pull-right"
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
							<div class="row">
								<div class="col-lg-6">
									<div id="dataTable_length" class="dataTables_length">
										<a href='<spring:url value="/new_user"></spring:url>'>
											<button type="submit" class="btn btn-primary">Add
												new</button>
										</a>
									</div>
								</div>
							</div>

							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-bordered table-hover" id="dataTable">
								<thead>
									<tr>
										<th>Name</th>
										<th>Username</th>
										<th>Address</th>
										<th>Email</th>
										<th>Registered</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}">
										<tr>
											<td class="center"><c:out
													value="${user.firstName} ${user.lastName }" /></td>
											<td class="center"><c:out value="${user.userName}" /></td>
											<td class="center"><c:out value="${user.address}" /></td>
											<td class="center"><c:out value="${user.email}" /></td>
											<td class="center"><c:out value="${user.dateCreation}" /></td>
											<%-- <td class="center"><c:choose>
													<c:when test="${user.rolename == 'ROLE_ADMIN'}">Administrator</c:when>
													<c:when test="${user.rolename == 'ROLE_USER'}">User</c:when>
												</c:choose></td> --%>
											<td class="center"><c:out
													value="${user.actived == true ? 'Activated' : 'Desactivated'}" /></td>
											<td class="center ">
												<div class="btn-group">
													<a href="#" class="btn btn-success tip" title=""
														data-original-title="View user"><i
														class="icon16 i-eye-3"></i></a> <a
														href="
                                        	<c:url value='/edit_user'>
											   <c:param name='userid' value='${user.idUser}'/>
											</c:url>"
														class="btn btn-info tip" title=""
														data-original-title="Edit user"><i
														class="icon16 i-pencil"></i></a> <a href="#"
														class="btn btn-danger tip openModalDialog" title=""
														data-original-title="Delete user"><i
														class="icon16 i-remove-4"></i></a> <span
														class="deleteUserUrlPlaceholder" hidden="hidden"> <c:url
															value='/delete_user'>
															<c:param name='userid' value='${user.idUser}' />
														</c:url>
													</span>
													<div title="DELETE USER" class="dialog">
														<p>This action will delete all customer's data. Are you
															sure?</p>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th class="center">Name</th>
										<th class="center">Username</th>
										<th class="center">Password</th>
										<th class="center">Email</th>
										<th class="center">Registered</th>
										<th class="center">Status</th>
										<th class="center">Actions</th>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- End .panel-body -->
					</div>
					<!-- End .widget -->

				</div>
				<!-- End .col-lg-12  -->

			</div>
			<!-- End .row-fluid  -->


			<script>
				//create unique ids
				$(".openModalDialog").each(function(i) {
					$(this).attr("id", "openModal" + i);
				});

				// create unique ids
				$(".dialog").each(function(i) {
					$(this).attr("id", "modal" + i);
				});

				// create unique ids
				$(".deleteUserUrlPlaceholder").each(function(i) {
					$(this).attr("id", "deleteUserUrl" + i);
				});

				$(".openModalDialog").each(function(i) {
					var openModalId = $(this).attr("id");
					$("#" + openModalId).click(function() {
						$('#modal' + i).dialog('open');
						return false;
					});

					// JQuery UI Modal Dialog	
					$('#modal' + i).dialog({
						autoOpen : false,
						modal : true,
						dialogClass : 'dialog modalDialogWarning',
						buttons : [ {
							text : "Delete",
							"class" : "btn btn-danger",
							click : function() {
								var url = $("#deleteUserUrl" + i).text();
								window.location = url;
								$(this).dialog("close");
							}
						}, {
							text : "Cancel",
							click : function() {
								$(this).dialog("close");
							}
						} ]
					});

				});

				$("div.dialog button").addClass("btn");

				function removeDiv(divId) {
					$("#" + divId).remove()
				}
				$("#removeMe").fadeIn(5000);
				$("#removeMe").fadeOut(7000);
				setTimeout("$('#removeMe').hide();", 7000);
			</script>





		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>