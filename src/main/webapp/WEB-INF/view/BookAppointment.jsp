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
				<security:authorize
					access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR','ROLE_LADMIN')">
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
			<h2 class="mb-4">Book Appointment</h2>

			User:
			<security:authentication property="principal.username" />
			<br> Role(s):
			<security:authentication property="principal.authorities" />


			<section>
				<form:form action="saveappointment" modelAttribute="bookappointment"
					mothod="POST">
					<div class="modal-body">


						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Unique ID</label>
								<form:input class="form-control" style="border: 1px solid"
									path="uniqueid" placeholder="Name" />
							</div>
							<div class="form-group col-md-6">
								<label>Category</label>
								<form:select class="form-control" path="category"
									placeholder="Select Category " style="border: 1px solid">

									<form:option value="Primary Care"></form:option>
									<form:option value="Speciality Care"></form:option>
									<form:option value="Emergency Care"></form:option>
									<form:option value="Urgent Care"></form:option>
									<form:option value="Long-Term Care"></form:option>
									<form:option value="Hospice Care"></form:option>
									<form:option value="Mental Health Care"></form:option>


								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">Purpose</label>
							<form:input type="textarea" class="form-control" path="purpose"
								placeholder="Purpose" style="border: 1px solid" />
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputCity">Date</label>
								<form:input type="text" class="form-control"
									placeholder="DD-MM-YYYY" path="date" style="border: 1px solid" />
							</div>
							<div class="form-group col-md-6">
								<label for="inputState">Slot</label>
								<form:select class="form-control" placeholder="slot" path="slot"
									style="border: 1px solid">
									<form:option value="8:00 AM"></form:option>
									<form:option value="10:00 AM"></form:option>
									<form:option value="12:00 PM"></form:option>
									<form:option value="14:00 PM"></form:option>
									<form:option value="16:00 PM"></form:option>
									<form:option value="18:00 PM"></form:option>
									<form:option value="20:00 PM"></form:option>
								</form:select>
							</div>

						</div>
						<div align="center" style="padding-top:5%;">
						<button type="submit" value="save" class="btn btn-primary" >Confirm Appointment</button></div>
					</div>
				</form:form>





			</section>









		</div>
	</div>
	<script>
		$('.datepicker').datepicker({
			format : 'mm/dd/yyyy',
			startDate : '-3d'
		});
	</script>
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