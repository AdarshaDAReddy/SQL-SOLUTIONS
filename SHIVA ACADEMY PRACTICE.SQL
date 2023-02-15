
(--Q1
-- from below table fetch row which contains A in any rows without using or condition
CREATE TABLE T
(
	SLNO NUMBER(2),
	C1	VARCHAR2(1),
	C2	VARCHAR2(1),
	C3	VARCHAR2(1),
	C4	VARCHAR2(1),
	C5	VARCHAR2(1)
);
select * from t
insert all
into t values(1,'A','B','C','D','E')
into t values(2,NULL,'A','B','C','D')
into t values(3,'E',NULL,NULL,NULL,'A')
into t values(4,NULL,'A','E',NULL,'D')
into t values(5,'E','D','C','B',NULL)
SELECT * FROM dual;

--solution-01
SELECT * FROM T WHERE 'A' IN (C1,C2,C3,C4,C5)

--solution-02
select * from t where c1='A' union all
select * from t where c2='A' union all
select * from t where c3='A' union all
select * from t where c4='A' union all
select * from t where c5='A'

--solution-03
select * from t
where (c1||c2||c3||c4||c5) like '%A%')

(--Q2
-- write a query to select employees getting salary greater than average salary of the department that are working in?
create table emp as select * from scott.emp
--solution-1
select * from 
(select e.*,round((avg(sal) over(partition by deptno)),2) avg_sal from emp e) q
where sal>avg_sal
--solution-2
select * from emp e
where e.sal > any (select round(avg(sal),2) as avg_sal from emp b where e.deptno=b.deptno)
--solution-03
select * from emp e,(select deptno,trunc(avg(sal)) avg_sal from emp group by deptno ) b
where e.deptno=b.deptno and e.sal > avg_sal
--solution-04
select * from emp e where
e.sal>(select avg(b.sal) from emp b where e.deptno=b.deptno)
)

(--Q3
-- write a query to fetch details with are not exists in tab2
create table tab1(c1 varchar2(1));

create table tab2(c1 varchar2(1));

insert all 
into tab1 values('A')
into tab1 values('B')
into tab1 values('C')
into tab1 values('D')
into tab1 values('E')
select * from dual;

insert all 
into tab2 values('A')
into tab2 values('C')
into tab2 values('E')
into tab2 values('G')
select * from dual;

--solution-01
select * from tab1
minus
select * from tab2;

--solution-02
select * from tab1 where c1 not in (select * from tab2)

--solution-03
select a.* from tab1 a left join tab2 b on a.c1=b.c1
where b.c1 is null;
)

(--Q4
-- from the given cric table we have to find team name,no of matchs,matches won,matches lost


create table cric(
    match_no number(2),
    team_a  varchar2(10),
    team_b  varchar2(10),
    winner  varchar2(10)
);

insert all
into cric values(1,'WI','SL','WI')
into cric values(2,'IND','SL','IND')
into cric values(3,'AUS','SL','AUS')
into cric values(4,'WI','SL','SL')
into cric values(5,'AUS','IND','AUS')
into cric values(6,'WI','SL','WI')
into cric values(7,'IND','WI','WI')
into cric values(8,'WI','AUS','AUS')
into cric values(9,'WI','IND','IND')
into cric values(10,'AUS','WI','WI')
into cric values(11,'WI','SL','WI')
into cric values(12,'IND','AUS','IND')
into cric values(13,'SL','NZ','SL')
into cric values(14,'NZ','IND','IND')
SELECT * FROM DUAL;

select team_name,total_matches,nvl(matches_won,0) matches_won,
total_matches-nvl(matches_won,0) matches_lost from 
(select team_a team_name,count(*) total_matches from (select team_a from cric
union all
select team_b from cric) team_name
group by team_a) a  full join
(select winner,count(*) matches_won from cric group by winner) b
on a.team_name=b.winner  )

(--Q5
-- print row number from 1 to n 

--solution-01
select rownum from dual connect by level <=100 --100 or n

--solution-02
select level from dual connect by level <=100  --100 or n

select rownum,level from dual connect by level <=2  

set serveroutput on
declare
a number(10) :=0;
begin
for i in 1..100
loop
a:=i;
dbms_output.put_line(a);
end loop;
end;  )

(--Q6
-- write a query to print given string in different pattren

select 
substr('welcome',level,1),
substr('welcome',-level,1),
substr('welcome',1,level),
substr('welcome',level),
lpad(' ',level,' ')||substr('welcome',level),
lpad(substr('welcome',1,level),7,' ')
from dual
connect by level <=length('welcome'); )

(--Q7
--extract first_name,last_name,middle_name & domain name from email

create table email
(emial_id varchar2(100));

insert all
into email values('siva.k.academy@gmail.com')
into email values('jeeva.anand.kumar@yahoo.com')
into email values('ravi.guru.raj@outlook.com')
select * from dual;

select
substr(email_id,1,instr(email_id,'.',1,1)-1) first_name,
substr(email_id,instr(email_id,'.',1,1)+1,instr(email_id,'.',1,2)-instr(email_id,'.',1,1)-1 ) middle_name,
substr(email_id,instr(email_id,'.',1,2)+1,instr(email_id,'@')-1-instr(email_id,'.',1,2)) last_name,
substr(email_id,instr(email_id,'@')+1) domain_name
from email   )

(--Q8
