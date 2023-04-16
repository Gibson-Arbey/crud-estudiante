<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
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
		<div class="container col-md-5">
                <div class="card">
                    <div class="card-body">

                        <c:if test="${est != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${est == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${est != null}">
                                    Editar Estudiante
                                </c:if>
                                <c:if test="${est == null}">
                                    Agregar Nuevo estudiante
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${est != null}">
                            <input type="hidden" name="id" value="<c:out value='${est.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Nombre del estudiante</label> <input type="text" value="<c:out value='${est.nombre}' />" class="form-control" name="nombre" required="required">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Apellido del estudiante</label> <input type="text" value="<c:out value='${est.apellido}' />" class="form-control" name="apellido">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Nota 1 del estudiante</label> <input type="number"  min="0" max="5" step="0.1" title="Por favor ingrese un promedio válido" value="<c:out value='${est.nota1}' />" class="form-control" name="nota1">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Nota 2 del estudiante</label> <input type="number"  min="0" max="5" step="0.1" title="Por favor ingrese un promedio válido" value="<c:out value='${est.nota2}' />" class="form-control" name="nota2">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Nota 3 del estudiante</label> <input type="number"  min="0" max="5" step="0.1" title="Por favor ingrese un promedio válido" value="<c:out value='${est.nota3}' />" class="form-control" name="nota3">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Fecha de nacimiento del estudiante</label> <input type="date" value="<c:out value='${est.fecha_nacimiento}' />" class="form-control" name="fecha_nacimiento">
                        </fieldset>

                        <button type="submit" class="btn btn-success" style="background-color:#343a40; border:none">Guardar</button>
                        </form>
                    </div>
                </div>
            </div>
	</body>
</html>