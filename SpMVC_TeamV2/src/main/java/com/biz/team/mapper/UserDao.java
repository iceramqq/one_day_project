package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.team.model.UserVO;
import com.biz.team.sql.UserSQL;

public interface UserDao {

	@Select("SELECT * FROM tbl_user")
	public List<UserVO> selectAll();

	@Select("SELECT * FROM tbl_user WHERE username = #{username}")
	public UserVO findById(String username);
	
	@InsertProvider(type=UserSQL.class,method="user_insert")
	public int insert(UserVO userVO);

	@UpdateProvider(type=UserSQL.class,method="user_update")
	public int update(UserVO userVO);

	@Delete("DELETE FROM tbl_user WHERE username =#{username}")
	public int delete(String username);
	
	@Select("SELECT COUNT(*) FROM tbl_user")
	public int userCount() ;
}
