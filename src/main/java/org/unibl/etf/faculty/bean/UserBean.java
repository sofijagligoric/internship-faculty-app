package org.unibl.etf.faculty.bean;

import java.io.Serializable;

import org.unibl.etf.faculty.dto.LoginRequest;
import org.unibl.etf.faculty.dto.LoginResponse;
import org.unibl.etf.faculty.dto.UserDTO;
import org.unibl.etf.faculty.service.BackendService;
import org.unibl.etf.faculty.util.Role;


public class UserBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5490143972602523742L;
	private UserDTO user = new UserDTO();
	private boolean isLoggedIn = false;
	public UserDTO getUser() {
		return user;
	}
	public boolean isLoggedIn() {
		return isLoggedIn;
	}
	
	public boolean login(String username, String password) {
	    try {
	        LoginResponse res = BackendService.post("/auth/login", new LoginRequest(username, password), LoginResponse.class);
	        if (res != null && res.getRole()!=null && res.getRole()==Role.FACULTY) {
            this.user = new UserDTO(res.getUserId(), username, res.getRole());
		            this.isLoggedIn = true;
		            return true;
	        	
	        }

	    } catch (Exception e) {
	        System.err.println("Login failed: " + e.getMessage());
	    }
	    return false;
	}
	
	public void logout() {
	    this.user = new UserDTO();
	    this.isLoggedIn = false;
	}
}
