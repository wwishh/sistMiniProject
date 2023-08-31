package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SmartAnswerDto;
import mysql.db.DBConnect;

public class SmartAnswerDao {
	DBConnect db = new DBConnect();
	
	//insert
		public void insertSmartAnswer(SmartAnswerDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "insert into smartanswer(num,nickname,content,writeday) values(?,?,?,now())";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNum());
				pstmt.setString(2, dto.getNickname());
				pstmt.setString(3, dto.getContent());
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//list
		public List<SmartAnswerDto> getAllSmartAnswers(String num){
			List<SmartAnswerDto> list = new ArrayList<SmartAnswerDto>();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//몇 번 글에 대한 댓글인지
			String sql ="select * from smartanswer where num=? order by idx desc";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					SmartAnswerDto dto = new SmartAnswerDto();
					dto.setIdx(rs.getString("idx"));
					dto.setNum(rs.getString("num"));
					dto.setNickname(rs.getString("nickname"));
					dto.setContent(rs.getString("content"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		
		//delete
		public void deleteSmartAnswer(String idx) {
			Connection conn =db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql ="delete from smartanswer where idx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, idx);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//댓글 수정시 dto가져오기
		public SmartAnswerDto getData(String idx) {
			SmartAnswerDto dto = new SmartAnswerDto();
			
			Connection conn =db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from smartanswer where idx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setIdx(rs.getString("idx"));
					dto.setNum(rs.getString("num"));
					dto.setNickname(rs.getString("nickname"));
					dto.setContent(rs.getString("content"));
					dto.setWriteday(rs.getTimestamp("writeday"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return dto;
		}
		
		//update
		public void updateAnswer(SmartAnswerDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update smartanswer set nickname=?, content=? where idx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);				
				pstmt.setString(1, dto.getNickname());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getIdx());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
}
