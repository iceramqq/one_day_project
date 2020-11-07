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

	private long seq;//	number
	private String io_date;//	varchar2(10 byte)
	private String io_time;//	varchar2(10 byte)
	private String io_pname;//	nvarchar2(30 char)
	private byte io_input;//	char(1 byte)
	private int io_price;//	number
	private int io_quan;//	number
	private int io_total;//	number	
	
	private int in_total;
	private int out_total;
}
