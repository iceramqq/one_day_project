package com.biz.team.sql;

import org.apache.ibatis.jdbc.SQL;

public class TeamSQL {

public String team_insert() {
		
		SQL sql = new SQL();
		sql.INSERT_INTO("tbl_hlist");
		sql.INTO_COLUMNS("h_seq").INTO_VALUES("seq_hlist.NEXTVAL");
		sql.INTO_COLUMNS("h_category").INTO_VALUES("#{h_category}");
		sql.INTO_COLUMNS("h_title").INTO_VALUES("#{h_title}");
		sql.INTO_COLUMNS("h_address").INTO_VALUES("#{h_address}");
		sql.INTO_COLUMNS("h_content").INTO_VALUES("#{h_content}");
		sql.INTO_COLUMNS("h_tel").INTO_VALUES("#{h_tel}");
		sql.INTO_COLUMNS("h_file").INTO_VALUES("#{h_file}");

		return sql.toString();
		
	}

	/*
	 * SQL 클래스를 사용하여 xml 대신 Java Code방식으로 SQL 작성
	 */
	public String team_update() {
		
		SQL sql = new SQL();
		sql.UPDATE("tbl_hlist");
		sql.SET("h_category = #{h_category}");
		sql.SET("h_title= #{h_title}");
		sql.SET("h_address= #{h_address}");
		sql.SET("h_content= #{h_content}");
		sql.SET("h_tel= #{h_tel}");
		sql.SET("h_tel= #{h_tel}");
		sql.SET("h_file= #{h_file}");
		sql.WHERE("h_seq = #{h_seq}");
		return sql.toString();
	}
}
