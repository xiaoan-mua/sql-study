USE day2;
CREATE  TABLE publisher(
	P_ID  INTEGER(5)  AUTO_INCREMENT PRIMARY KEY COMMENT'出版社编号',
	P_NAME VARCHAR(20) NOT NULL UNIQUE COMMENT'出版社名称',
	P_LINKAMY VARCHAR(20) NOT NULL COMMENT'出版社联系人',
	P_TEL VARCHAR(20) COMMENT'出版社联系电话',
	P_ADDRESS VARCHAR(20) COMMENT'出版社详细地址'
);

DESC publisher;
ALTER TABLE publisher ADD price FLOAT(5);

INSERT INTO  publisher SET P_NAME='王总', P_LINKAMY='赵总',price=100;
INSERT INTO  publisher SET P_NAME='云长', P_LINKAMY='李总',price=999;
INSERT INTO  publisher SET P_NAME='刘总', P_LINKAMY='唐总',price=56;
INSERT INTO  publisher SET P_NAME='张飞', P_LINKAMY='安总',price=867;
INSERT INTO  publisher SET P_NAME='杜总', P_LINKAMY='宋总',price=789;
# 升序排列
SELECT *FROM publisher ORDER BY  price ASC;
#降序排列
SELECT *FROM publisher ORDER BY price DESC;
#查询价钱的最大值
SELECT MAX(price)  AS '最高价'FROM publisher;
#查询价钱的最小值
SELECT MIN(price) FROM publisher;
# 分页查询
SELECT *FROM publisher ORDER BY price DESC LIMIT 0,2;


#多表查询
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
