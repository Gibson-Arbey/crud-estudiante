package entities;



import java.time.LocalDate;
import java.time.Period;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@NamedQuery(name = "Estudiante.findAll" , query = "SELECT e FROM Estudiante e")
//@NamedQuery(name = "Estudiante.prom" , query = "SELECT e, ((e.nota1 + e.nota2 + e.nota3) / 3) AS Promedio FROM Estudiante ee") 
public class Estudiante {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String nombre;
	
	private String apellido;
	
	private float nota1;
	
	private float nota2;
	
	private float nota3;
	
	@Transient
	private float promedio;
	
	@Transient
	private int edad;
	
	@Temporal(TemporalType.DATE)
	private LocalDate fecha_nacimiento;
	
	public Estudiante(String nombre, String apellido, float nota1, float nota2, float nota3, LocalDate fecha_nacimiento) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.nota1 = nota1;
		this.nota2 = nota2;
		this.nota3 = nota3;
		this.fecha_nacimiento = fecha_nacimiento;
	}
	
	public float setPromedio() {
		return this.promedio = (this.nota1+this.nota2+this.nota3)/3;
	}
	
	public int setEdad() {
		LocalDate fechaActual = LocalDate.now();
		Period periodo = Period.between(this.fecha_nacimiento, fechaActual);
		return this.edad = periodo.getYears();
	}
}
