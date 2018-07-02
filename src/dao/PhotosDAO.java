package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.PhotosDTO;

public class PhotosDAO {

	public int uploadPhoto(PhotosDTO ptdto) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "insert into photos values(photos_seq.nextval,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1,ptdto.getOriginal_file_name());
		pstat.setString(2, ptdto.getSystem_file_name());
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
	public PhotosDTO downloadPhoto(int photo_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from photos where photo_seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, photo_seq);
		ResultSet rs = pstat.executeQuery();		
		PhotosDTO pdto = new PhotosDTO();
		if(rs.next()) {
			pdto.setPhoto_seq(rs.getInt("photo_seq"));
			pdto.setOriginal_file_name(rs.getString("original_file_name"));
			pdto.setSystem_file_name(rs.getString("system_file_name"));
		}
		return pdto;		
	}
	
	public int getPhotoSeq (String original_file_name, String system_file_name) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from photos where ORIGINAL_FILE_NAME=?, SYSTEM_FILE_NAME=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, original_file_name);
		pstat.setString(2, system_file_name);
		ResultSet rs = pstat.executeQuery();
		int photoSeq= 0;
		if(rs.next()) {
			photoSeq = rs.getInt("photo_seq");
		}
		return photoSeq;
	}

}
