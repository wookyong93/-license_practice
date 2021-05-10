package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/vote/*")
public class Controller extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	private void doHandle(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		DAO dao = new DAO();
		String pageName = null;
		
		if(action.equals("/voteMemberList.do")) {
			List<DTO> memberList = new ArrayList<DTO>();
			memberList = dao.selectMember();
			request.setAttribute("memberList", memberList);
			pageName="/voteMemberList.jsp";
		}else if (action.equals("/voteInsert.do")) {
			DTO dto = new DTO();
			dto.setV_jumin(request.getParameter("v_jumin"));
			dto.setV_name(request.getParameter("v_name"));
			dto.setM_no(request.getParameter("m_no"));
			dto.setV_time(request.getParameter("v_time"));
			dto.setV_area(request.getParameter("v_area"));
			dto.setV_confirm(request.getParameter("v_confirm"));
			dao.voteInsert(dto);
			pageName="/index.jsp";
		}else if (action.equals("/voteInfo.do")) {
			List<DTO> voteInfo = new ArrayList<DTO>();
			voteInfo = dao.voteInfo();
			request.setAttribute("voteInfo", voteInfo);
			pageName="/voteInfo.jsp";
		}else if(action.equals("/voterank.do")) {
			List<DTO> voterank = new ArrayList<DTO>();
			voterank=dao.voterank();
			request.setAttribute("voterank", voterank);
			pageName="/voterank.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageName);
		dispatcher.forward(request, response);
	}
}
