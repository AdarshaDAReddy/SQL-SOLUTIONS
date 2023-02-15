-- ******** DAY-1 ******

-- plsql  extension of sql with programing capabilities.

-- first command to execute to see the results output
set serveroutput on

/* blocks
1. DECLARE 	 (optional block)   all variables can be declared and assigned here
2. BEGIN 	 (mandatory block)  executable blocks,we can assign variable here also
3. EXCEPTION (optional block)		 
4. END		 (mandatory block)
*/

-- print statement like print in other langauges
dbms_output.put_line('any message')

-- begin,end are mandatory declare,end are optional
BEGIN
dbms_output.put_line('hello world');
end;


-- assignment operator ' := '  like '=' in other langauages
-- every statement ends with ' ; '

DECLARE
pi number;
BEGIN
pi:=3.14;
dbms_output.put_line(pi);
end;

-- concatinating string with variable
DECLARE
pi number;
BEGIN
pi:=3.14;
dbms_output.put_line('pi =' || pi);
end;

-- assigning varible in declare block only
DECLARE
pi number:=3.14;
BEGIN
dbms_output.put_line('pi =' || pi);
end;

-- NULL is default value to un assigned varibles
DECLARE
pi number;
BEGIN
dbms_output.put_line('pi =' || pi);
end;

-- to check wheater it is null value or NOT
DECLARE
name varchar(10);  -- varchar tytpe
BEGIN
dbms_output.put_line(nvl(name,'is null value'));
end;

DECLARE
name varchar(10);
pi number(2);           -- number type
BEGIN
dbms_output.put_line(nvl(pi,null));
end;



-- declare and assign varible in declare block with string
DECLARE
name varchar2(20):='adhi';
BEGIN
dbms_output.put_line(name);
end;

--airthematical operators on variables
DECLARE
a number:=5;
b number:=2;
c number:=a+b;
BEGIN
dbms_output.put_line(a+b);
dbms_output.put_line(a*b);
dbms_output.put_line(a-c);
dbms_output.put_line(a/C);
end;

-- rounding the divided VALUE
DECLARE
a number:=5;
b number:=2;
c number:=a+b;
BEGIN
dbms_output.put_line(a+b);
dbms_output.put_line(a*b);
dbms_output.put_line(a-c);
dbms_output.put_line(round((a/C),2));
end;

-- constants are values which canot be changed if we dont assign value default will be NULL
--in constant values we have to assign values while declaring the variable
DECLARE
pi constant number:=3.14;
BEGIN
dbms_output.put_line('pi =' || pi);
end;

-- ** (2**2 = 2^2)

--pr^2
DECLARE
pi constant number:=3.14;
r number;
BEGIN
r:=5;
dbms_output.put_line(pi* r**2);
end;

-- we can use ':=' or 'default' as assignment OPERATOR
DECLARE
name varchar2(100) DEFAULT 'hello world';
name1 varchar(100) := 'hello world';
BEGIN
dbms_output.put_line(name);
dbms_output.put_line(name1);
end;

--plsql control statements
/*  
	IF
	ELSIF
	ELSE
	end IF
	*/
	
-- query runs till the expresion meets the condition
DECLARE
a number(10) := 5;
BEGIN
if a<5 THEN
dbms_output.put_line('a is less than 5');
ELSIF a<10 then dbms_output.put_line('a is less than 10');
end if;
end;

DECLARE
a number(10) := 5;
BEGIN
if a<5 THEN
dbms_output.put_line('a is less than 5');
end if;
if a<10 THEN
dbms_output.put_line('a is less than 10');
end if;
end;

DECLARE
score number(3):= 85;
BEGIN
if score <35 then 
dbms_output.put_line('fail');
ELSIF score between 35 and 60 then 
dbms_output.put_line('second class');
ELSIF score between 61 and 85 then 
dbms_output.put_line('first class');
ELSE
dbms_output.put_line('distinction');
end if;
end;




----*************** DAY-02 **************

-- 2 types of loops
-- while LOOP
-- for	LOOP

-- printing tables using for LOOP
BEGIN
	for i in 1..10
	LOOP
		dbms_output.put_line('5'||'*'||i||'='||5*i);
	end loop;
end;

-- find sum of 1 to 100 numbers
DECLARE
sumofnumber number:= 0;
BEGIN
for i in 1 .. 100
LOOP
sumofnumber:=sumofnumber+i;
end loop;
dbms_output.put_line(sumofnumber);
end;

-- find odd or even NUMBER
BEGIN
for i in 1..100
LOOP
if mod(i,2)=0 THEN
dbms_output.put_line(i ||' is even NUMBER');
ELSE
dbms_output.put_line(i ||' is odd number');
end if;
end loop;
end;

-- find the sum of add and even number between 1 to 100
declare
sum_of_even_number number:=0;
sum_of_odd_number number:=0;
BEGIN
for i in 1..100
LOOP
if mod(i,2)=0 THEN
sum_of_even_number:=sum_of_even_number+i;
ELSIF
mod(i,2) <>0 THEN
sum_of_odd_number:= sum_of_odd_number+i;
end if;
end loop;
dbms_output.put_line('sum of even number = ' || sum_of_even_number);
dbms_output.put_line('sum of odd number = ' || sum_of_odd_number);
end;