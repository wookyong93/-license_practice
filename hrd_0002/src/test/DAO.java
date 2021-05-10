package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DAO {
	private Connection con;
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","1234");
		return con;
	}

	public List<DTO> selectMember() {
		// TODO Auto-generated method stub
		List<DTO> memberList = new ArrayList<DTO>();
		try {
			con = getConnection();
			sql = "SELECT mem.m_no as m_no, mem.m_name as m_name, par.p_name as p_name, mem.p_school as p_school, "
					+ "mem.m_jumin as m_jumin, mem.m_city as m_city, "
					+ "par.p_tel1 as p_tel1, par.p_tel2 as p_tel2,par.p_tel3 as p_tel3 "
					+ " FROM tbl_member_202005 mem, tbl_party_202005 par "
					+ "WHERE mem.p_code = par.p_code "
					+ "ORDER BY m_no ASC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setM_no(rs.getString(1));
				dto.setM_name(rs.getString(2));
				dto.setP_name(rs.getString(3));
				dto.setP_school(rs.getString(4));
				String ju = rs.getString(5);
				dto.setM_jumin(ju.substring(0,6)+"-"+ju.substring(6));
				dto.setM_city(rs.getString(6));
				dto.setP_tel1(rs.getString(7));
				dto.setP_tel2(rs.getString(8));
				dto.setP_tel3(rs.getString(9));
				
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

	public void voteInsert(DTO dto) {
		// TODO Auto-generated method stub
		try {
			con=getConnection();
			sql = "INSERT INTO tbl_vote_202005 VALUES(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getV_jumin());
			pstmt.setString(2, dto.getV_name());
			pstmt.setString(3, dto.getM_no());
			pstmt.setString(4, dto.getV_time());
			pstmt.setString(5, dto.getV_area());
			pstmt.setString(6, dto.getV_confirm());
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<DTO> voteInfo() {
		// TODO Auto-generated method stub
		List<DTO> voteInfo = new ArrayList<DTO>();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일생");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
			con =getConnection();
			sql="SELECT * FROM tbl_vote_202005 where v_area='제1투표장'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DTO dto = new DTO();
				String jumin = rs.getString(1);
				dto.setBirth(sdf.format(sdf1.parse("19"+jumin.substring(0,6))));
				if(jumin.substring(6,7).equals("1")) {
					dto.setGender("남");
				}else if(jumin.substring(6,7).equals("2")) {
					dto.setGender("여");
				}
				String birthstr = dto.getBirth();
				String today = sdf1.format(new Date());
				int byear = Integer.parseInt(birthstr.substring(0,4));
				int tyear = Integer.parseInt(today.substring(0,4));
				int bmonth = Integer.parseInt(birthstr.substring(5,7));
				int tmonth = Integer.parseInt(today.substring(4,6));
				int bday = Integer.parseInt(birthstr.substring(8,10));
				int tday = Integer.parseInt(today.substring(6));
				int age = 0;
				if(bmonth>tmonth) {
					age = tyear - byear - 1;
					dto.setAge("만"+age+"세");
				}else if(bmonth==tmonth) {
					if(bday>tday) {
						age = tyear - byear - 1;
						dto.setAge("만"+age+"세");
					}else if(bday <= tday) {
						age = tyear - byear;
						dto.setAge("만"+age+"세");
					}
				}else {
					age = tyear - byear;
					dto.setAge("만"+age+"세");
				}
				
				dto.setV_name(rs.getString("v_name"));
				dto.setM_no(rs.getString(3));
				String vtime = rs.getString(4);
				String time = vtime.substring(0,2)+":"+vtime.substring(2);
				dto.setV_time(time);		
				dto.setV_confirm(rs.getString(6));
				voteInfo.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return voteInfo;
	}

	public List<DTO> voterank() {
		// TODO Auto-generated method stub
		List<DTO> voterank = new ArrayList<DTO>();
		try {
			con=getConnection();
			sql="SELECT mem.m_no as m_no, mem.m_name as m_name, count(vote.m_no) as count FROM tbl_member_202005 mem,tbl_vote_202005 vote WHERE mem.m_no = vote.m_no and vote.v_confirm='Y' "
					+ "group by mem.m_no,mem.m_name order by count DESC";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setM_no(rs.getString("m_no"));
				dto.setM_name(rs.getString("m_name"));
				dto.setCount(rs.getString("count"));
				voterank.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return voterank;
	}
	
}
