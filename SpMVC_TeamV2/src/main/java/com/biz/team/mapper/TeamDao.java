package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.team.model.TeamVO;
import com.biz.team.sql.TeamSQL;

public interface TeamDao {

	@Select("SELECT * FROM tbl_hlist WHERE h_category = #{category} order by h_seq")
	public List<TeamVO> selectAll(String category);
	
	@Select("SELECT * FROM tbl_hlist WHERE H_seq = #{seq}")
	public TeamVO findBySeq(long seq);
	
	@InsertProvider(type=TeamSQL.class,method="team_insert")
	public int insert(TeamVO teamVO);
	
	@UpdateProvider(type=TeamSQL.class,method="team_update")
	public int update(TeamVO teamVO);
	
	@Delete("DELETE FROM tbl_hlist WHERE h_seq = #{seq}")
	public int delete(long seq);
}
