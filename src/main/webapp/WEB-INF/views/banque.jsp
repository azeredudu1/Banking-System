<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Your informations|welcome</title>

</head>
<body>
	
	<div>
		<f:form action="chargerCompte" method="post"
			modelAttribute="banqueForm">

			<table>
				<tr>
					<td><f:label path="code">Account Code :</f:label></td>
					<td><f:input path="code" /></td>
					<td><f:errors path="code" cssClass="error"></f:errors></td>
				</tr>
				<tr>
					<td><input type="submit" value="OK"></td>
				</tr>
			</table>
		</f:form>
	</div>

	<c:choose>
		<c:when test="${!empty banqueForm.compte }">
			<div>
				<table>

					<tr>
						<td>Saving account:</td>
						<td><c:out value="${banqueForm.typeCompte }"></c:out></td>
					<tr>
						<td>Balance:</td>
						<td><c:out value="${banqueForm.compte.solde }"></c:out></td>


						<c:if test="${banqueForm.typeCompte=='CompteCourant' }">
							<tr>
								<td>Decouvert:</td>
								<td><c:out value="${banqueForm.compte.decouvert }"></c:out></td>
						</c:if>


						<c:if test="${banqueForm.typeCompte=='CompteEpargne' }">
							<tr>
								<td>rate:</td>
								<td><c:out value="${banqueForm.compte.taux }"></c:out></td>
						</c:if>
					<tr>
						<td>Date of creation:</td>
						<td><c:out value="${banqueForm.compte.dateCreation }"></c:out></td>

					</tr>
				</table>


			</div>
			<div>
				<table>
					<tr>
						<td>Name Client:</td>
						<td><c:out value="${banqueForm.compte.client.nomClient }"></c:out></td>
					</tr>

				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>Employee name:</td>
						<td><c:out value="${banqueForm.compte.employe.nomEmploye }"></c:out></td>
					</tr>

				</table>
			</div>
			<div>

				<f:form action="saveOperation" modelAttribute="banqueForm">
					<table>
						<tr>
							<f:hidden path="code" />
							<td>Deposit:<f:radiobutton path="typeOperation" value="VER"
									onclick="this.form.submit()" /></td>
							<td>withdraw:<f:radiobutton path="typeOperation" value="RET"
									onclick="this.form.submit()" /></td>
							<td>Transfert:<f:radiobutton path="typeOperation"
									value="VIR" onclick="this.form.submit()" /></td>
						</tr>
						<c:if test="${!empty banqueForm.typeOperation }">
							<tr>
								<td><f:label path="montant">Amount:</f:label></td>
								<td><f:input path="montant" /></td>
								<td><f:errors path="montant" cssClass="error"></f:errors></td>

								<c:if test="${banqueForm.typeOperation=='VIR' }">
									<tr>

										<td>Receiver account number:</td>
										<td><f:input path="code2" /></td>
										<td><f:errors path="code2"></f:errors></td>
									<tr>
										<td class="error">${banqueForm.exception }</td>

									</tr>




								</c:if>
							<tr>
								<td><input type="submit" value="save" name="action"></td>
							</tr>
						</c:if>

					</table>







				</f:form>


			</div>


			<div>




				<table class="table1">
					<tr>
						<th>Num</th>
						<th>Type</th>
						<th>Date</th>
						<th>Amount</th>
					</tr>
					<c:forEach items="${banqueForm.operations }" var="ops">
						<tr>
							<td><c:out value="${ops.numOperation }"></c:out></td>
							<td>${ops }</td>
							<td><c:out value="${ops.dateOperation }"></c:out></td>
							<td><c:out value="${ops.montant }"></c:out></td>



						</tr>
					</c:forEach>
				</table>





			</div>
			<div>

				<c:forEach begin="0" end="${banqueForm.nombrePages-1 }" var="p">
					<c:choose>
						<c:when test="${p==banqueForm.page }">
							<span class="current">Page ${p+1 }</span>
						</c:when>
						<c:otherwise>
							<span class="autrePage"> <a
								href="chargerCompte?page=${p}&code=${banqueForm.code } ">
									Page ${p+1} </a>
							</span>
						</c:otherwise>
					</c:choose>

				</c:forEach>

			</div>


		</c:when>

		<c:when test="${!empty banqueForm.exception }">
			<div>
				<p class="error">${banqueForm.exception }</p>
			</div>



		</c:when>

	</c:choose>
	
	


</body>
</html>