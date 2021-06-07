#多表查询（其中的一个表是虚表，临时查询的结果）
USE day1;
DESC students;
SELECT *FROM students;
ALTER TABLE students CHANGE 学生成绩 score INT(5);
# 语句分开书写
SELECT  MIN(score) AS little FROM students
SELECT 姓名 FROM students WHERE score=67;
#合并书写
SELECT STU.`姓名`,LIT.little 
FROM students STU,(SELECT  MIN(score) AS little FROM students) LIT WHERE STU.`score`=LIT.little;

#多表查询（两个真实的表）
USE table_1;
CREATE TABLE publisher(
	 P_ID BIGINT(10) PRIMARY KEY NOT NULL COMMENT'出版社编号',
	 P_NAME VARCHAR (20) UNIQUE NOT NULL COMMENT '出版社名',
	 P_LINKMAN VARCHAR(10) NOT NULL COMMENT'出版社联系人',
	 P_TELL INT(20) COMMENT'联系电话',
	 P_ADDRESS VARCHAR(20) COMMENT'联系地址'
)
CREATE TABLE libbook(
  B_ID INT(2) PRIMARY KEY  AUTO_INCREMENT COMMENT'图书编号',
  B_NAME VARCHAR(10) NOT NULL COMMENT '书名',
  P_ID BIGINT(10) COMMENT'出版社编号',
  B_AUTHOP  VARCHAR(5) COMMENT'作者名称' ,
  B_PRICE FLOAT(5) NOT NULL COMMENT'价格'
)
DROP TABLE libbook;
SELECT *FROM publisher;
SELECT *FROM libbook 
#查询出图书名为计算机基础的所有信息，包括出版社的信息
SELECT b.B_ID,b.B_NAME,b.B_AUTHOP,b.B_PRICE,p.P_NAME
 FROM libbook b  INNER JOIN publisher p
 ON b.P_ID=p.P_ID
 WHERE b.B_NAME='计算机基础理论'
# 查询所有武汉大学出版的所有书籍

SELECT b.B_NAME,p.P_NAME,p.P_ADDRESS
 FROM libbook b INNER JOIN publisher p
 ON b.P_ID=p.P_ID
 WHERE p.P_NAME='武汉大学出版社'
 
 #三表查询（多用于调查问卷）
