package management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import material.AppContextListener;

// 작성자 : 이나겸

@WebServlet("/totalSales")
public class TotalSalesServlet extends HttpServlet {
	AppContextListener app;
	ManageServiceImpl manageServiceImpl = ManageServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		app = new AppContextListener();
		
		try (SqlSession sqlSession = app.getSqlSession()) {
			ManageMapper manageMapper = sqlSession.getMapper(ManageMapper.class);
			int totalSales = manageMapper.getAllSales();
			
			req.setAttribute("totalSales", totalSales);
			
			req.getRequestDispatcher("/WEB-INF/views/totalSales.jsp").forward(req, resp);
		}
	}
}