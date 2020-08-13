<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
<head>
<title>VMedico</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://colorlib.com/etc/bootstrap-sidebar/sidebar-04/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">

</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<h1>
				<a href="#" class="logo">VMedico</a>
			</h1>
			<ul class="list-unstyled components mb-5">
				<li class="active"><a
					href="${pageContext.request.contextPath}/"><span
						class="fa fa-home mr-3"></span> Homepage</a></li>

				<security:authorize access="hasRole('ROLE_DOCTOR')">
					<li><a href="${pageContext.request.contextPath}/appointments"><span
							class="fa fa-book mr-3"></span> Appointments</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_PATIENT')">
					<li><a
						href="${pageContext.request.contextPath}/bookappointment"><span
							class="fa fa-book mr-3"></span> Book Appointment</a></li>
				</security:authorize>
				<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR')">
					<li><a href="${pageContext.request.contextPath}/patientslist"><span
							class="fa fa-wheelchair mr-3"></span> Patients</a></li>
				</security:authorize>
				<security:authorize access="hasRole('DOCTOR')">
					<li><a href="${pageContext.request.contextPath}/patientstatus"><span
							class="fa fa-check mr-3"></span> Patient Status</a></li>
				</security:authorize>
				<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR','ROLE_LADMIN')">
					<li><a href="${pageContext.request.contextPath}/labreports"><span
							class="fa fa-sticky-note mr-3"></span> Lab Reports</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="${pageContext.request.contextPath}/doctorlist"><span
							class=" fa fa-user-md mr-3"></span> Doctor List</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a
						href="${pageContext.request.contextPath}/noofappointments"><span
							class="fa fa-paper-plane mr-3"></span> All Appointments</a></li>
				</security:authorize>

				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<li>
						<div style="padding-top: 0px;">
							<input type="submit" value="logout"
								style="padding-left: 70px; padding-right: 125px; background-color: black; color: white; height: 50px;">
						</div>
					</li>
				</form:form>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<h2 class="mb-4">Patient List</h2>

			User:
			<security:authentication property="principal.username" />
			<br> Role(s):
			<security:authentication property="principal.authorities" />


			<section>
				<!-- Button trigger modal -->
				<div style="padding-left: 85%;">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">Add Patient</button>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form:form action="savepatient" modelAttribute="patient"
									mothod="POST">
							<div class="modal-body">
								

									<div class="form-row">
										<div class="form-group col-md-6">
											<label>Name</label> 
											<form:input class="form-control" path="name" placeholder="Name" />
										</div>
										<div class="form-group col-md-6">
											<label>Phone</label> <form:input type="text" class="form-control"
												path="phone" placeholder="Phone" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputAddress">Purpose</label> <form:input
											class="form-control" path="purpose" placeholder="Purpose" />
									</div>

									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCity">Status</label> <form:input type="text"
												class="form-control" placeholder="Eg- Good / Critical"
												path="status" />
										</div>
										<div class="form-group col-md-6">
											<label for="inputState">Appointment</label> <form:input
												type="text" class="form-control" placeholder="DD-MM-YYYY"
												path="date" />
										</div>

									</div>

									<!--  <button type="submit" class="btn btn-primary">Sign in</button>-->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" value="save" class="btn btn-primary">Save
									changes</button>
							</div>
							</form:form>
						</div>
					</div>
				</div>

			</section>



			<div style="padding-top: 30px;">
				<table id="example"
					class="table table-striped table-bordered dt-responsive nowrap"
					style="width: 100%">
					<thead>
						<tr>
							<th>Patient ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Purpose</th>
							<th>Status</th>
							<th>Date of Appointment</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="patientlist" items="${patientlist}">
							<tr>
								<td>${patientlist.id}</td>
								<td>${patientlist.name}</td>
								<td>${patientlist.phone}</td>
								<td>${patientlist.purpose}</td>
								<td>${patientlist.status}</td>
								<td>${patientlist.date}</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
			
			
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
	<script
		src="https://colorlib.com/etc/bootstrap-sidebar/sidebar-04/js/jquery.min.js"></script>
	<script
		src="https://colorlib.com/etc/bootstrap-sidebar/sidebar-04/js/popper.js"></script>
	<script
		src="https://colorlib.com/etc/bootstrap-sidebar/sidebar-04/js/bootstrap.min.js"></script>
	<script
		src="https://colorlib.com/etc/bootstrap-sidebar/sidebar-04/js/main.js"></script>
</body>
</html>