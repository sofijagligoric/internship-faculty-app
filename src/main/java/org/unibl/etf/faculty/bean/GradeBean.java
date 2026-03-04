package org.unibl.etf.faculty.bean;

import java.io.Serializable;

import org.unibl.etf.faculty.dto.GradeDTO;
import org.unibl.etf.faculty.service.BackendService;

public class GradeBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2315755657175020413L;
	
	public GradeDTO getStudentGrade(Integer studentId) {
        return BackendService.get("/grade/student/"  +studentId, GradeDTO.class);
    }
	
	 public boolean createGrade(GradeDTO dto) {
		 GradeDTO result = BackendService.post("/grade", dto, GradeDTO.class);
	        if (result != null) {
	            return true;
	        }
	        return false;
	    }

	 
	 public boolean deleteGrade(Integer id) {
	        boolean deleted = BackendService.delete("/grade/" + id);
	        return deleted;
	    }

}
