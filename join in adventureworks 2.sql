
select top 2 * from Person.Personselect top 2 * from Person.BusinessEntityAddress select top 2 * from Person.Address select p.BusinessEntityID,p.FirstName,p.MiddleName,p.LastName,A.AddressLine1,A.City,A.PostalCodefrom Person.Person pjoin Person.BusinessEntityAddress BEA on p.BusinessEntityID=BEA.BusinessEntityIDjoin Person.Address A ON BEA.AddressID=A.AddressID 