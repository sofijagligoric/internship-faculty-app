package org.unibl.etf.faculty.dto;

import java.io.Serializable;
import java.util.Objects;

public class CreateCompanyDTO implements Serializable {

	    /**
	 * 
	 */
	private static final long serialVersionUID = 6850924995585969598L;
		private String username;
	    private String password;
	    private String name;
	    private String email;
	    private Boolean active;
	    private String address;
		public CreateCompanyDTO(String username, String password, String name, String email, Boolean active,
				String address) {
			super();
			this.username = username;
			this.password = password;
			this.name = name;
			this.email = email;
			this.active = active;
			this.address = address;
		}
		public CreateCompanyDTO() {
			super();
			// TODO Auto-generated constructor stub
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Boolean getActive() {
			return active;
		}
		public void setActive(Boolean active) {
			this.active = active;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		@Override
		public int hashCode() {
			return Objects.hash(email, name, password, username);
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			CreateCompanyDTO other = (CreateCompanyDTO) obj;
			return Objects.equals(email, other.email) && Objects.equals(name, other.name)
					&& Objects.equals(password, other.password) && Objects.equals(username, other.username);
		}
	    
	    
}
