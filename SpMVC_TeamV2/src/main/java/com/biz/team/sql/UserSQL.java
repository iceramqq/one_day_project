package com.biz.team.sql;

import org.apache.ibatis.jdbc.SQL;

public class UserSQL {

	public String user_insert() {

		SQL sql = new SQL();
		sql.INSERT_INTO("tbl_user");
		sql.INTO_COLUMNS("username").INTO_VALUES("#{username}");
		sql.INTO_COLUMNS("password").INTO_VALUES("#{password}");
		sql.INTO_COLUMNS("m_role").INTO_VALUES("#{m_role}");
		sql.INTO_COLUMNS("enabled").INTO_VALUES("1");
		sql.INTO_COLUMNS("accountNonExpired").INTO_VALUES("1");
		sql.INTO_COLUMNS("accountNonLocked").INTO_VALUES("1");
		sql.INTO_COLUMNS("credentialsNonExpired").INTO_VALUES("1");

		return sql.toString();

	}

	public String user_update() {

		SQL sql = new SQL();
		sql.UPDATE("tbl_user");
		sql.SET("password = #{password}");
		sql.SET("role= #{role}");
		sql.SET("accountNonLocked= #{accountNonLocked}");
		sql.WHERE("username = #{username}");
		return sql.toString();
	}
}
