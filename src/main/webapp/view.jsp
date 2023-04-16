<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Estudiante</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
	</head>
	<body>
		<nav class="navbar navbar-dark bg-dark">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/EstudianteList"> <img
				src="https://static.vecteezy.com/system/resources/previews/007/381/530/non_2x/student-icon-school-and-education-icon-vector.jpg"
				width="30" height="30" class="d-inline-block align-top" alt="">
				Estudiantes
			</a>
		</nav>
		<br>
		<h3 class="text-center">Estudiante más joven y viejo</h3>
		<br>
		<table class="table table-sm table-bordered "
			Style="text-align: center">
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
				</tr>
			</thead>
			<tbody>
				<c:set var="esMasJoven" value="${esMasJoven}" />
				<c:set var="esMasViejo" value="${esMasViejo}" />
				<tr>
					<td><c:out value="${esMasJoven.id}" /></td>
					<td><c:out value="${esMasJoven.nombre}" /></td>
					<td><c:out value="${esMasJoven.apellido}" /></td>
					<td><c:out value="${esMasJoven.edad}" /></td>
					<td><c:out value="${esMasJoven.nota1}" /></td>
					<td><c:out value="${esMasJoven.nota2}" /></td>
					<td><c:out value="${esMasJoven.nota3}" /></td>
					<td><fmt:formatNumber value="${esMasJoven.promedio}"
							maxFractionDigits="1" type="number" /></td>
					<td><c:out value="${esMasJoven.fecha_nacimiento}" /></td>
				</tr>
				<tr style="height: 1.5rem">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
	
				</tr>
				<tr>
					<td><c:out value="${esMasViejo.id}" /></td>
					<td><c:out value="${esMasViejo.nombre}" /></td>
					<td><c:out value="${esMasViejo.apellido}" /></td>
					<td><c:out value="${esMasViejo.edad}" /></td>
					<td><c:out value="${esMasViejo.nota1}" /></td>
					<td><c:out value="${esMasViejo.nota2}" /></td>
					<td><c:out value="${esMasViejo.nota3}" /></td>
					<td><fmt:formatNumber value="${esMasViejo.promedio}"
							maxFractionDigits="1" type="number" /></td>
					<td><c:out value="${esMasViejo.fecha_nacimiento}" /></td>
				</tr>
			</tbody>
		</table>
		<br>
	</body>
</html>