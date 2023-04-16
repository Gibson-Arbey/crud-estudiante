<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Estudiante</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
					integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<nav class="navbar navbar-dark bg-dark">
			  <a class="navbar-brand" href="<%=request.getContextPath()%>/EstudianteList">
			    <img src="https://static.vecteezy.com/system/resources/previews/007/381/530/non_2x/student-icon-school-and-education-icon-vector.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
			    Estudiantes
			  </a>
		</nav>
		<br>
		<div class="row">
	                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
	
	                <div class="container">
	                    <h3 class="text-center">Listado de Estudiantes</h3>
	                    <hr>
	                    <div class="container text-left">
							
	                        <a href="<%=request.getContextPath()%>/Nuevo_estudiante" class="btn btn-success" style="background-color:#343a40; border:none">Inscribir estudiante</a>
	                    </div>
	                    <br>
	                    <table class="table table-sm table-bordered " Style="text-align:center" >
	                        <thead>
	                            <tr>
	                                <th>Id</th>
	                                <th>Nombre</th>
	                                <th>Apellido</th>
	                                <th>Edad</th>
	                                <th>Nota 1</th>
	                                <th>Nota 2</th>
	                                <th>Nota 3</th>
	                                <th>Promedio</th>
	                                <th>Fecha de nacimiento</th>
	                                <th>Acciones</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <!--   for (Todo todo: todos) {  -->
	                            <c:forEach var="est" items="${listEstudiantes}">
	
	                                <tr>
	                                    <td>
	                                        <c:out value="${est.id}" />
	                                    </td>
	                                    <td>
	                                       <c:out value="${est.nombre}" />
	                                    </td>
	                                    <td>
	                                        <c:out value="${est.apellido}" />
	                                    </td>
	                                    <td>
	                                        <c:out value="${est.edad}" />
	                                    </td>
	                                    <td>
	                                       <c:out value="${est.nota1}" />
	                                    </td>
	                                    <td>
	                                       <c:out value="${est.nota2}" />
	                                    </td>
	                                    <td>
	                                       <c:out value="${est.nota3}" />
	                                    </td>
	                                    <td>
	                                   		<fmt:formatNumber value = "${est.promedio}" maxFractionDigits="1"   type = "number"/>
	                                    </td>
	                                    <td>
	                                        <c:out value="${est.fecha_nacimiento}" />
	                                    </td>
	                                    <td><a href="edit?id=<c:out value='${est.id}' />" style="color:#343a40; text-decoration:underline">Editar</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${est.id}' />" style="color:#343a40; text-decoration:underline">Eliminar</a></td>
	                                </tr>
	                            </c:forEach>
		                	</tbody>
		    	        </table>
		    	        <br>
		    	        <c:set var="esMasJoven" value="${esMasJoven}"/>
		    	        <c:set var="esMasViejo" value="${esMasViejo}"/>
		    	        <ul>
							  <li>Codigo del estudiante más joven: ${esMasJoven}</li>
							  <li>Codigo del estudiante más viejo: ${esMasViejo}</li>  
						</ul>
		        	</div>
		    </div>
	</body>
</html>