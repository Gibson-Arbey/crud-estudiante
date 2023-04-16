package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EstudianteDao;
import entities.Estudiante;

/**
 * Servlet implementation class EstudianteServlet
 */
@WebServlet("/")
public class EstudianteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private EstudianteDao eDao;
	DateTimeFormatter format; 
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EstudianteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
    	this.format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.eDao = new EstudianteDao(); 
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		try {
			switch(action) {
			case"/Nuevo_estudiante": showPage(request, response, "nuevoEstudiante.jsp");
				break;
			case"/delete": eliminarEstudiante(request, response);
				break;
			case"/edit": showEditForm(request, response);
				break;
			case"/insert": insertarEstudiante(request, response);
				break;
			case"/update": actualizarEstudiante(request, response);
				break;
			default:	listEstudiantes(request, response);
				break;
			}
		}catch(SQLException e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void showPage(HttpServletRequest request, HttpServletResponse response, String pag) 
			throws ServletException, IOException {
		 request.getRequestDispatcher(pag).forward(request, response);
	}
	
	private void  showEditForm(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Estudiante e = eDao.find(id);
		request.setAttribute("est", e);
		request.getRequestDispatcher("nuevoEstudiante.jsp").forward(request, response);
		
	}
	
	private void actualizarEstudiante(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		float nota1 = Float.parseFloat(request.getParameter("nota1"));
		float nota2 = Float.parseFloat(request.getParameter("nota2"));
		float nota3 = Float.parseFloat(request.getParameter("nota3"));
		String fecha_nacimiento = request.getParameter("fecha_nacimiento");
		LocalDate fecha = LocalDate.parse(fecha_nacimiento, format);
		
		Estudiante e = new Estudiante();
		e = eDao.find(id);
		e.setNombre(nombre);
		e.setApellido(apellido);
		e.setNota1(nota1);
		e.setNota2(nota2);
		e.setNota3(nota3);
		e.setFecha_nacimiento(fecha);
		eDao.update(e);
		response.sendRedirect("EstudianteList");
	}
	private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		float nota1 = Float.parseFloat(request.getParameter("nota1"));
		float nota2 = Float.parseFloat(request.getParameter("nota2"));
		float nota3 = Float.parseFloat(request.getParameter("nota3"));
		String fecha_nacimiento = request.getParameter("fecha_nacimiento");
		System.out.println(fecha_nacimiento);
		LocalDate fecha = LocalDate.parse(fecha_nacimiento, format);
		eDao.insert(new Estudiante(nombre, apellido, nota1, nota2, nota3, fecha));
		response.sendRedirect("EstudianteList");		
	}
	
	
	private void  eliminarEstudiante(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Estudiante e = eDao.find(id);
		eDao.delete(e);
		response.sendRedirect("EstudianteList");
	}
	
	private void listEstudiantes(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, SQLException, IOException {
		List<Estudiante> listEst = new ArrayList<>();
		listEst = eDao.list(); 
		Estudiante esMasJoven = new Estudiante();
		esMasJoven.setFecha_nacimiento(LocalDate.of(1, 12, 31));
		Estudiante esMasViejo = new Estudiante();
		esMasViejo.setFecha_nacimiento(LocalDate.of(9999, 12, 31));
		for(Estudiante es: listEst) {
			es.setPromedio();
			es.setEdad();
			if (es.getFecha_nacimiento().isAfter(esMasJoven.getFecha_nacimiento())) {
				esMasJoven = es;
            }
			if (es.getFecha_nacimiento().isBefore(esMasViejo.getFecha_nacimiento())) {
				esMasViejo = es;
            }
		}
		request.setAttribute("esMasJoven", esMasJoven.getId());
		request.setAttribute("esMasViejo", esMasViejo.getId());
		request.setAttribute("listEstudiantes", listEst);
		showPage(request, response,"index.jsp");
	}
	
}
