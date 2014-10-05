<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="css/pt-main.css" rel="stylesheet">
<link href="css/home.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0"> <s:action name="navbar" flush="true"
			executeResult="true" namespace="/secure" /> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="input-group"
					style="width: 80%; margin: 30px auto 30px auto;">
					<span class="input-group-addon">Filter</span> <input id="filter"
						type="text" class="form-control" placeholder="Type here...">
				</div>
				<div>
					<table class="table table-striped" style="width: 80%;"
						align="center">
						<thead>
							<tr>
								<th style="width: 22%;">Name</th>
								<th style="width: 15%;">User Name</th>
								<th style="width: 22%;">email</th>
								<th style="width: 13%;">Role</th>
								<th style="width: 20%;">NIC</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody class="searchable">

							<s:property escape="false" value="tableRows"></s:property>
						</tbody>
					</table>

				</div>
			</div>

			<!-- jQuery Version 1.11.0 -->
			<script src="js/jquery-1.11.0.js"></script>
			<script type="text/javascript" src="js/jquery-ui.min.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="js/bootstrap.min.js"></script>

			<!-- Metis Menu Plugin JavaScript -->
			<script src="js/plugins/metisMenu/metisMenu.min.js"></script>

			<script type="text/javascript" src="js/home.js"></script>
			<script src="js/pt-main.js"></script>

			<script type="text/javascript" src="js/tabs.js"></script>
			<script type="text/javascript">
				$('#users').addClass('active');
				$('#add-user-home').addClass('active');
			</script>
</body>
</html>