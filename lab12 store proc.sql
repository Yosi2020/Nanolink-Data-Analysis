/*
Advantages

1. To avoid cration of exeution plan again and again
2. To avoid network traffic 
3. code reusability

*/
select * from [dbo].[emp]

create proc dbo.spCustomerDetail_withInputOutputParameters
(
@Gender varchar(10), @EmpCount int out
)
as
begin
select @EmpCount = count(EmpID) from [dbo].[emp]
where Gender=@Gender
end

declare @TotalEmployees int
exec dbo.spCustomerDetail_withInputOutputParameters 'Male', 
@TotalEmployees out

select @TotalEmployees

