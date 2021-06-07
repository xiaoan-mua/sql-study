CREATE DATABASE  school CHARACTER SET utf8 COLLATE utf8_general_ci;
#显示数据库
SHOW DATABASES;
#连接数据库
USE school;
# 显示数据库定义语句
SHOW  CREATE DATABASE school;
CREATE  TABLE class (
	id INT(5),
	cname VARCHAR (10),
	sex CHAR(5),
	age INT(5)
)
#插入数据
INSERT INTO class VALUES(1,'张三','男',32)