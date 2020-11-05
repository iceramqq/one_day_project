package com.biz.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.biz.team.model.BbsVO;

public interface BbsDao {

	@Select("SELECT * FROM tbl_board order by b_seq desc")
	public List<BbsVO> selectAll();

	@Select("SELECT * FROM tbl_board WHERE b_seq = #{seq}")
	public BbsVO findBySeq(long seq);
	
	public int insert(BbsVO bbsVO);

	public int update(BbsVO bbsVO);

	@Delete("DELETE FROM tbl_board WHERE b_seq =#{b_seq}")
	public int delete(long seq);

}
