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
				<li class="active"><a href="${pageContext.request.contextPath}/"><span
						class="fa fa-home mr-3"></span> Homepage</a></li>
				
				<security:authorize access="hasRole('ROLE_DOCTOR')">  
				<li><a href="${pageContext.request.contextPath}/appointments"><span class="fa fa-book mr-3"></span>
						Appointments</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_PATIENT')">  
				<li><a href="${pageContext.request.contextPath}/bookappointment"><span class="fa fa-book mr-3"></span>
						Book Appointment</a></li>
				</security:authorize>
				<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR')">  
				<li><a href="${pageContext.request.contextPath}/patientslist"><span
						class="fa fa-wheelchair mr-3"></span> Patients</a></li>
				</security:authorize>
				<security:authorize access="hasRole('DOCTOR')">  
				<li><a href="${pageContext.request.contextPath}/patientstatus"><span class="fa fa-check mr-3"></span>
						Patient Status</a></li>
				</security:authorize>
				<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR','ROLE_LADMIN')">  
				<li><a href="${pageContext.request.contextPath}/labreports"><span class="fa fa-sticky-note mr-3"></span>
						Lab Reports</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')"> 
				<li><a href="${pageContext.request.contextPath}/doctorlist"><span class=" fa fa-user-md mr-3"></span>
						Doctor List</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')"> 
				<li><a href="${pageContext.request.contextPath}/noofappointments"><span class="fa fa-paper-plane mr-3"></span>
						All Appointments</a></li>
				</security:authorize>
				 
				
				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<li>
					<div style="padding-top:0px;" >
					<input type="submit" value="logout" style="padding-left:70px;padding-right:125px;background-color:black;color:white;height:50px;"></div>
					</li>
				</form:form>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<h2 class="mb-4">Appointments</h2>
			
			User: <security:authentication property="principal.username" />
			<br>
			Role(s): <security:authentication property="principal.authorities" />
			
			<section>
				<div style="padding-top: 30px;">
				<table id="example"
					class="table table-striped table-bordered dt-responsive nowrap"
					style="width: 100%">
					<thead>
						<tr>
							<th>UNIQUE ID</th>
							<th>Category</th>
							<th>Purpose</th>
							<th>Date</th>
							<th>Slot</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="appointments" items="${appointments}">
							<tr>
								<td>${appointments.uniqueid}</td>
								<td>${appointments.category}</td>
								<td>${appointments.purpose}</td>
								<td>${appointments.date}</td>
								<td>${appointments.slot}</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
			
				
			
			</section>
		
		
		
		</div>
	</div>
	
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