<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<script LANGUAGE="JavaScript">
	function dealSelect() {
		location.href = "self_assessment.htm?selectedDeal="
				+ document.form.selectedDeal.options[document.form.selectedDeal.selectedIndex].value
				+ "&month="
				+ document.form.selectedMonth.options[document.form.selectedMonth.selectedIndex].value;
	}

	function reportSubmit() {
		window.alert("Report submitted successfully");
	}

	window.onload = function() {

		var x = ${fScore};
		if (x != 999) {
			document.getElementById('div1').style.display = 'block';
		} else {
			document.getElementById('div1').style.display = 'none';
		}

		var y = ${noDeal};
		if (y == 1) {
			document.getElementById('tables').style.display = 'none';
			window.alert("No data exists for previous month or Report is not submitted for previous month!");
			
		}
		if(y == 2){
			window.alert("New month deal open for changes now.");
		}
	}
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

	<form:form name="form" modelAttribute="deal"
		action="self_assessment.htm" method="POST">

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

				<li class="nav-item active"><a class="nav-link"
					href="self_assessment.htm"> <i class="fas fa-fw fa-table"></i> <span><b>Self
							Assessment</b></span></a></li>
				<li class="nav-item "><a class="nav-link" href="dashboard.htm"> <i
						class="fas fa-fw fa-tachometer-alt"></i> <span><b>Dashboard</b></span>
				</a></li>
			</ul>

			<div id="content-wrapper">

				<div class="container-fluid">

					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><span>Deal Name :</span> <select
							name="selectedDeal" onchange="">
								<c:forEach var="hash" items="${dealList}">
									<option value="${hash}"
										<c:if test = "${hash eq param.selectedDeal}"> selected="selected" </c:if>>${hash}</option>
								</c:forEach>
						</select> 
						Month :
						<select name='selectedMonth'>
							<c:forEach var="hash" items="${monthList}">
								<option value='<c:out value="${hash.value}"/>' 
								<c:if test = "${hash.value eq param.month}"> selected="selected" </c:if>
								><c:out value="${hash.value}" /></option>
							</c:forEach>
						</select> <input type="button" value="Get Deal"
							onclick="dealSelect(this.form)"></li>

					</ol>





					<!-- DataTables Example -->
					<div id="tables" class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table"></i> Self Assessment Form
						</div>


						<div class="card-body mycustom">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th><b>Category</b></th>
											<th><b>Key Parameters</b></th>
											<th><b>Foundation</b></th>
											<th><b>Engagement Score</b></th>
											<th><b>Automated</b></th>
											<th><b>Engagement Score</b></th>
											<th><b>Smart</b></th>
											<th><b>Engagement Score</b></th>
											<th><b>Intelligent</b></th>
											<th><b>Engagement Score</b></th>
											<th><b>Supporting Frameworks/Tools</b></th>
											<th><b>Remarks/Exclusions</b></th>
											<th><b>Validation</b></th>
										</tr>
									</thead>
									<tbody>
										<form:hidden path="dealId" />
										<form:hidden path="dealName" />
										<form:hidden path="month" />
										<c:set var="z" value="0" />
										<c:forEach var="hash" varStatus="vs"
											items="${deal.categories}">

											<tr>
												<c:set var="x" value="${hash.keyParameters}" />
												<c:set var="z" value="${z+1}" />
												<td rowspan="${fn:length(x)}" class="myclass${z}"><b><c:out
														value="${hash.categoryName}" /></b></td>
												<c:set var="y" value="0" />

												<c:forEach var="hash_1" varStatus="vs1"
													items="${hash.keyParameters}">

													<c:set var="y" value="${y+1}" />
													<c:if test="${y > 1}">
														<tr>
													</c:if>
													<td><c:out value="${hash_1.parameterName}" /></td>


													<td><div class="moreText">
															<c:out value="${hash_1.foundationAttr}" />
															<br> <span class="tooltiptext"><c:out
																	value="${hash_1.foundationAttr}" /></span>
														</div></td>


													<td class="stopGapCondition"><form:select
															cssStyle="width:60px;"
															path="categories[${vs.index}].keyParameters[${vs1.index}].foundationScore">
															<form:options items="${score}" />
														</form:select></td>

													<td>
														<div class="moreText">
															<c:out value="${hash_1.stabilizationAttr}" />
															<br> <span class="tooltiptext"><c:out
																	value="${hash_1.stabilizationAttr}" /></span>
														</div>
													</td>

													<td class="stopGapCondition"><form:select
															cssStyle="width:60px;"
															path="categories[${vs.index}].keyParameters[${vs1.index}].stabilizationScore">
															<form:options items="${score}" />
														</form:select></td>

													<td>
														<div class="moreText">
															<c:out value="${hash_1.transformationAttr}" />
															<br> <span class="tooltiptext"><c:out
																	value="${hash_1.transformationAttr}" /></span>
														</div>
													</td>

													<td class="stopGapCondition"><form:select
															cssStyle="width:60px;"
															path="categories[${vs.index}].keyParameters[${vs1.index}].transformationScore">
															<form:options items="${score}" />
														</form:select></td>

													<td><div class="moreText">
															<c:out value="${hash_1.innovationAttr}" />
															<br> <span class="tooltiptext"><c:out
																	value="${hash_1.innovationAttr}" /> </span>
														</div></td>

													<td class="stopGapCondition"><form:select
															cssStyle="width:60px;"
															path="categories[${vs.index}].keyParameters[${vs1.index}].innovationScore">
															<form:options items="${score}" />
														</form:select></td>


													<td><div class="moreText">
															<c:out value="${hash_1.supportingTools}" />
															<br> <span class="tooltiptext"><c:out
																	value="${hash_1.supportingTools}" /></span>
														</div></td>


													<td><form:input
															path="categories[${vs.index}].keyParameters[${vs1.index}].remarks" /></td>
													<c:if test="${y==1}">
														<td rowspan="${fn:length(x)}"
															style="vertical-align: middle; text-align: center;"><c:out
																value="${hash.categoryValidation}" /></td>
													</c:if>
												</c:forEach>

											</tr>
											</tr>
										</c:forEach>
									</tbody>

								</table>
								<input type="submit" class="button" name="saveProgress"
									value="Save Progress" <c:if test = "${1 eq previousDeal}"> style="visibility: hidden" </c:if>/> 
								<input type="submit" class="button"
									name="calculate" value="Calculate" <c:if test = "${1 eq previousDeal}"> style="visibility: hidden" </c:if>/>
							</div>
						</div>

						<div id="div1" class="card-footer ">
							<div class="card-header">
								<i class="fas fa-table"></i> Engagement Result
							</div>

							<table class="table table-bordered">
								<thead>
									<tr>
										<th><b>Category</b></th>
										<th><b>Foundation</b></th>
										<th><b>Automated</b></th>
										<th><b>Smart</b></th>
										<th><b>Intelligent</b></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Engagement Compliance Percentage</td>
										<td><span id="fscoreTest"><c:out value="${fScore}" />%</span></td>
										<td><c:out value="${sScore}" />%</td>
										<td><c:out value="${tScore}" />%</td>
										<td><c:out value="${iScore}" />%</td>

									</tr>
									<tr>
										<td>Total Engagement Score</td>
										<td colspan="4" align="center"><c:out
												value="${totalScore}" />%</td>
									</tr>
								</tbody>
							</table>
							<input type="submit" onclick="reportSubmit(this.form)"
								class="button" name="saveReport" value="Submit Report" <c:if test = "${1 eq previousDeal}"> style="visibility: hidden" </c:if>/>
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
	</form:form>
</body>


</html>