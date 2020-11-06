package com.biz.team.sql;

import org.apache.ibatis.jdbc.SQL;

public class BbsSQL {

	public String bbs_insert() {

		SQL sql = new SQL();
		sql.INSERT_INTO("tbl_board");
		sql.INTO_COLUMNS("b_seq").INTO_VALUES("seq_board.NEXTVAL");
		sql.INTO_COLUMNS("b_date").INTO_VALUES("#{b_date}");
		sql.INTO_COLUMNS("b_time").INTO_VALUES("#{b_time}");
		sql.INTO_COLUMNS("b_writer").INTO_VALUES("#{b_writer}");
		sql.INTO_COLUMNS("b_subject").INTO_VALUES("#{b_subject}");
		sql.INTO_COLUMNS("b_content").INTO_VALUES("#{b_content}");
		sql.INTO_COLUMNS("b_count").INTO_VALUES("#{b_count}");

		return sql.toString();

	}

	public String bbs_update() {

		SQL sql = new SQL();
		sql.UPDATE("tbl_board");
		sql.SET("b_date = #{b_date}");
		sql.SET("b_time= #{b_time}");
		sql.SET("b_writer= #{b_writer}");
		sql.SET("b_subject= #{b_subject}");
		sql.SET("b_content= #{b_content}");
		sql.SET("b_count= #{b_count}");
		sql.WHERE("b_seq = #{b_seq}");
		return sql.toString();
	}
}
