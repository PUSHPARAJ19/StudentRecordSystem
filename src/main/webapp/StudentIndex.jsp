<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.Modal.Student"%>
<%@page import="com.Modal.Address"%>
<%@page import="com.DAO.StudentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SRP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<style>
</style>

</head>
<body>
	<%
	// System.out.println(session.getParameter("userId"));
	Student student = StudentDAO.displayInfo((String) session.getAttribute("userId"));
	Address student_address = student.getAddress();
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<a class="navbar-brand" href="">Student Record System</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link"
						href="StudentLogin.jsp">Log Out</a></li>
			</div>
		</div>
	</nav>
	<!--  Body -->

	<div class="profile container py-4">
		<div class="card ">
			<div class="row">
				<div class="col-4 text-center py-4">
					<h2>Welcome</h2>
				</div>
				<div class="col-8 py-4">
					<div class="row mb-3">
						<div class="col-sm-10">
							<table class="table">
								<tbody>
									<tr>
										<th scope="col">ROLL NO</th>
										<td>:</td>
										<td scope="col"><%=student.getStudent_id()%></td>
									</tr>
									<tr>
										<th scope="col">NAME</th>
										<td>:</td>
										<td scope="col">
											<%
											out.print(student.getFirstName() + " " + student.getLastName());
											%>
										</td>
									</tr>
									<tr>
										<th scope="col">DEGREE</th>
										<td>:</td>
										<td scope="col"><%=student.getDegree()%></td>
									</tr>
									<tr>
										<th scope="col">DEPARTMENT</th>
										<td>:</td>
										<td scope="col"><%=student.getDepartment()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--  opertaions -->
	<div class="container">
		<div class="a">
			<div class="row row-cols-2 row-cols-md-2 ">
				<div class="col">
					<div class="card">
						<button class="btn btn-primary" type="button" onclick="display()"
							data-bs-toggle="modal" data-bs-target="#viewDetail">
							<div class="card-body">
								<h5 class="card-title">VIEW DETAILS</h5>
							</div>
						</button>
					</div>
				</div>

				<div class="col">
					<div class="card">
						<button class="btn btn-primary" type="button" onclick="edit()"
							data-bs-toggle="modal" data-bs-target="#editDetail">
							<div class="card-body">
								<h5 class="card-title">UPDATE DETAILS</h5>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--  DISPLAYING Details -->
	<div class="viewdt container py-4" id="viewdt" style="display: none;">
		<div class="row">
			<div class="col-2"></div>
			<div class="card px-4" style="max-width: 50rem;">
				<div class="card-body">
					<h5 class="card-title text-center">YOUR INFO</h5>
					<table class="table">
						<tbody id="tableId">
							<tr>
								<th scope="col">ROLL NO</th>
								<th>:</th>
								<td scope="col"><%=student.getStudent_id()%></td>
							</tr>
							<tr>
								<th scope="col">FIRST NAME</th>
								<th>:</th>
								<td scope="col"><%=student.getFirstName()%></td>
							</tr>
							<tr>
								<th scope="col">LAST NAME</th>
								<th>:</th>
								<td scope="col"><%=student.getLastName()%></td>
							</tr>
							<tr>
								<th scope="col">GENDER</th>
								<th>:</th>
								<td scope="col"><%=student.getGender()%></td>
							</tr>
							<tr>
								<th scope="col">DOB</th>
								<th>:</th>
								<td scope="col"><%=student.getDob()%></td>
							</tr>
							<tr>
								<th scope="col">YEAR</th>
								<th>:</th>
								<td scope="col"><%=student.getYear()%></td>
							</tr>
							<tr>
								<th scope="col">DEGREE</th>
								<th>:</th>
								<td scope="col"><%=student.getDegree()%></td>
							</tr>
							<tr>
								<th scope="col">DEPARTMENT</th>
								<th>:</th>
								<td scope="col"><%=student.getDepartment()%></td>
							</tr>
							<tr>
								<th scope="col">EMAIL</th>
								<th>:</th>
								<td scope="col"><%=student.getEmail()%></td>
							</tr>
							<tr>
								<th scope="col">STREET</th>
								<th>:</th>
								<td scope="col"><%=student_address.getStreet()%></td>
							</tr>
							<tr>
								<th scope="col">CITY</th>
								<th>:</th>
								<td scope="col"><%=student_address.getCity()%></td>
							</tr>
							<tr>
								<th scope="col">DISTRICT</th>
								<th>:</th>
								<td scope="col"><%=student_address.getDistrict()%></td>
							</tr>
							<tr>
								<th scope="col">ZIP</th>
								<th>:</th>
								<td scope="col"><%=student_address.getPincode()%></td>
							</tr>
							<tr>
								<th scope="col">MOBILE NUMBER</th>
								<th>:</th>
								<td scope="col"><%=student.getMobileNumber()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--  Edit Details -->
	<div class="container py-4" id="editdt" style="display: none;">
		<div class="row">
			<div class="col-2"></div>
			<div class="card px-4" style="max-width: 50rem;">
				<div class="card-body">
					<h5 class="card-title text-center">YOUR INFO</h5>
					<form action="StudentServlet">
					<input type="hidden" id="formType" name="formType" style="display:none;" value="update">
						<table class="table">
							<tbody id="tableId">
								<tr>
									<th scope="col">ROLL NO</th>
									<th>:</th>
									<td scope="col"><input type="hidden" id="student_id" name="student_id" value="<%=student.getStudent_id()%>">
									<%=student.getStudent_id() %></td>
								</tr>
								<tr>
									<th scope="col">FIRST NAME</th>
									<th>:</th>
									<td scope="col"><input type="text" id="firstName"
										name="firstName" required value="<%=student.getFirstName()%>"></td>
								</tr>
								<tr>
									<th scope="col">LAST NAME</th>
									<th>:</th>
									<td scope="col"><input type="text" id="lastName"
										name="lastName" required value="<%=student.getLastName()%>"></td>
								</tr>
								<tr>
									<th scope="col">GENDER</th>
									<th>:</th>
									<td scope="col" id="G"><select id="gender" name="gender"
										required>
											<option value="<%=student.getGender()%>"><%=student.getGender()%></option>
											<option value="Male">Male</option>
											<option value="Female">Female</option>
											<option value="Other">Other</option>
									</select></td>
								</tr>
								<tr>
									<th scope="col">DOB</th>
									<th>:</th>
									<td scope="col"><input type="date" id="dob" name="dob"
										required value="<%=student.getDob()%>"></td>
								</tr>
								<tr>
									<th scope="col">YEAR</th>
									<th>:</th>
									<td scope="col"><select id="year" name="year" required>
											<option value="<%=student.getYear()%>"><%=student.getYear()%></option>
											<option value="I">I</option>
											<option value="II">II</option>
											<option value="III">III</option>
											<option value="IV">IV</option>
									</select></td>
								</tr>
								<tr>
									<th scope="col">DEGREE</th>
									<th>:</th>
									<td scope="col"><select id="degree" name="degree" required>
											<option value="<%=student.getDegree()%>"><%=student.getDegree()%></option>
											<option value="BE">BE</option>
											<option value="BTech">BTech</option>
									</select></td>
								</tr>
								<tr>
									<th scope="col">DEPARTMENT</th>
									<th>:</th>
									<td scope="col"><select id="department" name="department"
										required>
											<option value="<%=student.getDepartment()%>"><%=student.getDepartment()%></option>
											<option value="CSE">CSE</option>
											<option value="CS">CS</option>
											<option value="CST">CST</option>
											<option value="IT">IT</option>
											<option value="ECE">ECE</option>
											<option value="EEE">EEE</option>
											<option value="MECH">MECH</option>
									</select></td>
								</tr>
								<tr>
									<th scope="col">EMAIL</th>
									<th>:</th>
									<td scope="col"><input type="email" id="email"
										name="email" required value="<%=student.getEmail()%>"></td>
								</tr>
								<input type="hidden" id="address_id" name="address_id" style="display:none;" value="<%=student_address.getAddress_id()%>">
								<tr>
									<th scope="col">STREET</th>
									<th>:</th>
									<td scope="col">
									<input type="text" id="street" name="street" required value="<%=student_address.getStreet()%>"></td>
								</tr>
								<tr>
									<th scope="col">CITY</th>
									<th>:</th>
									<td scope="col">
									<input type="text" id="city" name="city" value="<%=student_address.getCity()%>"></td>
								</tr>
								<tr>
									<th scope="col">DISTRICT</th>
									<th>:</th>
									<td scope="col">
									<input type="text" id="district" name="district" value="<%=student_address.getDistrict()%>"></td>
								</tr>
								<tr>
									<th scope="col">ZIP</th>
									<th>:</th>
									<td scope="col">
									<input type="text" id="zip" name="zip" 	required value="<%=student_address.getPincode()%>"></td>
								</tr>
								<tr>
									<th scope="col">MOBILE NUMBER</th>
									<th>:</th>
									<td scope="col">
									<input type="tel" id="mobileNumber" name="mobileNumber" required value="<%=student.getMobileNumber()%>"></td>
								</tr>
							</tbody>
						</table>
						<button type="submit">UPDATE</button> 
					</form>
				</div>
			</div>
		</div>
</div>

	<script>
		function display() {
			document.getElementById("viewdt").style.display = "block";
			document.getElementById("editdt").style.display = "none";
		}
		function edit() {
			document.getElementById("viewdt").style.display = "none";
			document.getElementById("editdt").style.display = "block";
		}
	</script>
</body>
</html>