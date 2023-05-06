<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="com.Modal.Admin" %>
<%@page import ="com.DAO.AdminDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SRS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/dist/*.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
	color: black;



	
}
</style>
</head>

<body>
<%  Admin admin = AdminDAO.getAdminDetails((String)session.getAttribute("adminId"));
  %>
	
	<ul class="nav justify-content-end bg-primary">
		<li class="nav-item">
			<button type="button" class="btn btn-primary" aria-current="page"
				data-bs-toggle="modal" data-bs-target="#adminProfile">Profile</button>
		</li>
		<li class="nav-item">
			<button type="button" class="btn btn-primary" aria-current="page"
				data-bs-toggle="modal" data-bs-target="#addAdmin">ADD ADMIN</button>
		</li>
		<li class="nav-item"><a class="nav-link text-white"
			href="adminLogin.html">Log out</a></li>
	</ul>
	<!--  Profile MODAL -->
	
<div class="modal fade" id="adminProfile" tabindex="-1" aria-labelledby="adminProfileLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="adminProfileLabel">Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">Admin ID</label>
    <div class="col-sm-6">
     <%=admin.getAdminId() %>
    </div>
  </div>
  
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">NAME</label>
    <div class="col-sm-6">
     <%out.print(admin.getFirstName()+" "+admin.getLastName());%>
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">DOB</label>
    <div class="col-sm-6">
     <%=admin.getDOB() %>
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">EMAIL</label>
    <div class="col-sm-6">
     <%=admin.getEmail() %>
    </div>
  </div>

   <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">YEAR OF JOINING:</label>
    <div class="col-sm-6">
     <%=admin.getYear() %>
    </div>
  </div>

</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <!--   <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
	<!--  ADmin ADD MODAL -->
	<div class="modal fade" id="addAdmin" tabindex="-1"
		aria-labelledby="addAdminLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addAdminLabel">Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AdminServlet">
						<input type="hidden" id="formType" name="formType"
							value="addAdmin" style="display: none;">
						<div class="row mb-3">
							<label class="col-sm-4 col-form-label">FIRST NAME:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="firstName" name="firstName">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-4 col-form-label">LAST NAME:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="lastName" name="lastName">
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-sm-4 col-form-label">DOB:</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" id="DOB" name="DOB">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-4 col-form-label">EMAIL:</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="Email" name="Email">
							</div>
						</div>
						
						<div class="row mb-3">
							<label class="col-sm-4 col-form-label">YEAR OF JOINING:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="YearOfJoining"
									name="YearOfJoining">
							</div>
						</div>

						<button type="submit" class="btn btn-primary">ADD</button>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<!--   <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>


	<!--  Select User Type -->
	<div class="container">

		<div class="position-absolute top-50 start-50 translate-middle">

			<div class="row row-cols-2 row-cols-md-2 ">


				<div class="col">
					<div class="card" style="width: 10rem">
						<!-- <img src="menu-item-2.jpg" class="card-img-top" alt="..."> -->
						<a href="adminFaculty.jsp">
							<div class="card-body text-center">
								<h5 class="card-title">Faculty</h5>
							</div>
					</div>
					</a>
				</div>

				<div class="col">
					<div class="card" style="width: 10rem">
						<a href="adminStudent.jsp"> <!-- <img src="menu-item-2.jpg" class="card-img-top" alt="..."> -->
							<div class="card-body text-center">
								<h5 class="card-title">Student</h5>
							</div>
					</div>
					</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
