--dropping all tables
drop table DonationToBloodBanks;
drop table DonationToIndividuals; 
drop table Donors;
drop table Recipients;
drop table BloodBagInBloodBanks;
drop table BloodBanks;
drop table BloodGroups;


--creating BloodGroups table
create table BloodGroups(
BloodGroupID varchar(3),
PRIMARY KEY(BloodGroupID)
);

--creating BloodBanks table
create table BloodBanks(
BloodBankID number(20) NOT NULL,
name varchar(20),
city varchar(20),
PRIMARY KEY (BloodBankID)
);

--creating BloodBagInBloodBanks table
create table BloodBagInBloodBanks(
blood_group_id_fk varchar(3) NOT NULL,
blood_bank_id_fk number(20) NOT NULL,
number_of_bag number(10) DEFAULT 0,
FOREIGN KEY(blood_group_id_fk) REFERENCES BloodGroups(BloodGroupID),
FOREIGN KEY(blood_bank_id_fk) REFERENCES BloodBanks(BloodBankID)
);

--creating Donors table
create table Donors(
DonorNID number(20) NOT NULL,
name varchar(20) NOT NULL,
blood_group_id_fk varchar(3) NOT NULL,
gender varchar(10) NOT NULL,
age number(5) NOT NULL,
contact number(15) NOT NULL,
city varchar(20) NOT NULL,
PRIMARY KEY (DonorNID),
FOREIGN KEY(blood_group_id_fk) REFERENCES BloodGroups(BloodGroupID)
);


--creating Recipients table
create table Recipients(
RecipientNID number(20) NOT NULL,
name varchar(20) NOT NULL,
blood_group_id_fk varchar(3) NOT NULL,
gender varchar(10) NOT NULL,
age number(5) NOT NULL,
contact number(15) NOT NULL,
city varchar(20) NOT NULL,
PRIMARY KEY (RecipientNID),
FOREIGN KEY(blood_group_id_fk) REFERENCES BloodGroups(BloodGroupID)
);

--creating DonationToBloodBanks table
create table DonationToBloodBanks(
donor_nid_fk number(20),
donation_place_fk number(20),
date_of_donation date,
no_of_bag number(2),
PRIMARY KEY (donor_nid_fk,date_of_donation),
FOREIGN KEY(donor_nid_fk) REFERENCES Donors(DonorNID),
FOREIGN KEY(donation_place_fk) REFERENCES BloodBanks(BloodBankID)
);


--creating DonationToIndividuals table
create table DonationToIndividuals(
donor_nid_fk number(20),
recipient_nid_fk number(20),
donation_place_fk number(10),
date_of_donation date,
no_of_bag number(2),
PRIMARY KEY(donor_nid_fk,date_of_donation),
FOREIGN KEY(donation_place_fk) REFERENCES BloodBanks(BloodBankID),
FOREIGN KEY(donor_nid_fk) REFERENCES Donors(DonorNID),
FOREIGN KEY(recipient_nid_fk) REFERENCES Recipients(RecipientNID)
);

--inserting values
insert into BloodGroups (BloodGroupID) values ('A+');
insert into BloodGroups (BloodGroupID) values ('A-');
insert into BloodGroups (BloodGroupID) values ('B+');
insert into BloodGroups (BloodGroupID) values ('B-');	
insert into BloodGroups (BloodGroupID) values ('O+');
insert into BloodGroups (BloodGroupID) values ('O-');
insert into BloodGroups (BloodGroupID) values ('AB+');
insert into BloodGroups (BloodGroupID) values ('AB-');	

insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199501,'Dhruba','O+','Male',22,0191101,'Dhaka');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199601,'Nila','A+','Female',21,0151102,'Dhaka');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199903,'Arkid','O+','Male',17,0161106,'Sylhet');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199801,'Barshan','B+','Male',09,0251101,'Khulna');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199204,'Arpita','O-','Female',22,0151101,'Barisal');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199312,'Jotee','A-','Male',12,0291101,'Rajshahi');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199912,'Jeenat','O-','Female',26,0141102,'Rangpur');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199012,'Manan','AB-','Male',22,5291101,'Chittagong');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199102,'Aradhya','B+','Female',17,0174101,'Barisal');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199402,'Neel','AB+','Male',25,0179201,'Sylhet');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (199104,'Ron','B-','Male',22,0189201,'Barisal');
insert into Donors (DonorNID,name,blood_group_id_fk,gender,age,contact,city) values (191104,'Wright','B+','Male',22,0189201,'Borguna');   


insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198101,'Pogba','O+','Male',25,0171101,'Dhaka');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198202,'Herrera','A+','Female',22,017110,'Rangpur');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198907,'Rashford','O+','Male',17,0171106,'Khulna');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198811,'Hazard','B+','Female',8,0171132,'Khulna');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198524,'Conte','O-','Female',32,0171192,'Barisal');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198102,'Dybala','A-','Male',43,0171121,'Dhaka');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198502,'Sanchez','AB-','Male',23,0171116,'Chittagong');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198802,'Harry','A-','Male',21,0172101,'Dhaka');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198002,'Antu','A+','Male',7,0174108,'Sylhet');
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (198312,'Corey','AB+','Male',7,0174108,'Sylhet');   
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (199102,'Aradhya','B+','Female',1,0174101,'Barisal'); 
insert into Recipients(RecipientNID,name,blood_group_id_fk,gender,age,contact,city) values (192102,'Anton','B+','Male',11,0173201,'Dinajpur');    

insert into BloodBanks (BloodBankID,name,city) values (01,'DMC','Dhaka');
insert into BloodBanks (BloodBankID,name,city) values (02,'KMC','Khulna');
insert into BloodBanks (BloodBankID,name,city) values (03,'Sylhet Medical','Sylhet');		
insert into BloodBanks (BloodBankID,name,city) values (04,'Barisal Medical','Barisal');
insert into BloodBanks (BloodBankID,name,city) values (05,'Rangpur Hospital','Rangpur');
insert into BloodBanks (BloodBankID,name,city) values (06,'Rajshahi Hospital','Rajshahi');
insert into BloodBanks (BloodBankID,name,city) values (07,'Chittagong Medical','Chittagong');   


--describe operation
describe BloodGroups;
describe BloodBanks;
describe BloodBagInBloodBanks;
describe Donors;
describe Recipients;
describe DonationToBloodBanks;
describe DonationToIndividuals; 

--select operation
select* from BloodGroups;
select* from BloodBanks;
select* from BloodBagInBloodBanks;
select* from Donors;
select* from Recipients;
select* from DonationToBloodBanks;
select* from DonationToIndividuals; 

--use of trigger
drop trigger TR_UPDATE_NUMBEROF_BLOOD_BAG;
CREATE OR REPLACE TRIGGER TR_UPDATE_NUMBEROF_BLOOD_BAG 
BEFORE DELETE OR INSERT OR UPDATE ON  DonationToBloodBanks
FOR EACH ROW 
DECLARE
   numberOfBloodBag number(10);
   bloodGroupNo varchar(3);
   var number(1);
BEGIN  
   numberOfBloodBag:=0;
   select blood_group_id_fk into bloodGroupNo from Donors where DonorNID= :new.donor_nid_fk; 
   select count(*) into var from BloodBagInBloodBanks where blood_group_id_fk=bloodGroupNo and blood_bank_id_fk=:new.donation_place_fk;
   
   IF var=0 THEN
   insert into BloodBagInBloodBanks (blood_group_id_fk,blood_bank_id_fk,number_of_bag) values(bloodGroupNo,:new.donation_place_fk,:new.no_of_bag);
   ElSIF var=1 THEN
   select number_of_bag into numberOfBloodBag from BloodBagInBloodBanks where blood_group_id_fk=bloodGroupNo and blood_bank_id_fk=:new.donation_place_fk;
   numberOfBloodBag:=numberOfBloodBag+1;
   UPDATE BloodBagInBloodBanks set number_of_bag=numberOfBloodBag where blood_group_id_fk=bloodGroupNo and blood_bank_id_fk=:new.donation_place_fk;
   END IF;
   
   
