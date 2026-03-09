package org.unibl.etf.faculty.bean;

import java.io.Serializable;
import java.util.List;

import org.unibl.etf.faculty.dto.InternshipDTO;
import org.unibl.etf.faculty.service.BackendService;

public class InternshipBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4360911112329452208L;

	public List<InternshipDTO> getAllInternships() {
		return BackendService.getList("/internship/all", InternshipDTO[].class);
	}
	
}
