package org.unibl.etf.faculty.bean;

import java.io.Serializable;
import java.util.List;

import org.unibl.etf.faculty.dto.CompanyDTO;
import org.unibl.etf.faculty.dto.CreateCompanyDTO;
import org.unibl.etf.faculty.service.BackendService;


public class CompanyBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2073090433052079878L;

	public List<CompanyDTO> getAllCompanies() {
		return BackendService.getList("/company", CompanyDTO[].class);
	}
	
	public CompanyDTO getCompanyById(Integer companyId) {
		return BackendService.get("/company/" + companyId, CompanyDTO.class);
	}
	
	public boolean createCompany(CreateCompanyDTO dto) {
		CompanyDTO result = BackendService.post("/company", dto, CompanyDTO.class);
		if (result != null) {
			return true;
		}
		return false;
	}

	public boolean changeStatus(Integer id) {
			return BackendService.put("/company/" + id + "/status", null);
	}
}
