-- user1

CREATE TABLE tbl_hlist (
h_seq	NUMBER	PRIMARY KEY,
h_category	CHAR(1)	NOT NULL,
h_title	nVARCHAR2(50)	NOT NULL,
h_address	NVARCHAR2(255)	NOT NULL,
h_content	NVARCHAR2(2000)	NOT NULL,
h_tel	NVARCHAR2(500)	NOT NULL,
h_file	NVARCHAR2(501)	
	

);

CREATE SEQUENCE seq_hlist
START WITH 1 INCREMENT BY 1;

DROP TABLE tbl_hlist;

SELECT * FROM tbl_hlist WHERE h_category = 2 order by h_seq;

DELETE tbl_hlist WHERE h_category = 2;