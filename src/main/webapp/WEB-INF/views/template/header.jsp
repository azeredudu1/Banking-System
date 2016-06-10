<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="../../../resources/files/css/bootstrap.min.css">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<title>Insert title here</title>
<style>
/* jssor slider bullet navigator skin 05 css */
/*
                .jssorb05 div           (normal)
                .jssorb05 div:hover     (normal mouseover)
                .jssorb05 .av           (active)
                .jssorb05 .av:hover     (active mouseover)
                .jssorb05 .dn           (mousedown)
                */
.jssorb05 {
	position: absolute;
}

.jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
	position: absolute;
	/* size of bullet elment */
	width: 16px;
	height: 16px;
	background: url(<%=request.getContextPath()%>/resources/images/b05.png)
		no-repeat;
	overflow: hidden;
	cursor: pointer;
}

.jssorb05 div {
	background-position: -7px -7px;
}

.jssorb05 div:hover, .jssorb05 .av:hover {
	background-position: -37px -7px;
}

.jssorb05 .av {
	background-position: -67px -7px;
}

.jssorb05 .dn, .jssorb05 .dn:hover {
	background-position: -97px -7px;
}
/* jssor slider arrow navigator skin 11 css */
/*
                .jssora11l                  (normal)
                .jssora11r                  (normal)
                .jssora11l:hover            (normal mouseover)
                .jssora11r:hover            (normal mouseover)
                .jssora11l.jssora11ldn      (mousedown)
                .jssora11r.jssora11rdn      (mousedown)
                */
.jssora11l, .jssora11r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 37px;
	height: 37px;
	cursor: pointer;
	background: url(<%=request.getContextPath()%>/resources/images/a11.png)
		no-repeat;
	overflow: hidden;
}

.jssora11l {
	background-position: -11px -41px;
}

.jssora11r {
	background-position: -71px -41px;
}

.jssora11l:hover {
	background-position: -131px -41px;
}

.jssora11r:hover {
	background-position: -191px -41px;
}

.jssora11l.jssora11ldn {
	background-position: -251px -41px;
}

.jssora11r.jssora11rdn {
	background-position: -311px -41px;
}
</style>
</head>

<body>



	<!-- NAVBAR
    ================================================== -->
	<div class="container">

		<nav class="navbar navbar-inverse navbar-static-top" role="navigation"
			style="margin-bottom: 0px;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://www.jssor.com/index.html">
					My bank logo </a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="http://www.jssor.com/index.html">Home</a></li>
					<li><a href="http://www.jssor.com/slider-maker/index.html">Our
							services</a></li>
					<li><a href="http://www.jssor.com/development/index.html">Contact
							us </a></li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li><a href="http://www.jssor.com/index.html">Hi ${name }</a></li>
					<li><a href='<spring:url value="/logout"></spring:url>'><span
							class="glyphicon glyphicon-log-out"></span> Logout </a></li>

				</ul>
			</div>
		</div>
		</nav>

	</div>

	<!-- Use a container to wrap the slider, the purpose is to enable slider to always fit width of the wrapper while window resize -->
	<div class="container">
		<!-- Jssor Slider Begin -->
		<!-- To move inline styles to css file/block, please specify a class name for each element. -->
		<!-- ================================================== -->
		<div id="slider1_container"
			style="visibility: hidden; position: relative; margin: 0 auto; width: 1000px; height: 300px; overflow: hidden;">

			<!-- Loading Screen -->
			<div u="loading" style="position: absolute; top: 0px; left: 0px;">
				<div
					style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; background-color: #000; top: 0px; left: 0px; width: 100%; height: 100%;">
				</div>
				<div
					style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
				</div>
			</div>

			<!-- Slides Container -->
			<div u="slides"
				style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1140px; height: 442px; overflow: hidden;">
				<div>
					<img u="image"
						src2="<%=request.getContextPath()%>/resources/images/bank6.jpg" />
				</div>
				<div>
					<img u="image"
						src2="<%=request.getContextPath()%>/resources/images/bank5.jpg" />
				</div>
				<div>
					<img u="image"
						src2="<%=request.getContextPath()%>/resources/images/bank7.jpg" />
				</div>
				<div>
					<img u="image"
						src2="<%=request.getContextPath()%>/resources/images/bank4.jpg" />
				</div>
			</div>

			<!--#region Bullet Navigator Skin Begin -->
			<!-- Help: http://www.jssor.com/development/slider-with-bullet-navigator-jquery.html -->

			<!-- bullet navigator container -->
			<div u="navigator" class="jssorb05" style="bottom: 16px; right: 6px;">
				<!-- bullet navigator item prototype -->
				<div u="prototype"></div>
			</div>
			<!--#endregion Bullet Navigator Skin End -->

			<!--#region Arrow Navigator Skin Begin -->
			<!-- Help: http://www.jssor.com/development/slider-with-arrow-navigator-jquery.html -->

			<!-- Arrow Left -->
			<span u="arrowleft" class="jssora11l" style="top: 123px; left: 8px;">
			</span>
			<!-- Arrow Right -->
			<span u="arrowright" class="jssora11r"
				style="top: 123px; right: 8px;"> </span>
			<!--#endregion Arrow Navigator Skin End -->
			<a style="display: none" href="http://www.jssor.com">Bootstrap
				Carousel</a>
		</div>
		<!-- Jssor Slider End -->
		<hr class="featurette-divider" 		style="display: block; height: 1px; border: 3; border-top: 3px solid white; margin: 1em 0; padding: 0;">
	</div>

	<!-- /.container -->


</body>
</html>