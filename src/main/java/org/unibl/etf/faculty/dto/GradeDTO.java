package org.unibl.etf.faculty.dto;

import java.io.Serializable;
import java.util.Objects;

public class GradeDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3758115343524434856L;
	private Integer id;
    private Integer value;
    private Integer studentId;
    private Integer internshipId;
    private Integer facultyId;
	public GradeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeDTO(Integer id, Integer value, Integer studentId, Integer internshipId, Integer facultyId) {
		super();
		this.id = id;
		this.value = value;
		this.studentId = studentId;
		this.internshipId = internshipId;
		this.facultyId = facultyId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getInternshipId() {
		return internshipId;
	}
	public void setInternshipId(Integer internshipId) {
		this.internshipId = internshipId;
	}
	public Integer getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}
	@Override
	public int hashCode() {
		return Objects.hash(facultyId, id, internshipId, studentId, value);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GradeDTO other = (GradeDTO) obj;
		return Objects.equals(facultyId, other.facultyId) && Objects.equals(id, other.id)
				&& Objects.equals(internshipId, other.internshipId) && Objects.equals(studentId, other.studentId)
				&& Objects.equals(value, other.value);
	}
    
    
}
