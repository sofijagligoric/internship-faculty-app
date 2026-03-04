package org.unibl.etf.faculty.dto;

import java.io.Serializable;
import java.util.Objects;

public class CreateStudentDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4813468186945506200L;
    private String firstName;
    private String lastName;
    private String indeks;
    private String email;
    private Integer facultyId;
    private String username;
    private String password;
	public CreateStudentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CreateStudentDTO(String firstName, String lastName, String indeks, String email, Integer facultyId,
			String username, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.indeks = indeks;
		this.email = email;
		this.facultyId = facultyId;
		this.username = username;
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getIndeks() {
		return indeks;
	}
	public void setIndeks(String indeks) {
		this.indeks = indeks;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public int hashCode() {
		return Objects.hash(email, facultyId, firstName, indeks, lastName, password, username);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CreateStudentDTO other = (CreateStudentDTO) obj;
		return Objects.equals(email, other.email) && Objects.equals(facultyId, other.facultyId)
				&& Objects.equals(firstName, other.firstName) && Objects.equals(indeks, other.indeks)
				&& Objects.equals(lastName, other.lastName) && Objects.equals(password, other.password)
				&& Objects.equals(username, other.username);
	}
    
    
    
}
