<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head> 
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Faculty Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
            crossorigin="anonymous"></script>
    </head>
<body>
 <ul class="nav text-white bg-primary">
    <li class="navbar ">STUDENT RECORD SYSTEM</li>
    <li class="nav-item">
    <a href="index.html" class="nav-link text-white">Back</a>  
    </li>
    </ul>

        <div class="vh-100 d-flex justify-content-center align-items-center ">
            <div class="col-md-5 p-5 shadow-sm border rounded-5 border-primary bg-white">
                <h2 class="text-center mb-4 text-primary">Login</h2>
                <form action="AdminServlet1">
                   <input type="hidden" id="formName" name="formName" value="login" style="display:none;">
                    <div class="mb-3">
                        <label for="userId" class="form-label">User ID</label>
                        <input type="text" class="form-control border border-primary"  name="userId" id="userId" >
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control border border-primary"  name="password" id="password">
                    </div>
                     <div class="d-grid">
                        <button class="btn btn-primary" type="submit">Login</button>
                     <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="FacultyRegister.html"
			  class="link-danger">Register</a></p>
                    </div>
                </form>
            </div>
        </div>

</body>
</html>