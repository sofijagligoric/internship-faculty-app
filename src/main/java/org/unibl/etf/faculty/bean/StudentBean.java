package org.unibl.etf.faculty.bean;

import java.io.InputStream;
import java.io.Serializable;
import java.util.List;

import org.unibl.etf.faculty.dto.StudentDTO;
import org.unibl.etf.faculty.dto.WorkentryDTO;
import org.unibl.etf.faculty.dto.CreateStudentDTO;
import org.unibl.etf.faculty.dto.EvaluationDTO;
import org.unibl.etf.faculty.service.BackendService;

public class StudentBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8829738796176715362L;
	public List<StudentDTO> getAllStudentsForFaculty(Integer facultyId) {
		return BackendService.getList("/student/faculty/" + facultyId, StudentDTO[].class);
	}
	
	public StudentDTO getStudentById(Integer studentId) {
		return BackendService.get("/student/" + studentId, StudentDTO.class);
	}
	
	public CreateStudentDTO getCompleteStudentById(Integer studentId) {
		return BackendService.get("/student/complete/" + studentId, CreateStudentDTO.class);
	}
	
	
	public boolean createStudent(CreateStudentDTO dto) {
		StudentDTO result = BackendService.post("/student", dto, StudentDTO.class);
		if (result != null) {
			return true;
		}
		return false;
	}
	
	public boolean deleteStudent(Integer id) {
		return BackendService.delete("/student/" + id);
	}
	
	public List<WorkentryDTO> getAllWorkentriesForStudent(Integer id) {
		return BackendService.getList("/workentry/student/" + id + "/all", WorkentryDTO[].class);
	}
	
	public List<EvaluationDTO> getAllEvaluationsForStudent(Integer id) {
		return BackendService.getList("/evaluation/student/" + id + "/all", EvaluationDTO[].class);
	}
	
	public boolean updateStudent(Integer id, CreateStudentDTO dto) {
		return BackendService.put("/student/" + id, dto); 
	}

	public boolean uploadStudentsCsv(InputStream fileStream, Integer id) {

		return BackendService.uploadCsv(fileStream, "/student/csvUpload/" + id);
	}

}
