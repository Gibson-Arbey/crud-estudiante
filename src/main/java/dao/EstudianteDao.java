package dao;

import util.GenericDao;
import util.Conexion;
import entities.Estudiante;

public class EstudianteDao extends Conexion<Estudiante> implements GenericDao<Estudiante>{
	
	public EstudianteDao() {
		super(Estudiante.class);
	}
}
