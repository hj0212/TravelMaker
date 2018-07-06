package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBUtils.DBConnection;

public class ReviewPhotoDAO {
	public int insertImage(String oname, String sname) throws Exception{
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO REVIEW_PHOTOS(review_photo_seq,original_file_name,system_file_name) VALUES(review_photos_seq.nextval,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, oname);
		pstmt.setString(2, sname);
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public String getthumbnail(int seq) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT SYSTEM_FILE_NAME FROM REVIEW_PHOTOS WHERE ARTICLE_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		String name = "";
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			name = "/files/"+rs.getString(1);
		}else {
			name = "Charlie-Chaplin-PNG-Image-17681.png";
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return name;
	}
	
	
}
