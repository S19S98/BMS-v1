package com.swapnil.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.swapnil.bean.BookBean;
import com.swapnil.util.DBUtil;

public class BookDAO {
	public List<BookBean> getAllBook(){
		List<BookBean> bookList = new ArrayList<BookBean>();
		try {
			String sql = "SELECT * FROM reading_table";
			Connection con = DBUtil.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				BookBean bean = new BookBean();
				bean.setBookName(rs.getString("book_name"));
				bean.setAuthorName(rs.getString("author_name"));
				bean.setPublication(rs.getString("publication"));
				bookList.add(bean);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return bookList;
	}
}
