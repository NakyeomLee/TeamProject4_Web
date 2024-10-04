package management;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import main.ServiceImpl;
import material.AppContextListener;

// 작성자 : 이나겸

@WebServlet("/userManage")
public class UserManageServlet extends HttpServlet {
	AppContextListener app;
	ManageServiceImpl manageServiceImpl = ManageServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		app = new AppContextListener();
		
		List<JoinUser> userList = null;
		List<JoinUser> blackList = null;
		List<JoinUser> leaveList = null;

		try (SqlSession sqlSession = app.getSqlSession()) {
			ManageMapper manageMapper = sqlSession.getMapper(ManageMapper.class);
			userList = manageMapper.getAllUser();
			blackList = manageMapper.getBlockUser();
			leaveList = manageMapper.getLeaveUser();
			
			int joinUserCount = manageMapper.getJoinUserCount();
			req.setAttribute("joinUserCount", joinUserCount);
			
			int blockUserCount = manageMapper.getBlockUserCount();
			req.setAttribute("blockUserCount", blockUserCount);
			
			int leaveUserCount = manageMapper.getLeaveUserCount();
			req.setAttribute("leaveUserCount", leaveUserCount);
		}
		
		req.setAttribute("userList", userList);
		req.setAttribute("blackList", blackList);
		req.setAttribute("leaveList", leaveList);
		
		req.getRequestDispatcher("/WEB-INF/views/userManage.jsp").forward(req, resp);
	}
}