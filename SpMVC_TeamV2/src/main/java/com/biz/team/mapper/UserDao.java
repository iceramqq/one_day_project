package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.team.model.UserDetailsVO;
import com.biz.team.sql.BbsSQL;

public interface UserDao {

	@Select("SELECT * FROM tbl_login order by username")
	public List<UserDetailsVO> selectAll();

	@Select("SELECT * FROM tbl_login WHERE username = #{username}")
	public UserDetailsVO findBySeq(String username);

	@InsertProvider(type=BbsSQL.class,method="login_insert")
	public int insert(UserDetailsVO userVO);

	@UpdateProvider(type=BbsSQL.class,method="login_update")
	public int update(UserDetailsVO userVO);

	@Delete("DELETE FROM tbl_login WHERE username =#{username}")
	public int delete(String username);
	
	@Select("SELECT COUNT(*) FROM tbl_login")
	public int userCount() ;
}