END; 
/

--inserting values
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199501,01,TO_DATE('12/01/2016', 'DD/MM/YYYY'),3);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199601,01,TO_DATE('22/03/2015', 'DD/MM/YYYY'),1);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199402,03,TO_DATE('25/05/2016', 'DD/MM/YYYY'),1);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199903,03,TO_DATE('17/02/2016', 'DD/MM/YYYY'),1);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199801,02,TO_DATE('12/08/2016', 'DD/MM/YYYY'),2);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199204,04,TO_DATE('02/01/2017', 'DD/MM/YYYY'),2);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199312,06,TO_DATE('19/03/2017', 'DD/MM/YYYY'),1);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199912,05,TO_DATE('21/11/2016', 'DD/MM/YYYY'),1);   
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199012,07,TO_DATE('29/02/2017', 'DD/MM/YYYY'),1); 
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199501,01,TO_DATE('12/09/2016', 'DD/MM/YYYY'),2);
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199601,01,TO_DATE('11/07/2016', 'DD/MM/YYYY'),1);     
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199501,01,TO_DATE('16/05/2015', 'DD/MM/YYYY'),1); 
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199204,04,TO_DATE('28/06/2016', 'DD/MM/YYYY'),1); 
insert into DonationToBloodBanks(donor_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199912,05,TO_DATE('23/07/2016', 'DD/MM/YYYY'),1); 


insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199501,198101,01,TO_DATE('12/01/2016', 'DD/MM/YYYY'),2);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199501,198907,02,TO_DATE('23/04/2015', 'DD/MM/YYYY'),1);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199204,198524,04,TO_DATE('29/09/2015', 'DD/MM/YYYY'),1);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199912,198524,04,TO_DATE('18/08/2016', 'DD/MM/YYYY'),3);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199312,198102,06,TO_DATE('27/09/2017', 'DD/MM/YYYY'),1);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199102,198811,04,TO_DATE('15/04/2016', 'DD/MM/YYYY'),1);
insert into DonationToIndividuals(donor_nid_fk,recipient_nid_fk,donation_place_fk,date_of_donation,no_of_bag) values (199402,198312,03,TO_DATE('28/09/2016', 'DD/MM/YYYY'),3);


--update operation
update Donors set blood_group_id_fk = 'O+' where name = 'Jeenat' and gender='Female';
update BloodBanks set name = 'Rajshahi Medical' where city = 'Rajshahi';

--delete operation
 delete from Recipients where age<=2;


--select by range
SELECT name, blood_group_id_fk FROM Donors WHERE age>= 10 AND age <=30;



--use of group by,order by
select name,blood_group_id_fk,age from Donors order by age desc;
select name,blood_group_id_fk,age from Recipients order by age asc;

--use of aggregate function
select COUNT(name) as number_of_donors from Donors;
select COUNT(name) as number_of_O_pos_blood_needed from Recipients where blood_group_id_fk = 'O+';
select COUNT(city) as Blood_recipient_of_Dhaka from Recipients where city like '%Dhaka%';
select max(gender) from Donors;
select min(blood_group_id_fk) from Recipients;
select avg(age) from Donors;
select avg(age) from Recipients;

--use of query
select age,name as Children from Recipients where age<=12;
select name as O_Pos_Blood from Donors where blood_group_id_fk LIKE '%O%';
select name as Universal_Donor from Donors where blood_group_id_fk = 'O+';


--use of subquery
select b_group,name as blood_recipient from recipient where b_group in (select b_group from blood_group where recipient.b_group=blood_group.b_group);

