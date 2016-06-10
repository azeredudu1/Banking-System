<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//adding load class to body and hide page only if plugin is active
	document.documentElement.className += 'loading';
</script>

<!-- Init plugins only for page -->

<!-- Core stylesheets do not remove -->
<link rel="stylesheet" href="../../../resources/files/bootstrap/genyx/css/icons.css">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/bootstrap/bootstrap-theme.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/icons.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/genyx-theme/jquery.ui.genyx.css"
	rel="stylesheet" />

<!-- Plugins stylesheets -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/uniform/uniform.default.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/select2/select2.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/ui/jgrowl/jquery.jgrowl.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/tables/datatables/jquery.dataTables.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/ui/range-slider/rangeslider.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/switch/bootstrapSwitch.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/spectrum/spectrum.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/datepicker/datepicker.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/multiselect/ui.multiselect.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/plugins/jquery-timepicker/jquery.timepicker.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/plugins/jquery-color-picker/jquery.colorpicker.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/upload/elfinder/elfinder.min.css"
	rel="stylesheet" />

<!-- app stylesheets -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/app.css"
	rel="stylesheet" />

<!-- Custom stylesheets ( Put your own changes here ) -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/css/custom.css"
	rel="stylesheet" />
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/images/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/bootstrap/genyx/images/ico/favicon.png">

<!-- Important plugins put in all pages -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/bootstrap/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/conditionizr.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/core/nicescroll/jquery.nicescroll.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/core/jrespond/jRespond.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/jquery.genyxAdmin.js"></script>
<!-- Form plugins -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/uniform/jquery.uniform.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/select2/select2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/tables/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/jquery.mousewheel.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/autosize/jquery.autosize-min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/inputlimit/jquery.inputlimiter.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/mask/jquery.mask.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/switch/bootstrapSwitch.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/globalize/globalize.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/spectrum/spectrum.js"></script>
<!--  Color picker -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/datepicker/bootstrap-datepicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/multiselect/ui.multiselect.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/tinymce/tinymce.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/jquery-timepicker/jquery.timepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/jquery-color-picker/jquery.colorpicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/wizard/jquery.form.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/wizard/jquery.form.wizard.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>

<!-- kceditor plugin -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/ckeditor/ckeditor.js"></script>

<!-- elfinder plugin -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/upload/elfinder/elfinder.min.js"></script>

<!-- UI plugins -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/ui/range-slider/rangeslider-ruler.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/ui/animated-progress-bar/jquery.progressbar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/plugins/ui/jgrowl/jquery.jgrowl.min.js"></script>

<!-- Init plugins -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/app.js"></script>
<!-- Core js functions -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/domready.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/form-validation.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/login.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/dashboard.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/data-tables.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/ui-elements.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/form-elements.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/file-manager.js"></script>
<!-- Init plugins only for page -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/genyx/js/pages/form-wizard.js"></script>
<!-- Init plugins only for page -->

<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/resources/js/style.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/ladda.min.js"></script>

<title>Admin interface</title>
</head>
<body>

	Tokoss lol..
	<header id="header"> <nav
		class="navbar navbar-default navbar-fixed-top" role="navigation">
	<button type="button" class="navbar-toggle btn-danger"
		data-toggle="collapse" data-target="#navbar-to-collapse">
		<span class="sr-only">Toggle right menu</span> <i
			class="icon16 i-arrow-8"></i>
	</button>
	<div class="collapse navbar-collapse" id="navbar-to-collapse">
		<ul class="nav navbar-nav pull-right">
			<li class="divider-vertical"></li>
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="icon24 i-exit-2"></i> <span
					class="more"><i class="icon16 i-arrow-down-2"></i></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a href="#" class=""><i
							class="icon16 i-question"></i> Help</a></li>
					<li role="presentation"><a
						href='<spring:url value="/logout"></spring:url>' class=""><i
							class="icon16 i-exit"></i> Logout</a></li>
				</ul></li>
			<li class="divider-vertical"></li>
		</ul>
	</div>
	<!--/.nav-collapse --> </nav> </header>
	<!-- End #header  -->

	<div class="main">
		<aside id="sidebar">
		<div class="side-options">
			<ul class="list-unstyled">
				<li><a href="#" id="collapse-nav" class="act act-primary tip"
					title="Collapse navigation"> <i class="icon16 i-arrow-left-7"></i>
				</a></li>
			</ul>
		</div>

		<div class="sidebar-wrapper">
			<nav id="mainnav">
			<ul class="nav nav-list">
				<li><a href="<c:url value='dashboard'/>"> <span
						class="icon"><i class="icon20 i-screen"></i></span> <span
						class="txt">Dashboard</span>
				</a></li>
				<li id="usersTab"><a href="#"> <span class="icon"><i
							class="icon20 i-users"></i></span> <span class="txt">Customers</span>
				</a>
					<ul class="sub">
						<li><a href='<spring:url value="/new_user"></spring:url>'>
								<span class="icon"><i class="icon20 i-user-plus"></i></span> <span
								class="txt">Add new</span>
						</a></li>
						<li><a href='<spring:url value="/users"></spring:url>'> <span
								class="icon"><i class="icon20 i-users"></i></span> <span
								class="txt">All customers</span>
						</a></li>
					</ul></li>
				<li id="articlesTab"><a href="#"> <span class="icon"><i
							class="icon20 i-stack-list"></i></span> <span class="txt">Accounts</span>
				</a>
					<ul class="sub">
						<li><a href='<spring:url value="/new_account"></spring:url>'>
								<span class="icon"><i class="icon20 i-stack-plus"></i></span> <span
								class="txt">Add new</span>
						</a></li>
						<li><a href='<spring:url value="/all_accounts"></spring:url>'>
								<span class="icon"><i class="icon20 i-stack-list"></i></span> <span
								class="txt">All accounts</span>
						</a></li>
					</ul></li>
				<li id="articlesTab"><a href="#"> <span class="icon"><i
							class="icon20 i-stack-2"></i></span> <span class="txt">Transactions</span>
				</a>
					<ul class="sub">
						<li><a href='<spring:url value="/new_deposit"></spring:url>'>
								<span class="icon"><i class="icon20 i-stack-plus"></i></span> <span
								class="txt">Deposit</span>
						</a></li>
						<li><a href='<spring:url value="/new_withdrawal"></spring:url>'>
								<span class="icon"><i class="icon20 i-stack-minus"></i></span> <span
								class="txt">Withdrawal</span>
						</a></li>
					</ul></li>

				<li><a href="#"> <span class="icon"><i
							class="icon20 i-cogs"></i></span> <span class="txt">Settings</span>
				</a></li>
			</ul>
			</nav>
			<!-- End #mainnav -->


		</div>
		<!-- End .sidebar-wrapper  --> </aside>
		<!-- End #sidebar  -->

		<section id="content">
		<div class="wrapper">
			<div class="crumb"></div>

			<div class="container-fluid">


				<tiles:insertAttribute name="body"></tiles:insertAttribute>


			</div>
			<!-- End .container-fluid  -->

		</div>
		<!-- End .wrapper  --> </section>
	</div>
	<!-- End .main  -->









</body>
</html>