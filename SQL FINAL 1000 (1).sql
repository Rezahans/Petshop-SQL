--CREATE DATABASE--
CREATE DATABASE PETSHOP_FINAL

--CREATE SCHEMA--
create schema human
create schema product
create schema trans

--USE STATEMENT--
USE PETSHOP_FINAL

/*TABLE HUMAN*/
--TABLE STAFF--
create table Human.staff (
ID_Staff varchar(8) not null primary key,
			constraint pkID_Staff
			check (ID_Staff like ('[S][0-9][0-9]')),
ID_Staffinfo varchar(8) Foreign Key references human.staffinfo(ID_staffinfo),
			constraint chkID_Staffinfo
			check (ID_Staffinfo like ('[S][I][0-9][0-9]')),
Staff_Name varchar(50) not null)

--TABLE STAFFINFO--
create table human.staffinfo (
ID_staffinfo varchar(8) not null primary key,
			constraint ID_staffinfo
			check (ID_staffinfo like ('[S][I][0-9][0-9]')),
staff_Gender varchar(10) check (staff_Gender Like 'Male' or staff_Gender Like 'Female') NOT NULL,
staff_Birth date not null,
			constraint chkstaff_Birth
			check(staff_Birth <= getdate()),
staff_Telp varchar(15) not null,
			constraint chkstaff_Telp
			check (staff_Telp like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),
staff_Add varchar(50) not null,
staff_Status varchar(10) check (staff_Status Like 'Active' or staff_Status Like 'NON-Active') NOT NULL,
)


--Table Member--
create table Human.Member(
ID_Member varchar(8) not null primary key,
			constraint pkID_Member
			check (ID_Member like ('[M][0-9][0-9][0-9][0-9]')),
ID_MemberInfo varchar(15) foreign key references Human.MemberInfo (ID_MemberInfo),
			constraint chkID_MemberInfo
			check (ID_MemberInfo like ('[M][I][0-9][0-9][0-9][0-9]')),
Member_Name varchar(50) not null)

--Table MemberInfo--
create table Human.Memberinfo (
ID_MemberInfo varchar(15) not null primary key,
			constraint pkID_MemberInfo
			check (ID_MemberInfo like ('[M][I][0-9][0-9][0-9][0-9]')),
Member_Gender varchar(10) check (Member_Gender like 'Male' or Member_Gender like 'Female') NOT NULL,
Member_Birth date not null,
				constraint chkMember_Birth
				check (Member_Birth <= getdate()),
Member_Telp varchar(15) not null,
			constraint chkMember_Telp
			check ( Member_Telp like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),
Member_Add varchar(50) not null,
Member_Status varchar(10) check (Member_Status like 'Active' or Member_Status like 'NON-active') not null,
)


