package management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import material.AppContextListener;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
	AppContextListener app;
	ManageServiceImpl manageServiceImpl = ManageServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/addProduct.jsp").forward(req, resp);
	}
}