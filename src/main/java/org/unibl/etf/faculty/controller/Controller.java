package org.unibl.etf.faculty.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.unibl.etf.faculty.bean.CompanyBean;
import org.unibl.etf.faculty.bean.InternshipBean;
import org.unibl.etf.faculty.bean.StudentBean;
import org.unibl.etf.faculty.bean.UserBean;
import org.unibl.etf.faculty.dto.CreateCompanyDTO;
import org.unibl.etf.faculty.dto.CreateStudentDTO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String address = "/WEB-INF/pages/login.jsp";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		session.setAttribute("notification", "");
		session.setAttribute("successStatus", "error");

		if (action == null || action.equals("")) {
			address = "/WEB-INF/pages/login.jsp";
		} else if (action.equals("logout")) {
			session.invalidate();
			address = "/WEB-INF/pages/login.jsp";
		} else if (action.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			UserBean userBean = new UserBean();
			if (userBean.login(username, password)) {
				session.setAttribute("userBean", userBean);
				CompanyBean companyBean = new CompanyBean();
				session.setAttribute("companyBean", companyBean);
				InternshipBean internshipBean = new InternshipBean();
				session.setAttribute("internshipBean", internshipBean);
				StudentBean studentBean = new StudentBean();
				session.setAttribute("studentBean", studentBean);
				address = "/WEB-INF/pages/companies.jsp";
			} else {
				session.setAttribute("notification", "Wrong username or password.");
			}
		} else {
			UserBean userBean = (UserBean) session.getAttribute("userBean");
			if (userBean == null || !userBean.isLoggedIn()) {
				address = "/WEB-INF/pages/login.jsp";
			} else {
				if (action.equals("companies")) {
					address = "/WEB-INF/pages/companies.jsp";
				}else if (action.equals("internships")) {
					address = "/WEB-INF/pages/internships.jsp";
				}  
				else if (action.equals("students")) {
					address = "/WEB-INF/pages/students.jsp";
				} 
				else if (action.equals("studentWorkentries")) {
				    if (request.getParameter("studentId") == null) {
				        address = "/WEB-INF/pages/students.jsp";
				    } else {
				        address = "/WEB-INF/pages/student_workentries.jsp";
				    }
				}
				else if (action.equals("studentEvaluations")) {
				    if (request.getParameter("studentId") == null) {
				        address = "/WEB-INF/pages/students.jsp";
				    } else {
				        address = "/WEB-INF/pages/student_evaluations.jsp";
				    }
				}
				else if (action.equals("studentGrade")) {
				    if (request.getParameter("studentId") == null) {
				        address = "/WEB-INF/pages/students.jsp";
				    } else {
				        address = "/WEB-INF/pages/student_grade.jsp";
				    }
				}
				else if (action.equals("studentsMonitoring")) {
					address = "/WEB-INF/pages/student_monitoring.jsp";
				} 
				else if (action.equals("deleteStudent")) {
					address = "/WEB-INF/pages/students.jsp";
				    StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
				    if (request.getParameter("studentId") != null && studentBean != null) {
				    	Integer sId = Integer.parseInt(request.getParameter("studentId"));
				        if (studentBean.deleteStudent(sId)) {
				            session.setAttribute("notification", "Student successfully deleted.");
				            session.setAttribute("successStatus", "success");
				        } else {
				            session.setAttribute("notification", "Error: Student could not be deleted.");
				            session.setAttribute("successStatus", "error");
				        }
				    }
				  //  response.sendRedirect("Controller?action=students");
				   // return;
				} 
				else if (action.equals("updateStudent")) {
					address = "/WEB-INF/pages/students.jsp";
				} else if (action.equals("createStudent")) {
					address = "/WEB-INF/pages/create_student.jsp";
					StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
					if (request.getParameter("submit") != null && request.getParameter("firstName") != null && request.getParameter("lastName") != null
							&& request.getParameter("indeks") != null && request.getParameter("email") != null
							&& request.getParameter("usernameS") != null && request.getParameter("passwordS") != null) {
						try {
							CreateStudentDTO student = new CreateStudentDTO(request.getParameter("firstName"), request.getParameter("lastName"),
									request.getParameter("indeks"), request.getParameter("email"), userBean.getUser().getId(),
									request.getParameter("usernameS"), request.getParameter("passwordS"));
							if (studentBean.createStudent(student)) {
							//	address = "/WEB-INF/pages/students.jsp";
								session.setAttribute("notification", "Student created.");
								session.setAttribute("successStatus", "success");
								response.sendRedirect("Controller?action=students");
								return;
							}
						} catch (Exception e) {
							session.setAttribute("notification", "ERROR: " + e.getMessage());
							session.setAttribute("successStatus", "error");
						}
					}
				} 
				else if (action.equals("createCompany")) {
					address = "/WEB-INF/pages/create_company.jsp";
					CompanyBean companyBean = (CompanyBean) session.getAttribute("companyBean");
					if (request.getParameter("submit") != null && request.getParameter("name") != null
							&& request.getParameter("address") != null && request.getParameter("email") != null
							&& request.getParameter("usernameC") != null && request.getParameter("passwordC") != null) {
						try {
							boolean active = Boolean.parseBoolean(request.getParameter("isActive"));
							CreateCompanyDTO comp = new CreateCompanyDTO(request.getParameter("passwordC"),
									request.getParameter("usernameC"), request.getParameter("name"),
									request.getParameter("email"), active, request.getParameter("address"));
							if (companyBean.createCompany(comp)) {
								address = "/WEB-INF/pages/companies.jsp";
								session.setAttribute("notification", "Company created.");
								session.setAttribute("successStatus", "success");
							//	response.sendRedirect("Controller?action=companies");
							//	return;
							}
						} catch (Exception e) {
							session.setAttribute("notification", "ERROR: " + e.getMessage());
							session.setAttribute("successStatus", "error");
						}
					}
				} else if (action.equals("changeStatus")) {
					CompanyBean companyBean = (CompanyBean) session.getAttribute("companyBean");
					if (request.getParameter("compId") != null) {
						try {
							Integer companyId = Integer.parseInt(request.getParameter("compId"));
							if (companyBean.changeStatus(companyId)) {
								session.setAttribute("notification", "Status changed.");
								session.setAttribute("successStatus", "success");
							} else {
								session.setAttribute("notification", "Unable to change status.");
								session.setAttribute("successStatus", "error");
							}
						} catch (NumberFormatException e) {
							session.setAttribute("notification", "Invalid company ID.");
							session.setAttribute("successStatus", "error");
						}
					} else {
						session.setAttribute("notification", "Company unknown.");
						session.setAttribute("successStatus", "error");
					}
					address = "/WEB-INF/pages/companies.jsp";

				} else {
					address = "/WEB-INF/pages/404.jsp";
				}
			}

		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