/*TABLE PRODUCT*/
--Table FoodInfo--
create table product.Foodinfo(
ID_Foodinfo varchar(10) not null primary key,
			constraint pkID_Foodinfo
			check (ID_Foodinfo like ('[F][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Food_Type varchar(15) not null,
Food_Name varchar(50) not null,
Food_Expired date not null,
Food_Stock int not null)

--Table Food--
create table product.Food(
ID_Food varchar(10) not null primary key,
			constraint pkID_Food
			check (ID_Food like ('[F][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_FoodInfo varchar(10) Foreign Key references product.FoodInfo(ID_FoodInfo),
			constraint chkID_Foodkinfo
			check (ID_Foodinfo like ('[F][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Food_Category varchar(50) not null,
Food_Name varchar(50)not null)

--Table TreatInfo--
create table product.TreatInfo(
ID_Treatinfo varchar(10) not null primary key,
			constraint pkID_Treatinfo
			check (ID_Treatinfo like ('[T][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Treat_Type varchar(15) not null,
Treat_Name varchar(50) not null,
Treat_Pickup date not null,
Treat_Drop date not null)

--Table Treat--
create table product.Treat(
ID_Treat varchar(10) not null primary key,
			constraint pkID_Treat
			check (ID_Treat like ('[T][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_TreatInfo varchar(10) Foreign Key references product.TreatInfo(ID_TreatInfo),
			constraint chkID_Treatinfo
			check (ID_Treatinfo like ('[T][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Treat_Category varchar(50) not null,
Treat_Name varchar(50)not null)



--Table accessoriesinfo--
create table product.accessoriesinfo(
ID_accessoriesinfo varchar(10) not null primary key,
			constraint pkID_accessoriesinfo
			check (ID_accessoriesinfo like ('[A][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
accessories_Type varchar(15) not null,
accessories_Name varchar(50) not null,
accessories_Stock int not null)

--Table accessories--
create table product.accessories(
ID_accessories varchar(10) not null primary key,
			constraint pkID_accessories
			check (ID_accessories like ('[A][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_accessoriesInfo varchar(10) Foreign Key references product.accessoriesInfo(ID_accessoriesInfo),
			constraint chkID_accessorieskinfo
			check (ID_accessoriesinfo like ('[A][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
accessories_Category varchar(50) not null,
accessories_Name varchar(50)not null)

--Table Transaction--
create table trans.Transaction1 (
ID_Member varchar(8) Foreign Key references Human.Member(ID_Member),
			constraint chkID_Member
			check (ID_Member like ('[M][0-9][0-9][0-9][0-9]')),
ID_MemberInfo varchar(15) not null primary key,
			constraint pkID_MemberInfo
			check (ID_MemberInfo like ('[M][I][0-9][0-9][0-9][0-9]')),
ID_Staff varchar(8) not null foreign key references human.staff(ID_staff),
			constraint pkID_Staff
			check (ID_Staff like ('[S][0-9][0-9]')),
ID_staffinfo varchar(8) not null foreign key references human.staffinfo(ID_Staffinfo),
			constraint ID_staffinfo
			check (ID_staffinfo like ('[S][I][0-9][0-9]')),
ID_Food varchar(10) Foreign Key references product.Food(ID_Food),
			constraint chkID_Food
			check (ID_Food like ('[F][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_FoodInfo varchar(10) Foreign Key references product.FoodInfo(ID_FoodInfo),
			constraint chkID_FoodInfo
			check (ID_FoodInfo like ('[F][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_Treat varchar(10) Foreign Key references product.Treat(ID_Treat),
			constraint chkID_Treat
			check (ID_Treat like ('[T][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_TreatInfo varchar(10) Foreign Key references product.TreatInfo(ID_TreatInfo),
			constraint chkID_TreatInfo
			check (ID_TreatInfo like ('[T][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_Accessories varchar(10) Foreign Key references product.Accessories(ID_Accessories),
			constraint chkID_Accessories
			check (ID_Accessories like ('[A][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_AccessoriesInfo varchar(10) Foreign Key references product.AccessoriesInfo(ID_AccessoriesInfo),
			constraint chkID_AccessoriesInfo
			check (ID_AccessoriesInfo like ('[A][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Food_Name varchar(50) not null,
Quantity int not null,
Loan_Date Date default getdate(),
Due_Date Date)

--INSERT MEMBER INFO--
Insert Into human.Memberinfo values ('MI0211','Female','1992/11/27','082330602071','jl.pegangsaan raya no.128','active')
Insert Into human.Memberinfo values ('MI0212','Male','1992/01/12','082330602071','jl.pegangsaan anyer','active')
Insert Into human.Memberinfo values ('MI0213','Male','1993/09/19','082330602071','jl.kawah sakti II','active')
Insert Into human.Memberinfo values ('MI0214','Female','1990/02/17','082330602071','jl.Surya Permai II','active')
Insert Into human.Memberinfo values ('MI0215','Female','1990/06/13','082330602071','jl.Wijaya Kusuma 3','active')
Insert Into human.Memberinfo values ('MI0216','Male','1997/02/21','082330602071','jl.Agung Tirtayasa','active')
Insert Into human.Memberinfo values ('MI0217','Female','1999/07/22','082330602071','jl.Surya asih','active')
Insert Into human.Memberinfo values ('MI0218','Female','1994/11/01','082330602071','jl.Duren salatiga','active')
Insert Into human.Memberinfo values ('MI0219','Male','1992/11/11','082330602071','jl.Surya asri 2','active')
--INSERT MEMBER--
insert into human.Member values ('M0123','MI0211','Fitria')
insert into human.Member values ('M0124','MI0212','Agus')
insert into human.Member values ('M0125','MI0213','Rayan')
insert into human.Member values ('M0126','MI0214','Sri')
insert into human.Member values ('M0127','MI0215','Indah')
insert into human.Member values ('M0128','MI0216','Bambang')
insert into human.Member values ('M0129','MI0217','Dian')
insert into human.Member values ('M0130','MI0218','Naura')
insert into human.Member values ('M0131','MI0219','Taufal')

--INSERT STAFF--
insert into human.staff values ('S01','SI01','Putri')
insert into human.staff values ('S02','SI02','Roni')
insert into human.staff values ('S03','SI03','Dio')
insert into human.staff values ('S04','SI04','Sari')
insert into human.staff values ('S05','SI05','Kusumaningsih')
--INSERT STAFF INFO--
insert into human.staffinfo values ('SI01','Female','1992/01/09','0812123234096','Jl.Kereta tirta no 127','active')
insert into human.staffinfo values ('SI02','Male','1993/10/20','081219976926','Jl.Becak Satu','active')
insert into human.staffinfo values ('SI03','Male','1997/12/20','081219890526','Jl.Becak kayu no 20','active')
insert into human.staffinfo values ('SI04','Female','1990/02/01','081256723123','Jl.Surya Pro 2','active')
insert into human.staffinfo values ('SI05','Female','1999/09/11','081203923090','Jl.Air Sumber','active')

--INSERT ACCESSORIES INFO--
Insert Into Product.AccessoriesInfo 
values('AI0976453','Bracelet','Cat Charm Bracelet','12')
Insert Into Product.AccessoriesInfo 
values('AI0998712','Bracelet','Whiskas Bracelet','12')
Insert Into Product.AccessoriesInfo 
values('AI0912345','Bracelet','Me-o Bracelet','12')
Insert Into Product.AccessoriesInfo 
values('AI0955334','Bracelet','Hill’s Bracelet','12')
Insert Into Product.AccessoriesInfo 
values('AI0989765','Bracelet','Purina Bracelet','12')
Insert Into Product.AccessoriesInfo 
values('AI0911245','Necklace','Royal Necklace','12')
Insert Into Product.AccessoriesInfo 
values('AI0976987','Necklace','Whiskas Necklace','12')
Insert Into Product.AccessoriesInfo 
values('AI0956443','Necklace','Pro Necklace','12')
Insert Into Product.AccessoriesInfo 
values('AI0991278','Necklace','Friskies Necklace','12')
Insert Into Product.AccessoriesInfo 
values('AI0966779','Necklace','Sheba Necklace','12')
Insert Into Product.AccessoriesInfo 
values('AI0933559','Rope','Royal Rope','12')
Insert Into Product.AccessoriesInfo 
values('AI0922659','Rope','Canin Rope','12')
Insert Into Product.AccessoriesInfo 
values('AI0978432','Rope','Bill Rope','12')
Insert Into Product.AccessoriesInfo 
values('AI0914924','Rope','Alpo Rope','12')
Insert Into Product.AccessoriesInfo 
values('AI0999116','Rope','Science Rope','12')
--INSERT ACCESSORIES--
Insert Into Product.Accessories
values('A0976453','AI0976453','CatBracelet','Cat Charm Bracelet')
Insert Into Product.Accessories 
values('A0998712','AI0998712','CatBracelet','Whiskas Bracelet')
Insert Into Product.Accessories 
values('A0912345','AI0912323','CatBracelet','Meo Bracelet','12')
Insert Into Product.Accessories 
values('A0955334','AI0955334','CatBracelet','Hill’s Bracelet')
Insert Into Product.Accessories 
values('A0989765','AI0989765','CatBracelet','Purina Bracelet')
Insert Into Product.Accessories 
values('A0911245','AI0911245','CatNecklace','Royal Necklace')
Insert Into Product.Accessories 
values('A0976987','AI0976987','CatNecklace','Whiskas Necklace')
Insert Into Product.Accessories 
values('A0956443','AI0956443','CatNecklace','Pro Necklace')
Insert Into Product.Accessories 
values('A0991278','AI0991278','CatNecklace','Friskies Necklace')
Insert Into Product.Accessories 
values('A0966779','AI0966779','CatNecklace','Sheba Necklace')
Insert Into Product.Accessories 
values('A0933559','AI0933559','Rope','Royal Rope')
Insert Into Product.Accessories 
values('A0922659','AI0922659','Rope','Canin Rope')
Insert Into Product.Accessories 
values('A0978432','AI0978432','Rope','Bill Rope')
Insert Into Product.Accessories 
values('A0914924','AI0914924','Rope','Alpo Rope')
Insert Into Product.Accessories 
values('A0999116','AI0999116','Rope','Science Rope')

--INSERT FOOD--
Insert Into Product.Food
values('F876453','FI0876453','CatFood','Royal Canin Persia Adult')
Insert Into Product.Food
values('F898712','FI0898712','CatFood','Whiskas Dry Adult Hairball Chicken & Tuna Flavour')
Insert Into Product.Food
values('F312345','FI0812345','CatFood','Meo Dry Food')
Insert Into Product.Food
values('F485334','FI0855334','CatFood','Hill Prescription Chicken')
Insert Into Product.Food
values('F588765','FI0889765','CatFood','Purina Cat Food')
Insert Into Product.Food
values('F681145','FI0811245','CatFood','Royal Canin Babycat')
Insert Into Product.Food
values('F787697','FI0876987','CatFood','Whiskas Pouch Junior')
Insert Into Product.Food
values('F885644','FI0856443','CatFood','Pro Plan Cat Adult Sensitive')
Insert Into Product.Food
values('F189127','FI0891278','CatFood','Friskies Pure Tuna')
Insert Into Product.Food
values('F286677','FI0866779','CatFood','Sheba Pouch Makanan Basah Kucing')
Insert Into Product.Food
values('F383355','FI0833559','CatFood','Canin')
Insert Into Product.Food
values('F482265','FI0822659','CatFood','Royal')
Insert Into Product.Food
values('F587843','FI0878432','CatFood','Astdro')
Insert Into Product.Food
values('F581492','FI0814924','CatFood','Alpo')
Insert Into Product.Food
values('F689911','FI0899116','CatFood','Science Diet')
--INSERT FOOD INFO--
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0876453','Dry','Royal Canin Persia Adult','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0898712','Dry','Whiskas Dry Adult Hairball Chicken & Tuna Flavour','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0812345','Dry','Me-o Dry Food','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0855334','Dry','Hills Chicken','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0889765','Dry','Purina Friskies Seafood Sensations Dry Cat Food','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0811245','Wet','Royal Canin Mother & Babycat','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0876987','Wet','Whiskas Pouch Junior','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0856443','Wet','Pro Plan Cat Adult Sensitive','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0891278','Wet','Friskies Pure Tuna','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0866779','Wet','Sheba Pouch Makanan Basah Kucing','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0833559','Dry','Royal Canin','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0822659','Wet','Royal Canin','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0878432','Dry','Alpo','2023','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0814924','Wet','Alpo','2022','12')
Insert Into Product.FoodInfo(ID_Foodinfo,Food_Type,Food_Name,Food_Expired,Food_Stock)
values('FI0899116','Wet','Science Diet','2022','12')


--INSERT TREAT INFO--
Insert Into Product.TreatInfo 
values('TI0776453','animal hygiene','Bathing the Cat','2021-12-7','2021-12-7')
Insert Into Product.TreatInfo 
values('TI0798712','animal hygiene','cat parfume','2021-12-8','2021-12-8')
Insert Into Product.TreatInfo 
values('TI0712345','animal hygiene','Shampooing cat','2021-12-6','2021-12-6')
Insert Into Product.TreatInfo 
values('TI0778432','animal health','cat dental health','2021-12-6','2021-12-6')
Insert Into Product.TreatInfo 
values('TI0714924','animal health','cat hair health','2021-12-4','2021-12-4')
Insert Into Product.TreatInfo 
values('TI0799116','animal health','cat eye health','2021-12-5','2021-12-5')
--INSERT TREAT--
Insert Into Product.Treat 
values('T776453','TI0776453','cat hygiene','Bathing Cat')
Insert Into Product.Treat 
values('T798712','TI0798712','cat hygiene','cat parfume')
Insert Into Product.Treat 
values('T712345','TI0712345','cat hygiene','Shampooing cat')
Insert Into Product.Treat 
values('T778432','TI0778432','cat health','cat dental health')
Insert Into Product.Treat 
values('T714924','TI0714924','cat health','cat hair health')
Insert Into Product.Treat
values('T799116','TI0799116','cat health','cat eye health')


--CREATE PROCEDURE MEMBER--
/*Insert Procedure Member*/
create procedure insertmember 
		@ID_Member varchar(8),
		@ID_MemberInfo varchar(8),
		@Member_Name varchar(50)
as
	begin 
		insert into human.Member values
		(@ID_Member,@ID_MemberInfo,@Member_Name)
	end

exec insertmember  @ID_Member='',@ID_MemberInfo='',@Member_Name=''
select * from human.Member

--Update Procedure Member
create procedure updatemember
		@ID_Member varchar(8),
		@ID_MemberInfo varchar(8),
		@Member_Name varchar(50)
as
		begin
			update human.Member set
			@ID_Member=@ID_Member,@ID_MemberInfo=@ID_MemberInfo,@Member_Name=@Member_Name
		end

exec updatemember  @ID_Member='',@ID_MemberInfo='',@Member_Name=''
select*from human.Member


/*Delete Procedure Member*/
create procedure deletemember
		@ID_Member varchar(8)
as
delete from human.Member where @ID_Member=@ID_Member


exec deletemember  @ID_Member=''
select*from human.Member

--CREATE PROCEDURE MEMBER INFO--
/*Insert Procedure Member_Info*/
create procedure insertmemberinfo 
		@ID_memberinfo varchar(15),
		@member_Gender varchar(10),
		@member_Birth date,
		@member_Telp varchar(15),
		@member_Add varchar(50),
		@member_Status varchar(10)
as
	begin 
		insert into human.Memberinfo values
		(@ID_memberinfo,@member_Gender,@member_Birth,@member_Telp,@member_Add,@member_Status)
	end

exec insertmemberinfo  @ID_memberinfo='',@member_Gender='',@member_Birth='',@member_Telp=,@member_Add='',@member_Status=''
select * from human.Memberinfo

/*Update Procedure Member_Info*/
create procedure Updatememberinfo 
		@ID_memberinfo varchar(15),
		@member_Gender varchar(10),
		@member_Birth date,
		@member_Telp varchar(15),
		@member_Add varchar(50),
		@member_Status varchar(10)
as
	begin 
		update human.Memberinfo set
		@ID_memberinfo=@ID_memberinfo,@member_Gender=@member_Gender,@member_Birth=@member_Birth,@member_Telp=@member_Telp,@member_Add=@member_Add,@member_Status=@member_Status
	end

exec Updatememberinfo  @ID_memberinfo='',@member_Gender='',@member_Birth='',@member_Telp=,@member_Add='',@member_Status=''

/*Delete Procedure Member_Info*/
create procedure deletememberinfo 
		@ID_memberinfo varchar(15),
		@member_Gender varchar(10),
		@member_Birth date,
		@member_Telp varchar(15),
		@member_Add varchar(50),
		@member_Status varchar(10)
as
		delete from human.Memberinfo where @ID_memberinfo=@ID_memberinfo

exec deletememberinfo 	@member_Gender='',@member_Birth='', @member_Telp='',@member_Add='',@member_Status='',@ID_memberinfo='MI1234'

--CREATE PROCEDURE STAFF--
/*Insert Procedure Staff*/
create procedure insertstaff
		@ID_staff varchar(8),
		@ID_Staffinfo varchar(8),
		@Staff_Name varchar(50)
as
		begin
			insert into human.staff values
			(@ID_staff,@ID_Staffinfo,@Staff_Name)
		end
exec insertstaff @ID_staff='',@ID_Staffinfo='',@Staff_Name=''
select*from human.staff


/*Update Procedure Staff*/
create procedure Updatestaff
		@ID_staff varchar(8),
		@ID_Staffinfo varchar(8),
		@Staff_Name varchar(50)
as
		begin
			update human.staff set
			@ID_staff=@ID_staff,@ID_Staffinfo=@ID_Staffinfo,@Staff_Name=@Staff_Name
		end
exec Updatestaff @ID_staff='',@ID_Staffinfo='',@Staff_Name=''
select*from human.staff

/*Delete Procedure Staff*/
create procedure Deletestaff
		@ID_staff varchar(8),
		@ID_Staffinfo varchar(8),
		@Staff_Name varchar(50)
as
delete from human.staff where @ID_staff=@ID_staff
			
exec Deletestaff @ID_staff=''
select*from human.staff

--CREATE PROCEDURE STAFF INFO--
/*Insert Procedure StaffInfo*/
create procedure insertstaffinfo
		@ID_staffinfo varchar(8),
		@staff_Gender varchar(10), 
		@staff_Birth date,
		@staff_Telp varchar(15),
		@staff_Add varchar(50),
		@staff_Status varchar(10)
as
		begin
			insert into human.staffinfo values
			(@ID_Staffinfo,@staff_Gender,@staff_Birth,@staff_Telp,@staff_Add,@staff_Status)
		end
exec insertstaff @ID_staff='',@ID_Staffinfo='',@Staff_Name=''
select*from human.staffinfo

/*Update Procedure StaffInfo*/
create procedure updatestaffinfo
		@ID_staffinfo varchar(8),
		@staff_Gender varchar(10), 
		@staff_Birth date,
		@staff_Telp varchar(15),
		@staff_Add varchar(50),
		@staff_Status varchar(10)
as
		begin
			update human.staffinfo set
			@ID_Staffinfo=@ID_staffinfo,@staff_Gender=@staff_Gender,@staff_Birth=@staff_Birth,@staff_Telp=@staff_Telp,@staff_Add=@staff_Add,@staff_Status=@staff_Status
		end
exec updatestaffinfo @ID_staff='',@ID_Staffinfo='',@Staff_Name=''
select*from human.staffinfo

/*Delete Procedure StaffInfo*/
create procedure deletestaffinfo
		@ID_staffinfo varchar(8),
		@staff_Gender varchar(10), 
		@staff_Birth date,
		@staff_Telp varchar(15),
		@staff_Add varchar(50),
		@staff_Status varchar(10)
as
delete from human.staffinfo where @ID_staffinfo=@ID_staffinfo
	
exec deletestaffinfo @ID_Staffinfo='',@staff_Gender='',@staff_Birth='',@staff_Telp='',@staff_Add='',@staff_Status=''
select*from human.staffinfo

--CREATE PROCEDURE FOOD INFO--
/*Procedure_Insert_FoodInfo*/
create procedure InsertFoodInfo
		@ID_FoodInfo varchar(10),
		@Food_Type varchar(15),
		@Food_Name varchar(50),
		@Food_Expired date,
		@Food_Stock varchar(5)
	
as
	begin
		insert into Product.FoodInfo values
		(@ID_FoodInfo,@Food_Type,@Food_Name,@Food_Expired,@Food_Stock)
	end

exec InsertFoodInfo @ID_FoodInfo='FI08136450',@Food_Type='Cat Food',@Food_Name='Whiskas', @Food_Expired='2022-12-21', @Food_Stock='100'


select * from product.FoodInfo

/*Procedure_Update_FoodInfo*/
create procedure UpdateFoodInfo
		@ID_FoodInfo varchar(10),
		@Food_Type varchar(15),
		@Food_Name varchar(50),
		@Food_Expired date,
		@Food_Stock varchar(5)
as
	begin
		update product.FoodInfo set
		Food_Type=@Food_Type,Food_Name=@Food_Name,Food_Expired=@Food_Expired,Food_Stock=@Food_Stock 
		where ID_FoodInfo=@ID_FoodInfo
	end

exec UpdateFoodInfo @ID_BookInfo='FI0813645',@Food_Type = 'Cat', @Food_Name='Whiskas',Food_Expired = '2022-2-15',  @Food_Stock='100'
select * from product.FoodInfo

/*Procedure_Delete_FoodInfo*/
create procedure DeleteFoodInfo
@ID_FoodInfo varchar(10)
as
Delete from product.FoodInfo where @ID_FoodInfo=ID_FoodInfo

exec DeleteFoodInfo @ID_FoodInfo='FI08136450'
select * from product.FoodInfo

--CREATE PROCEDURE FOOD--
/*Procedure_Insert_Food*/
create procedure InsertFood
		@ID_Food varchar(10),
		@ID_FoodInfo varchar(10),
		@Food_Category varchar(50),
		@Food_Name varchar(50)
as
	begin
		insert into product.Food values
		(@ID_Food,@ID_FoodInfo,@Food_Category,@Food_Name)
	end

exec InsertFood @ID_Food='FI08136450',@ID_FoodInfo='FI08136450',@Food_Category='Cat',@Food_Name='Whiskas'
select * from product.Food


/*Procedure_Update_Food*/
create procedure UpdateFood
		@ID_Food varchar(10),
		@ID_FoodInfo varchar(10),
		@Food_Category varchar(50),
		@Food_Name varchar(50)
as
	begin
		update product.Food set
		ID_FoodInfo=@ID_FoodInfo,Food_Category=@Food_Category,Food_Name=@Food_Name 
		where ID_Food=@ID_Food
	end

exec UpdateFood @ID_Food='FI8136450',@ID_FoodInfo='FI08136450',@Food_Category='Cat',@Food_Name='Proplan'
select * from product.Food


/*Procedure_Delete_Food*/
create procedure DeleteFood
@ID_Food varchar(10)
as
Delete from product.Food where ID_Food=@ID_Food

exec DeleteFood @ID_Food='FI08136450'


--CREATE PROCEDURE TREAT INFO--
/*Procedure_Insert_TreatInfo*/
create procedure InsertTreatInfo
		@ID_TreatInfo varchar(10),
		@Treat_Type varchar(15),
		@Treat_Name varchar(50),
		@Treat_Pickup date,
		@Treat_Drop date
	
as
	begin
		insert into product.TreatInfo values
		(@ID_TreatInfo,@Treat_Type,@Treat_Name,@Treat_Pickup,@Treat_Drop)
	end

exec InsertTreatInfo @ID_TreatInfo='FI08136450',@Treat_Type='Cat',@Treat_Name = 'Katty', @Treat_Pickup='2021-11-30', @Treat_Drop = '2021-12-01'


select * from product.TreatInfo

/*Procedure_Update_TreatInfo*/
create procedure UpdateTreatInfo
		@ID_TreatInfo varchar(10),
		@Treat_Type varchar(15),
		@Treat_Name varchar(50),
		@Treat_Pickup date,
		@Treat_Drop date
as
	begin
		update product.TreatInfo set
		@Treat_Type=@Treat_Type,@Treat_Name=@Treat_Name,@Treat_Pickup=@Treat_Pickup , @Treat_Drop = @Treat_Drop 
		where @ID_TreatInfo=@ID_TreatInfo
	end

exec UpdateTreatInfo @ID_TreatInfo='FI0813645',@Treat_Type = 'cat', @Treat_Name= 'katty', @Treat_Pickup = '2021-11-30',  @Treat_Drop = '2021-12-1'
select * from product.TreatInfo

/*Procedure_Delete_TrearInfo*/
create procedure DeleteTreatInfo
@ID_TreatInfo varchar(10)
as
Delete from product.TreatInfo where @ID_TreatInfo =ID_TreatInfo

exec DeleteTreatInfo @ID_TreatInfo='FI08136450'
select * from product.TreatInfo

--CREATE PROCEDURE TREAT--
/*Procedure_Insert_Treat*/
create procedure InsertTreat
		@ID_Treat varchar(10),
		@ID_TreatInfo varchar(15),
		@Treat_Category varchar(50),
		@Treat_Name varchar(50)
	
as
	begin
		insert into product.Treat values
		(@ID_Treat,@ID_TreatInfo,@Treat_Category,@Treat_Name)
	end

exec InsertTreatInfo @ID_Treat='FI8136450',@ID_TreatInfo ='FI08136450', @Treat_Category ='Dental Treat', @Treat_Name ='Cat'

select * from product.Treat

/*Procedure_Update_Treat*/
create procedure UpdateTreat
		@ID_Treat varchar(10),
		@ID_TreatInfo varchar(15),
		@Treat_Category varchar(50),
		@Treat_Name varchar(50)
	
as
	begin
		update product.Treat set
		@ID_Treat = @ID_Treat,@Treat_Category = @Treat_Category, @Treat_Name = @Treat_Name
		where @ID_Treat = @ID_Treat
	end
exec UpdateTreat @ID_Treat='FI0813645',@Treat_Category =' Dental Treat', @Treat_Name = 'Dog'
select * from product.Treat

/*Procedure_Delete_Treat*/
create procedure DeleteTreat
@ID_Treat varchar(10)
as
Delete from product.Treat where @ID_Treat=ID_Treat

exec DeleteTreat @ID_Treat='FI08136450'
select * from product.Treat

--CREATE PROCEDURE TRANSACTION--
/*Procedure Insert Transaction1*/
create procedure Insert_Transaction1
	@ID_Transaction1 varchar(8),
	@ID_Member varchar(8),
	@ID_Food varchar(10),
	@ID_FoodInfo varchar(10),
	@ID_Treat varchar(10),
	@ID_TreatInfo varchar(10),
	@ID_Accessories varchar(10),
	@ID_AccessoriesInfo varchar(10),
	@Quantity int
	
as
begin
	insert into Trans.Transaction1 values
	(@ID_Transaction1,@ID_Member,@ID_Food,@ID_FoodInfo,@ID_Treat,@ID_TreatInfo,@ID_Accessories,@ID_AccessoriesInfo,@Quantity)
end

Exec Insert_Transaction1 @ID_Transaction1='',@ID_Member='',@ID_Food='',@ID_FoodInfo='',@ID_Treat='',@ID_TreatInfo='',@ID_Accessories='',@ID_AccessoriesInfo='',@Quantity='',@Loan_Date='',@Due_Date=''
select * from Product.FoodInfo
select * from Trans.Transaction1

--CREATE TRIGGER FOOD INFO--
/*Trigger_Update_FoodInfo*/
CREATE TRIGGER UpdateFoodInfo
On product.FoodInfo
after insert, Update
AS
BEGIN
		Declare 
		 @ID_FoodInfo varchar(10),
		 @Food_Type varchar(15),
		 @Food_Name varchar(50),
		 @Food_Expired varchar(50),
		 @Food_Stock varchar(5)

select @ID_FoodInfo=ID_FoodInfo,@Food_Type=Food_Type,@Food_Expired=Food_Expired ,@Food_Stock=Food_Stock from inserted

Print '===The Data Has Been Updated==='
Print 'ID FoodInfo   : '+@ID_FoodInfo
Print 'Type          : '+@Food_Type
Print 'Name          : '+@Food_Name
Print 'Expired       : '+@Food_Expired
Print 'Stock         : '+@Food_Stock
END


/*Trigger_Delete_FoodInfo*/
CREATE TRIGGER DeleteFoodInfo
On product.FoodInfo for Delete
AS
BEGIN
		Declare 
		 @ID_FoodInfo varchar(10),
		 @Food_Type varchar(15),
		 @Food_Name varchar(50),
		 @Food_Expired varchar(50),
		 @Food_Stock varchar(5)

select @ID_FoodInfo=ID_FoodInfo,@Food_Type=Food_Type,@Food_Expired=Food_Expired ,@Food_Stock=Food_Stock from deleted

Print '===The Data Has Been Deleted==='
Print 'ID FoodInfo   : '+@ID_FoodInfo
Print 'Type          : '+@Food_Type
Print 'Name          : '+@Food_Name
Print 'Expired       : '+@Food_Expired
Print 'Stock         : '+@Food_Stock
END

--CREATE TRIGGER FOOD--
/*Trigger_Update_Food*/
CREATE TRIGGER UpdateFood
On product.Food
after insert, Update
AS
BEGIN
		Declare 
		@ID_Food varchar(10),
		@ID_FoodInfo varchar(10),
		@Food_Category varchar(50),
		@Food_Name varchar(50)

select @ID_Food=ID_Food, @ID_FoodInfo=ID_FoodInfo, @Food_Category=Food_Category, @Food_Name=Food_Name  from inserted

Print '===The Data Has Been Updated==='
Print 'ID Food		 : '+@ID_Food
Print 'ID FoodInfo   : '+@ID_FoodInfo
Print 'Category      : '+@Food_Category
Print 'Name		     : '+@Food_Name
END


/*Trigger_Delete_Food*/
CREATE TRIGGER TR_DeleteFood
On product.Food for Delete
AS
BEGIN
		Declare 
		@ID_Food varchar(10),
		@ID_FoodInfo varchar(10),
		@Food_Category varchar(50),
		@Food_Name varchar(50)

select @ID_Food=ID_Food, @ID_FoodInfo=ID_FoodInfo, @Food_Category=Food_Category, @Food_Name=Food_Name from deleted

Print '===The Data Has Been Deleted==='
Print 'ID Food		 : '+@ID_Food
Print 'ID FoodInfo   : '+@ID_FoodInfo
Print 'Category      : '+@Food_Category
Print 'Name          : '+@Food_Name

END

--CREATE TRIGGER ACCESSORIES INFO--
/*Trigger_Update_accessoriesinfo*/
CREATE TRIGGER Updateaccessoriesinfo
On Product.accessoriesinfo
after insert, Update
AS
BEGIN
		Declare 
		@ID_accessoriesinfo varchar(10),
		@accessories_Type varchar(15),
		@accessories_Name varchar(50),
		@accessories_Stock varchar(5)

select @ID_accessoriesinfo=ID_accessoriesinfo,@accessories_Type=accessories_Type,@accessories_Name=accessories_Name ,@accessories_Stock=accessories_Stock from inserted

Print '===The Data Has Been Updated==='
Print 'ID accessoriesinfo   : '+@ID_accessoriesinfo
Print 'Type					: '+@accessories_Type
Print 'Name					: '+@accessories_Name
Print 'Stock				: '+@accessories_Stock
END


/*Trigger_Delete_accessoriesinfo*/
CREATE TRIGGER Deleteaccessoriesinfo
On Product.accessoriesinfo for Delete
AS
BEGIN
		Declare 
		@ID_accessoriesinfo varchar(10),
		@accessories_Type varchar(15),
		@accessories_Name varchar(50),
		@accessories_Stock varchar(5)

select @ID_accessoriesinfo=ID_accessoriesinfo,@accessories_Type=accessories_Type,@accessories_Name=accessories_Name ,@accessories_Stock=accessories_Stock from deleted

Print '===The Data Has Been Deleted=='
Print 'ID accessoriesinfo   : '+@ID_accessoriesinfo
Print 'Type					: '+@accessories_Type
Print 'Name					: '+@accessories_Name
Print 'Stock				: '+@accessories_Stock
END

--CREATE TRIGGER ACCESSORIES--
/*Trigger_Update_accessories*/
CREATE TRIGGER Updateaccessories
On Product.accessories
after insert, Update
AS
BEGIN
		Declare 
		@ID_accessories varchar(10),
		@accessories_category varchar(15),
		@accessories_Name varchar(50)

select @ID_accessories=ID_accessories, @accessories_Category=accessories_Category, @accessories_Name=accessories_Name  from inserted

Print '===The Data Has Been Updated==='
Print 'ID accessories: '+@ID_accessories
Print 'Category      : '+@accessories_Category
Print 'Name		     : '+@accessories_Name
END


/*Trigger_Delete_accessories*/
CREATE TRIGGER TR_Deleteaccessories
On Product.accessories for Delete
AS
BEGIN
		Declare 
		@ID_accessories varchar(10),
		@accessories_category varchar(15),
		@accessories_Name varchar(50)

select @ID_accessories=ID_accessories, @accessories_Category=accessories_Category, @accessories_Name=accessories_Name from deleted

Print '===The Data Has Been Deleted==='
Print 'ID accessories: '+@ID_accessories
Print 'Category      : '+@accessories_Category
Print 'Name          : '+@accessories_Name
END


--CREATE TRIGGER TREAT--
/*Trigger_Update_TreatInfo*/
CREATE TRIGGER UpdateTreatInfo
On Product.TreatInfo
after insert, Update
AS
BEGIN
		Declare 
		@ID_TreatInfo varchar(10),
		@Treat_Type varchar(15),
		@Treat_Name varchar(50),
		@Treat_Pickup varchar(50),
		@Treat_Drop varchar(50)

select @ID_TreatInfo=ID_TreatInfo,@Treat_Type=Treat_Type,@Treat_Name=Treat_Name ,@Treat_Pickup=Treat_Pickup,@Treat_Drop=Treat_Drop from inserted

Print '===The Data Has Been Updated==='
Print 'ID TreatInfo  : '+@ID_TreatInfo
Print 'Treat         : '+@Treat_Type
Print 'Name          : '+@Treat_Name
Print 'Pickup        : '+@Treat_Pickup
Print 'Drop	         : '+@Treat_Drop
END


/*Trigger_Delete_TreatInfo*/
CREATE TRIGGER DeleteTreatInfo
On Product.TreatInfo for Delete
AS
BEGIN
		Declare 
		@ID_TreatInfo varchar(10),
		@Treat_Type varchar(15),
		@Treat_Name varchar(50),
		@Treat_Pickup varchar(50),
		@Treat_Drop varchar(50)

select @ID_TreatInfo=ID_TreatInfo,@Treat_Type=Treat_Type,@Treat_Name=Treat_Name ,@Treat_Pickup=Treat_Pickup,@Treat_Drop=Treat_Drop from deleted

Print '===The Data Has Been Deleted==='
Print 'ID TreatInfo  : '+@ID_TreatInfo
Print 'Treat         : '+@Treat_Type
Print 'Name          : '+@Treat_Name
Print 'Pickup        : '+@Treat_Pickup
Print 'Drop	         : '+@Treat_Drop
END


/*Trigger_Update_Treat*/
CREATE TRIGGER UpdateTreat
On Product.Treat
after insert, Update
AS
BEGIN
		Declare 
		@ID_Treat varchar(10),
		@ID_TreatInfo varchar(15),
		@Treat_Category varchar(50),
		@Treat_Name varchar(50)

select @ID_Treat=@ID_TreatInfo ,@ID_TreatInfo=ID_TreatInfo, @Treat_Category=Treat_Category,@Treat_Name=Treat_Name from inserted

Print '===The Data Has Been Updated==='
Print 'ID Treat		 : '+@ID_Treat
Print 'ID TreatInfo  : '+@ID_TreatInfo
Print 'Category      : '+@Treat_Category
Print 'Name          : '+@Treat_Name

END


/*Trigger_Delete_Treat*/
CREATE TRIGGER DeleteTreat
On Product.TreatInfo for Delete
AS
BEGIN
		Declare 
		@ID_Treat varchar(10),
		@ID_TreatInfo varchar(15),
		@Treat_Category varchar(50),
		@Treat_Name varchar(50)

select @ID_Treat=@ID_Treat ,@ID_TreatInfo=ID_TreatInfo, @Treat_Category=Treat_Category,@Treat_Name=Treat_Name from deleted

Print '===The Data Has Been Deleted==='
Print 'ID Treat		 : '+@ID_Treat
Print 'ID TreatInfo  : '+@ID_TreatInfo
Print 'Category      : '+@Treat_Category
Print 'Name          : '+@Treat_Name
END

--CREATE TRIGGER MEMBER--
/*Trigger_Insert_Member*/
CREATE TRIGGER TR_InsertMember
On Human.Member for Insert
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar(50)

select @ID_Member=ID_Member,@ID_MemberInfo=ID_MemberInfo,@Member_Name=Member_Name from inserted

Print '===The Data Has Been Inserted==='
Print 'ID Member            : '+@ID_Member
Print 'ID MemberInfo        : '+@ID_MemberInfo
Print 'Name                 : '+@Member_Name
END

/*Trigger_Update_Member*/
CREATE TRIGGER TR_UpdateMember
ON Human.Member for update
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar(50)
update human.Member set @ID_Member=@ID_Member,@ID_MemberInfo=@ID_MemberInfo,@Member_Name=@Member_Name from inserted
		Print '===The Data Has Been Updated==='
Print 'ID Member            : '+@ID_Member
Print 'ID MemberInfo        : '+@ID_MemberInfo
Print 'Name                 : '+@Member_Name
END

/*Trigger Delete Member*/
CREATE TRIGGER TR_DeleteMember
ON Human.Member for delete
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar(50)
select @ID_Member=@ID_Member,@ID_MemberInfo=@ID_MemberInfo,@Member_Name=@Member_Name from deleted 
END

--CREATE TRIGGER MEMBER INFO--
/*Trigger_Insert_MemberInfo*/
CREATE TRIGGER TR_InsertMemberInfo
On Human.MemberInfo for Insert
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Add varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Add=Member_Add from inserted

print '===The Data Has Been Inserted==='
print 'ID MemberInfo        : '+@ID_MemberInfo
print 'Birth                : '+cast(@Member_Birth as nvarchar)
print 'Gender               : '+@Member_Gender
print 'Telp                 : '+@Member_Telp
print 'Address              : '+@Member_Add
END


/*Trigger_Update_MemberInfo*/
CREATE TRIGGER TR_UpdateMemberInfo
On Human.MemberInfo for Update
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Add varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Add=Member_Add from inserted

print '===The Data Has Been Updated==='
print 'ID MemberInfo          : '+@ID_MemberInfo
print 'Birth                  : '+cast(@Member_Birth as nvarchar)
print 'Gender                 : '+@Member_Gender
print 'Telp                   : '+@Member_Telp
print 'Address                : '+@Member_Add
END

/*Trigger_Delete_MemberInfo*/
CREATE TRIGGER TR_DeleteMemberInfo
On Human.MemberInfo for Delete
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Add varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Add=Member_Add from deleted

print '===The Data Has Been Deleted==='
print 'ID MemberInfo   : '+@ID_MemberInfo
print 'Birth           : '+cast(@Member_Birth as nvarchar)
print 'Gender          : '+@Member_Gender
print 'Telp            : '+@Member_Telp
print 'Address         : '+@Member_Add
END

--CREATE TRIGGER STAFF--
/*Trigger Insert Staff*/
CREATE TRIGGER TR_InsertStaff
ON Human.staff FOR INSERT
AS
BEGIN
		declare @ID_staff varchar(8)
		declare @ID_Staffinfo varchar(8)
		declare @Staff_Name varchar(50)

select @ID_staff=@ID_staff,@ID_Staffinfo=@ID_Staffinfo,@Staff_Name=@Staff_Name from inserted 

Print '===The Data Has Been Inserted==='
Print 'ID Staff           : '+@ID_staff
Print 'ID StaffInfo       : '+@ID_staffInfo
Print 'Name               : '+@staff_Name
END

/*Trigger Update Staff*/
CREATE TRIGGER TR_UpdateStaff
ON Human.staff FOR UPDATE
AS
BEGIN
		declare @ID_staff varchar(8)
		declare @ID_Staffinfo varchar(8)
		declare @Staff_Name varchar(50)

select @ID_staff=@ID_staff,@ID_Staffinfo=@ID_Staffinfo,@Staff_Name=@Staff_Name from inserted
Print '===The Data Has Been Updated==='
Print 'ID Staff           : '+@ID_staff
Print 'ID StaffInfo       : '+@ID_staffInfo
Print 'Name               : '+@staff_Name
END

/*Trigger Delete Staff*/
CREATE TRIGGER TR_DeleteStaff
ON Human.staff FOR DELETE
AS
BEGIN
		declare @ID_staff varchar(8)
		declare @ID_Staffinfo varchar(8)
		declare @Staff_Name varchar(50)

select @ID_staff=@ID_staff,@ID_Staffinfo=@ID_Staffinfo,@Staff_Name=@Staff_Name from inserted
Print '===The Data Has Been Deleted==='
Print 'ID Staff           : '+@ID_staff
Print 'ID StaffInfo       : '+@ID_staffInfo
Print 'Name               : '+@staff_Name
END

--CREATE TRIGGER STAFF INFO--
/*Trigger Insert Staffinfo*/
CREATE TRIGGER TR_InsertStaffinfo
ON Human.staffinfo FOR INSERT
AS
BEGIN
		declare @ID_staffinfo varchar(8)
		declare @staff_Gender varchar(10)
		declare @staff_Birth date
		declare @staff_Telp varchar(15)
		declare @staff_Add varchar(50)
		declare @staff_Status varchar(10)

select @ID_Staffinfo=@ID_Staffinfo,@staff_Gender=@staff_Gender,@staff_Birth=@staff_Birth,@staff_Telp=@staff_Telp,@staff_Add=@staff_Add,@staff_Status=@staff_Status from inserted 

print '===The Data Has Been Inserted==='
print 'ID MemberInfo          : '+@ID_staffInfo
print 'Birth                  : '+cast(@staff_Birth as nvarchar)
print 'Gender                 : '+@staff_Gender
print 'Telp                   : '+@staff_Telp
print 'Address                : '+@staff_Add
print 'Status				  : '+@staff_status
END

/*Trigger Update Staffinfo*/
CREATE TRIGGER TR_UpdateStaffinfo
ON Human.staffinfo FOR UPDATE
AS
BEGIN
		declare @ID_staffinfo varchar(8)
		declare @staff_Gender varchar(10)
		declare @staff_Birth date
		declare @staff_Telp varchar(15)
		declare @staff_Add varchar(50)
		declare @staff_Status varchar(10)

select @ID_Staffinfo=@ID_Staffinfo,@staff_Gender=@staff_Gender,@staff_Birth=@staff_Birth,@staff_Telp=@staff_Telp,@staff_Add=@staff_Add,@staff_Status=@staff_Status from inserted 

print '===The Data Has Been Updated==='
print 'ID MemberInfo          : '+@ID_staffInfo
print 'Birth                  : '+cast(@staff_Birth as nvarchar)
print 'Gender                 : '+@staff_Gender
print 'Telp                   : '+@staff_Telp
print 'Address                : '+@staff_Add
print 'Status				  : '+@staff_status
END

/*Trigger Delete Staffinfo*/
CREATE TRIGGER TR_DeleteStaffinfo
ON Human.staffinfo FOR DELETE
AS
BEGIN
		declare @ID_staffinfo varchar(8)
		declare @staff_Gender varchar(10)
		declare @staff_Birth date
		declare @staff_Telp varchar(15)
		declare @staff_Add varchar(50)
		declare @staff_Status varchar(10)

select @ID_Staffinfo=@ID_Staffinfo,@staff_Gender=@staff_Gender,@staff_Birth=@staff_Birth,@staff_Telp=@staff_Telp,@staff_Add=@staff_Add,@staff_Status=@staff_Status from inserted 

print '===The Data Has Been Deleted==='
print 'ID MemberInfo          : '+@ID_staffInfo
print 'Birth                  : '+cast(@staff_Birth as nvarchar)
print 'Gender                 : '+@staff_Gender
print 'Telp                   : '+@staff_Telp
print 'Address                : '+@staff_Add
print 'Status				  : '+@staff_status
END

