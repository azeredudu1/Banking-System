<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://github.com/dandelion/datatables"
	prefix="datatables"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<datatables:table id="transaction" row="op" data="${operations }"
		export="pdf" theme="jqueryui" themeOption="overcast" info="true"
		pageable="true" pagingType="listbox" lengthMenu="5,10,15,20,50"
		cssClass="table table-hover table-striped table-responsive">
		<datatables:column title="Operation Type" sortable="true">
						${op }
					</datatables:column>
		<datatables:column title="Amount" property="montant"
			cssStyle="height:40px;">

		</datatables:column>
		<datatables:column title="Date Time" property="dateOperation"></datatables:column>
		<datatables:export type="pdf" label="SAVE" fileName="transactions"
			cssClass="btn btn-default" cssStyle="height:30px;" />
	</datatables:table>



</body>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.js"></script>
</html>