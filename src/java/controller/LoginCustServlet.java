package controller;

import bean.LoginCustBean;
import dao.LoginCustDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCustServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("custUsername");
            String password = request.getParameter("custPassword");
            LoginCustBean loginBean = new LoginCustBean(username, password);

            LoginCustDao loginDao = new LoginCustDao(); // create LoginDao Object
            String userValidate = loginDao.authenticateUser(loginBean);

            if (userValidate.equals("SUCCESS")) {
                request.setAttribute("custUsername", username);
                RequestDispatcher view = request.getRequestDispatcher("/SuccessLogin.jsp");
                view.forward(request, response);
            } else {
                request.setAttribute("errMessage", userValidate);
                RequestDispatcher view = request.getRequestDispatcher("/LoginCust.jsp");
                view.include(request, response);

                // Display pop-up for invalid credentials using JavaScript
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + userValidate + "');");
                out.println("</script>");

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
