package hrd1234.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrd1234.dto.MemberDTO;

public class DAO {
	public Connection con;
	public PreparedStatement pstmt;
	
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle");
		return con;
	}
	
	public int inc_no() {
		int result = 0;
		try {
		con =getConnection();
		String sql = "SELECT max(custno) FROM member_tbl_02";
		pstmt = con.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		con.close();
		
		return result;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void addMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		try {
			con = getConnection();
			String sql = "INSERT INTO member_tbl_02 VALUES(tbl_seq.nextval,?,?,?,sysdate,?,?)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<MemberDTO> listMembers() {
		// TODO Auto-generated method stub
		List<MemberDTO> memberList = new ArrayList();
		try {
			con = getConnection();
			String sql = "SELECT * FROM member_tbl_02";
			pstmt =con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				memberList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}

	public List<MemberDTO> moneyList() {
		// TODO Auto-generated method stub
		List<MemberDTO> moneyList = new ArrayList();
		try {
			con = getConnection();
			String sql = "SELECT member.custno as custno, member.custname as custname, member.grade as grade, sum(money.price) as price "
					+ "from member_tbl_02 member , money_tbl_02 money "
					+ "where member.custno = money.custno "
					+ "group by member.custno,member.custname,member.grade "
					+ "order by price desc";
			pstmt =con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getInt("price"));
				moneyList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return moneyList;
	}

	public List<MemberDTO> memberInfo(int custno) {
		List<MemberDTO> memberInfo = new ArrayList();
		try {
			con = getConnection();
			String sql ="SELECT * FROM member_tbl_02 WHERE custno=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				memberInfo.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	public void modMember(MemberDTO dto) {
		try {
			con = getConnection();
			String sql = "UPDATE member_tbl_02 SET custname=?, phone=?, address=?, grade=?, city=? WHERE custno=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			pstmt.setInt(6, dto.getCustno());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
