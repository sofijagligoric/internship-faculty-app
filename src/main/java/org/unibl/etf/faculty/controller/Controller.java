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
import org.unibl.etf.faculty.bean.UserBean;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				
				address = "/WEB-INF/pages/companies.jsp";
			} else {
				session.setAttribute("notification", "Wrong username or password.");
			}
		}
		else {
			UserBean userBean = (UserBean) session.getAttribute("userBean");
			if (userBean == null || !userBean.isLoggedIn()) {
				address = "/WEB-INF/pages/login.jsp";
			} else {
				if (action.equals("companies")) {
					address = "/WEB-INF/pages/companies.jsp";
				} else if (action.equals("changeStatus")) {
					CompanyBean companyBean = (CompanyBean) session.getAttribute("companyBean");
					if (request.getParameter("compId") != null)
					{
						try {
					        Integer companyId = Integer.parseInt(request.getParameter("compId"));
					        if(companyBean.changeStatus(companyId)) {
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
					}
					else {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
