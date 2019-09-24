<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<script LANGUAGE="JavaScript">
	
</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>J2IO Dashboard</title>

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

<link href="css/td-color.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top" class="sidebar-toggled">

	<form name="form" action="dashboard.htm" method="POST">

		<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.jsp">J2IO Dashboard</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		</nav>

		<div id="wrapper">

			<!-- Sidebar -->
			<ul class="sidebar navbar-nav toggled">

				<li class="nav-item "><a class="nav-link"
					href="self_assessment.htm"> <i class="fas fa-fw fa-table"></i> <span>Self
							Assessment</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="dashboard.htm"> <i
						class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
				</a></li>
			</ul>

			<div id="content-wrapper">

				<div class="container-fluid">

					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
						
						DG Lead :
						<select name='dgLead'>
								<option value='All'>All</option>
								<c:forEach var="hash" items="${dgLeadList}">
									<option value="${hash}"
										<c:if test = "${hash eq param.dgLead}"> selected="selected" </c:if>>${hash}</option>
								</c:forEach>
						</select>
						
						DU Lead :
						<select name='duLead'>
								<option value='All' >All</option>
								<c:forEach var="hash" items="${duLeadList}">
									<option value="${hash}"
										<c:if test = "${hash eq param.duLead}"> selected="selected" </c:if>>${hash}</option>
								</c:forEach>
						</select>
						
						Location :
						<select name='location'>
								<option value='All'>All</option>
								<c:forEach var="hash" items="${locationList}">
									<option value="${hash}"
										<c:if test = "${hash eq param.location}"> selected="selected" </c:if>>${hash}</option>
								</c:forEach>
						</select>
						Month :
						<select name='selectedMonth'>
							<c:forEach var="hash" items="${monthList}">
								<option value='<c:out value="${hash.value}"/>' 
								<c:if test = "${hash.value eq month}"> selected="selected" </c:if>>
								<c:out value="${hash.value}" /></option>
							</c:forEach>
						</select> <input type="submit" name="filter" value="Filter"></li>

					</ol>





					<!-- DataTables Example -->
					<div class="card mb-3">
						


						<div class="card-body mycustom">
							<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>

                    <tr>
                      <th>Deal Name</th>
                      <th>DG Lead</th>
                      <th>DU Lead</th>
                      <th>Region</th>
                      <th>Location</th>
                      <th colspan="4" >Stage Wise Score</th>
                      <th>Total Score</th>
                    </tr>
                    <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>Foundation</th>
                      <th>Automated</th>
                      <th>Smart</th>
                      <th>Intelligent</th>
                      <th></th>
                    </tr>
                  </thead>
                 
                  <tbody>
                    
                    <c:forEach var = "hash" items="${reportsMap}">
                    <tr>
                      <td><c:out value="${hash.key.dealName}" /></td>
                      <td><c:out value="${hash.key.dgLead}" /></td>
                      <td><c:out value="${hash.key.duLead}" /></td>
                      <td>Region</td>
                      <td><c:out value="${hash.key.location}" /></td> 
                      <td><c:out value="${hash.value.founScore}" /></td>
                      <td><c:out value="${hash.value.stabScore}" /></td>
                      <td><c:out value="${hash.value.tranScore}" /></td>
                      <td><c:out value="${hash.value.innoScore}" /></td>
                      <td><c:out value="${hash.value.totalScore}" /></td>
                      </tr>
                      </c:forEach>
                    
                    
                  </tbody>
                </table>
							
							</div>
						</div>


					</div>

				</div>
				<!-- /.container-fluid -->

				<!-- Sticky Footer -->
				<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto"></div>
				</div>
				</footer>

			</div>
			<!-- /.content-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>


		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>



		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>

		<!-- Demo scripts for this page-->
		<script src="js/demo/datatables-demo.js"></script>

		<script src="js/td-color.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	</form>
</body>


</html>