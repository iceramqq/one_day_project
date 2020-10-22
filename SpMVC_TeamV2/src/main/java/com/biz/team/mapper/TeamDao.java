package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.team.model.TeamVO;
import com.biz.team.sql.TeamSQL;

public interface TeamDao {

	@Select("SELECT * FROM tbl_bbs order by b_seq desc")
	public List<TeamVO> selectAll();
	
	@Select("SELECT * FROM tbl_bbs WHERE b_seq = #{seq}")
	public TeamVO findBySeq(long seq);
	
	/*
	 * BBsSQL 클래스에 정의된 bbs_insert method를 호출하여
	 * SQL문을 생성하고, 여기에 코드를 추가하라
	 */
	@InsertProvider(type=TeamSQL.class,method="bbs_insert")
	public int insert(TeamVO teamVO);
	
	@UpdateProvider(type=TeamSQL.class,method="bbs_update")
	public int update(TeamVO teamVO);
	
	@Delete("DELETE FROM tbl_bbs WHERE b_seq = #{seq}")
	public int delete(long seq);
}
