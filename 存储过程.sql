USE day1;
# 创建存储过程
DELIMITER//
CREATE  PROCEDURE better(IN i INT,IN j INT , OUT large INT)
BEGIN
	SET large=0;
	IF i>j THEN 
	SET large=i;
	
	ELSE 
	 SET large=j;
	END IF;
END//
DELIMITER;
CALL better(20,12,@a);
SELECT @a;

DROP PROCEDURE better;

#存储过程，输入成绩大于90，为A等，大于75，为B等，大于60，为C等，其他为D等。
DROP PROCEDURE score_1;
DELIMITER//
CREATE PROCEDURE score_1(i INT)
begin
	if i>90 then
		select 'A' as '等级';
	else if i>75 then 
		select 'B' as '等级';
	else if i>60 then
		select 'C' as '等级';
	else
		select 'D' as '等级';
	end if;

end//
delimiter;


# 带case语句 的存储过程
drop procedure call_phone;

delimiter//
create procedure call_phone (i int)
begin
  case i
	when 1 then
		select'爸爸的电话' as who;
	when 2 then
		select'妈妈的电话' as who;
	else 
		select '拨打错误' as who;
	end case;
end//
delimiter;

call call_phone(1)

# 带while循环的存储过程
delimiter//
create procedure pro_1(i int)
begin
	declare a int;
	set a=1;
	while a<i do
		insert into libbook  set  B_NAME='python',B_AUTHOP='胖虎' ,B_PRICE=100;
		set a=a+1;
	end while;
end//
delimiter;
drop procedure pro_1;
call pro_1(5);
desc libbook;
#利用while循环计算1-100之和
delimiter//
create procedure pro_2(in i int,out total int)
begin
	declare a int;
	set a=1;
	 set total=0;
	while  a<=i do
	set total=total+a;
	set a=a+1;
	end while;
end//
delimiter;
drop procedure pro_2;
call pro_2(100,@aaa);
select @aaa;
#带loop循环的存储过程
#找出1-100之间可以被3整除的数字

delimiter//
create procedure pro_3()
begin
	declare i int ;
	set i=1;
	declare count_1 int;
	set count_1=0;
	while i<=100 do
		if i mod 3=0 then
			set count_1=count_1+i;
		end if;
		set i=i+1;	
	end while;
	select count_1;
		

end//
delimiter;
