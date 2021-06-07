#创建表制定主键
USE school;
CREATE TABLE teacher(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	tname VARCHAR(10),
	age INT,
	salary FLOAT
)
DROP TABLE teacher;
INSERT INTO teacher (tname,age,salary) VALUES('王',67,1000),('安',34,8000)
DESC teacher;


#作业
#创建图书信息表
`library`
DESC book;
#改变表中某个字段的名称

ALTER TABLE book CHANGE  B_ID  id INT;
#删除某个字段
ALTER TABLE book DROP P_ID;
#修改字段类型 
ALTER TABLE book MODIFY B_PRICE INT(10);
# 对表进行重命名
RENAME TABLE book TO books;


#主键，唯一值，非空练习
DESC users;

SELECT NOW();