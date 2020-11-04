package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.team.model.BbsVO;
import com.biz.team.sql.BbsSQL;

public interface BbsDao {

	@Select("SELECT * FROM tbl_board order by b_seq desc")
	public List<BbsVO> selectAll();

	@Select("SELECT * FROM tbl_board WHERE b_seq = #{seq}")
	public BbsVO findBySeq(long seq);

	@InsertProvider(type=BbsSQL.class,method="bbs_insert")
	public int insert(BbsVO bbsVO);

	@UpdateProvider(type=BbsSQL.class,method="bbs_update")
	public int update(BbsVO bbsVO);

	@Delete("DELETE FROM tbl_board WHERE b_seq =#{b_seq}")
	public int delete(long seq);

}
