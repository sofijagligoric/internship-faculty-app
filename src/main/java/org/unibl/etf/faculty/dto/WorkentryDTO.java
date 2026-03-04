package org.unibl.etf.faculty.dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;


public class WorkentryDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1115263753017795739L;
	private Integer id;
    private String activity;
    private LocalDate weekStart;
    private Integer internshipId;
    private Integer studentId;
    private String studentFirstName;
    private String studentLastName;
    private String internshipName;
		public WorkentryDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public WorkentryDTO(Integer id, String activity, LocalDate weekStart, Integer internshipId, Integer studentId,
				String studentFirstName, String studentLastName, String internshipName) {
			super();
			this.id = id;
			this.activity = activity;
			this.weekStart = weekStart;
			this.internshipId = internshipId;
			this.studentId = studentId;
			this.studentFirstName = studentFirstName;
			this.studentLastName = studentLastName;
			this.internshipName = internshipName;
		}

		public String getStudentFirstName() {
			return studentFirstName;
		}

		public void setStudentFirstName(String studentFirstName) {
			this.studentFirstName = studentFirstName;
		}

		public String getStudentLastName() {
			return studentLastName;
		}

		public void setStudentLastName(String studentLastName) {
			this.studentLastName = studentLastName;
		}

		public String getInternshipName() {
			return internshipName;
		}

		public void setInternshipName(String internshipName) {
			this.internshipName = internshipName;
		}

		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getActivity() {
			return activity;
		}
		public void setActivity(String activity) {
			this.activity = activity;
		}
		public LocalDate getWeekStart() {
			return weekStart;
		}
		public void setWeekStart(LocalDate weekStart) {
			this.weekStart = weekStart;
		}
		public Integer getInternshipId() {
			return internshipId;
		}
		public void setInternshipId(Integer internshipId) {
			this.internshipId = internshipId;
		}
		public Integer getStudentId() {
			return studentId;
		}
		public void setStudentId(Integer studentId) {
			this.studentId = studentId;
		}
		@Override
		public int hashCode() {
			return Objects.hash(id, internshipId, studentId, weekStart);
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			WorkentryDTO other = (WorkentryDTO) obj;
			return Objects.equals(id, other.id) && Objects.equals(internshipId, other.internshipId)
					&& Objects.equals(studentId, other.studentId) && Objects.equals(weekStart, other.weekStart);
		}
	    
	    
}