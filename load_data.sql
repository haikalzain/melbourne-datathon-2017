/*------------------------------------------
Melbourne Datathon 2017

Some SQL that will load all the data into
an SQL Server database
--------------------------------------------*/


---------------
--TRANSACTIONS
---------------
CREATE TABLE TRANSACTIONS
(
	Patient_ID	int
,	Store_ID	smallint
,	Prescriber_ID	int
,	Drug_ID	smallint
,	SourceSystem_Code	varchar(1)
,	Prescription_Week	DATE
,	Dispense_Week	DATE
,	Drug_Code	varchar(37)
,	NHS_Code	varchar(6)
,	IsDeferredScript	tinyint
,	Script_Qty	smallint
,	Dispensed_Qty	smallint
,	MaxDispense_Qty	smallint
,	PatientPrice_Amt	float
,	WholeSalePrice_Amt	float
,	GovernmentReclaim_Amt	float
,	RepeatsTotal_Qty	smallint
,	RepeatsLeft_Qty	smallint
,	StreamlinedApproval_Code	smallint
)


BULK INSERT TRANSACTIONS
FROM 'Transactions\patients_1.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)

....
....
....


BULK INSERT TRANSACTIONS
FROM 'Transactions\patients_50.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)




----------------------------
-- PATIENTS
----------------------------

CREATE TABLE patients
(
	Patient_ID	int
,	gender	varchar(1)
,	year_of_birth	smallint
,	postcode	varchar(4) 
)

BULK INSERT patients
FROM 'Lookups\patients.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)




----------------------------
-- STORES
----------------------------

CREATE TABLE stores
(
	Store_ID	smallint
,	StateCode	varchar(3)
,	postcode	varchar(4)
)

BULK INSERT stores
FROM 'Lookups\stores.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)



----------------------------
-- DRUGS
----------------------------

CREATE TABLE Drug_LookUp
(
	MasterProductID	smallint
,	MasterProductCode	varchar(9)
,	MasterProductFullName	varchar(61)
,	BrandName	varchar(30)
,	FormCode	varchar(10)
,	StrengthCode	varchar(21)
,	PackSizeNumber	smallint
,	GenericIngredientName	varchar(30)
,	EthicalSubCategoryName	varchar(21)
,	EthicalCategoryName	varchar(16)
,	ManufacturerCode	varchar(9)
,	ManufacturerName	varchar(27)
,	ManufacturerGroupID	smallint
,	ManufacturerGroupCode	varchar(43)
,	ChemistListPrice	float
,	ATCLevel5Code	varchar(7)
,	ATCLevel4Code	varchar(5)
,	ATCLevel3Code	varchar(4)
,	ATCLevel2Code	varchar(3)
,	ATCLevel1Code	varchar(2)
)

BULK INSERT Drug_LookUp
FROM 'Lookups\Drug_LookUp.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)



----------------------------
-- CHRONIC ILLNESS
----------------------------

CREATE TABLE ChronicIllness_LookUp
(
	ChronicIllness	varchar(44)
,	MasterProductID	smallint
,	MasterProductFullName	varchar(59)
)

BULK INSERT ChronicIllness_LookUp
FROM 'Lookups\ChronicIllness_LookUp.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)



----------------------------
-- ATC
----------------------------

CREATE TABLE ATC_LookUp
(
	ATCLevel1Code	varchar(2)
,	ATCLevel1Name	varchar(63)
,	ATCLevel2Code	varchar(3)
,	ATCLevel2Name	varchar(64)
,	ATCLevel3Code	varchar(4)
,	ATCLevel3Name	varchar(71)
,	ATCLevel4Code	varchar(5)
,	ATCLevel4Name	varchar(92)
,	ATCLevel5Code	varchar(7)
,	ATCLevel5Name	varchar(78)
)

BULK INSERT ATC_LookUp
FROM 'Lookups\ATC_LookUp.txt'
WITH
(
MAXERRORS = 0,
FIRSTROW = 2,
FIELDTERMINATOR = '\t',
ROWTERMINATOR = '\n'
)



