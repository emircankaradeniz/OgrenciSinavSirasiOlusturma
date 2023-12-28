use OgrenciYerlestir
insert into tbl_Gozetmen
values (1,'Mustafa','�zl�')
insert into tbl_Gozetmen
values (2,'S�meyye','Hoca')
insert into tbl_ders
values (1,'M�h Mat')
insert into tbl_ders
values (2,'VT Programlama')
insert into tbl_ders
values (3,'Yaz�l�m M�hendisli�i')
insert into tbl_ders
values (4,'Mesleki �ngilizce')
insert into tbl_derslik
values ('Z05','A Dersli�i',48)
insert into tbl_derslik
values ('Z06','B Dersli�i',30)
insert into tbl_hoca
values (111,'Murat','Ta�y�rek')
insert into tbl_hoca
values (222,'Serhat','H�zl�soy')
insert into tbl_sinif
values ('s1','1.S�n�f',60)
insert into tbl_sinif
values ('s2','2.S�n�f',40)
insert into tbl_HocaDers
values (111,1);
insert into tbl_HocaDers
values (111,2);
insert into tbl_HocaDers
values (222,3);
insert into tbl_HocaDers
values (222,4);
insert into tbl_DersSinif
values (1,'s1');
insert into tbl_DersSinif
values (2,'s1');
insert into tbl_DersSinif
values (3,'s2');
insert into tbl_DersSinif
values (4,'s2');
--Birinci sinif i�in--
declare @id int;
declare @sinifID varchar(10);
set @sinifID = 's1'
declare @DersID int;
declare @OgrenciAdi varchar(50);
set @id=1
while @id<=60
begin
	set @OgrenciAdi = '��renci ' +str(@id)
	Insert into tbl_Ogr (OgrenciAdi)
	values (@OgrenciAdi);
	set @DersID=1
	insert into tbl_OgrenciDers
	values (@id,@DersID);
	set @DersID=2
	insert into tbl_OgrenciDers
	values (@id,@DersID);
	insert into tbl_siiniftakiOgrenciler
	values (@sinifID,@id)
	set @id=@id+1
end
--�kinci sinif i�in--
declare @sinifID2 varchar(10);
set @sinifID2 = 's2'
declare @OgrenciAdi2 varchar(50);
while @id<=100
begin
	set @OgrenciAdi2 = '��renci ' +str(@id)
	Insert into tbl_Ogr(OgrenciAdi)
	values (@OgrenciAdi2);
	set @DersID=3
	insert into tbl_OgrenciDers
	values (@id,@DersID);
	set @DersID=4
	insert into tbl_OgrenciDers
	values (@id,@DersID);
	insert into tbl_siiniftakiOgrenciler
	values (@sinifID2,@id)
	set @id=@id+1
end
--s�nav tablosunu doldurma--
declare @sinavID varchar(10);
declare @id1sinif varchar(10);
set @id1sinif='s1'
declare @id2sinif varchar(10);
set @id2sinif='s2'
declare @Gozetmen1ID int;
set @Gozetmen1ID=1
declare @Gozetmen2ID int;
set @Gozetmen2ID=2
declare @MuratHocaTc int;
set @MuratHocaTc=111
declare @SerhatHocaTc int;
set @SerhatHocaTc=222
--sinav 1 i�in--
set @sinavID ='1-sinav'
insert into tbl_sinavSinif
values (@sinavID,@id1sinif)
insert into tbl_SinavDers
values (@sinavID,1)
insert into tbl_Sinav
values (@sinavID,@Gozetmen1ID,@MuratHocaTc,'2024-01-08 09:00:00')
--sinav 2 i�in--
set @sinavID ='2-sinav'
insert into tbl_sinavSinif
values (@sinavID,@id1sinif)
insert into tbl_SinavDers
values (@sinavID,2)
insert into tbl_Sinav
values (@sinavID,@Gozetmen2ID,@MuratHocaTc,'2024-01-08 11:00:00')
--sinav 3 i�in--
set @sinavID ='3-sinav'
insert into tbl_sinavSinif
values (@sinavID,@id2sinif)
insert into tbl_SinavDers
values (@sinavID,3)
insert into tbl_Sinav
values (@sinavID,@Gozetmen1ID,@SerhatHocaTc,'2024-01-09 09:00:00')
--sinav 3 i�in--
set @sinavID ='4-sinav'
insert into tbl_sinavSinif
values (@sinavID,@id2sinif)
insert into tbl_SinavDers
values (@sinavID,4)
insert into tbl_Sinav
values (@sinavID,@Gozetmen2ID,@SerhatHocaTc,'2024-01-09 11:00:00')


