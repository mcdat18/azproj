-- Analyze round robin data distribution based on 60 distributions

select cp.[distribution],count(*) distributionRecords from (
select row_number() over(order by (select null)) rowNum from FactTransactionHistory) subq
cross apply(select rowNum%60 [distribution]) cp
group by [distribution]
order by [distribution];

-- Analyze hash distribution 

-- select a distribution key

select cs.name, tt.name from sys.columns cs inner join sys.types tt
on cs.system_type_id=tt.system_type_id where object_id=OBJECT_ID('FactTransactionHistory');

-- Follwing review
-- 	Transaction ID is unique (more than 60 distinct values, we will not have an empty distribution) can be used in joining however not used in grouping 
--  OrderDate used in grouping not used in joining, more used in WHERE clause 
--  ProductKey best candidate for hash  key, used in grouping used in joining, > 60 distinct value which will ensure there will not be an empty distribution

-- more than 60 distinct values

select count(distinct ProductKey)
from FactTransactionHistory;

-- view distribution basedon Product key in 60 distributions

select cp.[distribution],sum(recordCount) distributionRecords from
(select DENSE_RANK() over(order by ProductKey) rowNum, count(*) recordCount from FactTransactionHistory
group by ProductKey) subq
cross apply(select rowNum%60 [distribution]) cp
group by [distribution]
order by [distribution];

-- check all the other tables that use the ProductKey table
-- more tables using this column will make ProductKey best candidate for joining 

select OBJECT_NAME(object_id) from sys.columns where name='ProductKey';