select name,age from Donors where blood_group_id_fk in 
(select blood_group_id_fk  from Recipients where Donors.blood_group_id_fk=Recipients.blood_group_id_fk);

select blood_bank_id_fk,blood_group_id_fk,number_of_bag as Number_of_bags from BloodBagInBloodBanks where blood_group_id_fk in 
(select blood_group_id_fk from Recipients where  BloodBagInBloodBanks.blood_group_id_fk=Recipients.blood_group_id_fk);

select name as Donors_available_for_recipients from Donors where city in
(select city  from Recipients where Donors.city=Recipients.city);


--use of set operation
select name,age from Donors where age>=10 UNION select r.name,r.age from Recipients r where r.city IN 
(select  d.city from Donors d where r.city=d.city);

select name,age from Donors  UNION select r.name,r.age from Recipients r where r.blood_group_id_fk IN 
(select  d.blood_group_id_fk from Donors d where r.blood_group_id_fk=d.blood_group_id_fk);

select name,age from Donors  UNION select r.name,r.age from Recipients r where r.blood_group_id_fk IN 
(select  d.blood_group_id_fk from Donors d where r.blood_group_id_fk=d.blood_group_id_fk) minus select name,age from Donors where age<=20;



--use join operation
select d.name,d.age,r.date_of_donation,r.no_of_bag FROM Donors d JOIN DonationToBloodBanks r ON d.DonorNID = r.donor_nid_fk;

select d.donor_nid_fk,d.donation_place_fk,d.no_of_bag,r.donor_nid_fk,r.donation_place_fk,r.no_of_bag FROM DonationToBloodBanks d INNER JOIN DonationToIndividuals r ON d.donor_nid_fk = r.donor_nid_fk;

select  d.name, d.blood_group_id_fk,r.name,r.blood_group_id_fk FROM Donors d right OUTER JOIN Recipients r ON d.city = r.city;

select  d.name, d.blood_group_id_fk,r.name,r.blood_group_id_fk FROM Donors d left OUTER JOIN Recipients r ON d.city = r.city;

SELECT  d.name, d.blood_group_id_fk,r.name,r.blood_group_id_fk FROM Donors d FULL OUTER JOIN Recipients r ON d.city = r.city;

SELECT  d.name, b.name FROM Donors d CROSS JOIN BloodBanks b;


--use of pl/sql
SET SERVEROUTPUT ON
DECLARE
   max_blood  DonationToBloodBanks.no_of_bag%type;
   donor_name    Donors.name%type;
BEGIN
      SELECT MAX(no_of_bag)  INTO max_blood  
   FROM DonationToBloodBanks;

   SELECT name  INTO donor_name 
   from Donors,DonationToBloodBanks 
   where Donors.DonorNID=DonationToBloodBanks.donor_nid_fk and no_of_bag=max_blood;
   DBMS_OUTPUT.PUT_LINE('The maximum number  bag of blood is : ' || max_blood || ' and donated by ' || donor_name );
 END;
/


SET  SERVEROUTPUT ON
DECLARE
  r_date DonationToIndividuals.date_of_donation%type;
  r_name  Recipients.name%type :='Pogba';
BEGIN
  SELECT date_of_donation INTO r_date
  FROM DonationToIndividuals, Recipients
  WHERE DonationToIndividuals.recipient_nid_fk = Recipients.RecipientNID AND
  name = r_name;  
  DBMS_OUTPUT.PUT_LINE('Patient : ' || r_name || ' received blood on '|| r_date);
END;
/



--use of procedure
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE donorname IS 
d_city Donors.city%type := 'Chittagong';
d_name Donors.name%type;

BEGIN

select name into d_name 
 from Donors where city=d_city;
DBMS_OUTPUT.PUT_LINE('Donors: '||d_name);
END donorname;
/
SHOW ERRORS;
BEGIN
   donorname;
END;
/
