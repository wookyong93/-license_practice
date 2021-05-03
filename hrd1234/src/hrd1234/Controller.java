package hrd1234;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hrd1234.dao.DAO;
import hrd1234.dto.MemberDTO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/member/*")
public class Controller extends HttpServlet {
	private DAO dao = new DAO();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String action = request.getPathInfo();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pageName=null;
		
		System.out.println(action); 
		
		
		if(action.equals("/joinForm.do")) {
			//회원가입 페이지 전송전 데이터값을 호출해야하므로 servlet 처리;
			int count = dao.inc_no()+1;
			request.setAttribute("count", count);
			pageName="/joinForm.jsp";
			
		}else if(action.equals("/addMember.do")){
			MemberDTO dto = new MemberDTO();
			String custname = (String) request.getParameter("custname");
			String phone = (String) request.getParameter("phone");
			String address=(String) request.getParameter("address");
			String grade = (String) request.getParameter("grade");
			String city = (String)request.getParameter("city");
			dto.setCustname(custname);
			dto.setAddress(address);
			dto.setPhone(phone);
			dto.setGrade(grade);
			dto.setCity(city);
			dao.addMember(dto);
			
			pageName="/index.jsp";
			
		}else if(action.equals("/listMember.do")) {
			List<MemberDTO> memberList = dao.listMembers();
			request.setAttribute("memberList", memberList);
			pageName="/memberList.jsp";
		}else if(action.equals("/moneyList.do")) {
			 List<MemberDTO> moneyList = dao.moneyList();
			 request.setAttribute("moneyList", moneyList);
			 pageName="/moneyList.jsp";
		}else if(action.equals("/modForm.do")) {
			int custno= Integer.parseInt(request.getParameter("custno"));
			List<MemberDTO> memberInfo = dao.memberInfo(custno);
			request.setAttribute("memberInfo", memberInfo);
			pageName="/modForm.jsp";
			
		}else if(action.equals("/modMember.do")) {
			MemberDTO dto = new MemberDTO();
			int custno =Integer.parseInt(request.getParameter("custno"));
			String custname = (String) request.getParameter("custname");
			String phone = (String) request.getParameter("phone");
			String address=(String) request.getParameter("address");
			String grade = (String) request.getParameter("grade");
			String city = (String)request.getParameter("city");
			
			dto.setCustno(custno);
			dto.setCustname(custname);
			dto.setPhone(phone);
			dto.setAddress(address);
			dto.setGrade(grade);
			dto.setCity(city);
			dao.modMember(dto);
			pageName="/index.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageName);
		dispatcher.forward(request, response);
	}
}
