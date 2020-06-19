package com.swapnil.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.swapnil.bean.UserBean;
import com.swapnil.util.DBUtil;

public class UserDAO {
	public String checkUser(UserBean userBean) {
		String status = "Fail";
		try {
			String sql = "SELECT * FROM bms_table where username = ? AND password = ?";
			Connection con = DBUtil.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,  userBean.getUserName());
			st.setString(2,  userBean.getPassword());
			ResultSet rs = st.executeQuery();
			if(rs.next())
				status = "Success";
			st.close();
			con.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
