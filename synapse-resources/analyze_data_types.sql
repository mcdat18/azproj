-- Analyzing data types
select OBJECT_NAME(object_id),cs.name from sys.columns cs 
inner join sys.types ts on cs.system_type_id=ts.system_type_id where ts.name in('nvarchar','nchar')
and (OBJECT_NAME(object_id) like 'Dim%' or OBJECT_NAME(object_id) like 'Fact%');

-- since English columns don't require Unicode we should change it to varchar to use up half the space
alter table DimBigProduct alter column EnglishProductName varchar(80);