package com.biz.team.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class TeamVO {

	private long h_seq;		//	NUMBER
	private String h_category;	//	nVARCHAR2(50)
	private String h_title;	//	nVARCHAR2(50)
	private String h_address;	//	NVARCHAR2(255)
	private String h_content;	//	NVARCHAR2(2000)
	private String h_tel;		//	NVARCHAR2(500)
	private String h_file;		//	NVARCHAR2(500)

}
