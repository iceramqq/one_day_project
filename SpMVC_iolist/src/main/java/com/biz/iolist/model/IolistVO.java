package com.biz.iolist.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class IolistVO {

	private long seq;//	NUMBER
	private String io_date;//	VARCHAR2(10)
	private String io_time;//	VARCHAR2(10)
	private String io_pname;//	nVARCHAR2(30)
	private String io_input;//	CHAR(1)
	private int io_price;//	NUMBER
	private int io_quan;//	NUMBER
	private int io_total;//	NUMBER

}
