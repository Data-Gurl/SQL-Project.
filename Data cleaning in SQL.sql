

select * from NashvilleHousing

----Standardize Date Format--

select SaleDate, CONVERT(Date, SaleDate)
from NashvilleHousing

select SaleDateConverted, CONVERT(Date, SaleDate)
from NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT( date, SaleDate)

ALTER TABLE NashvilleHousing
ADD SaleDateConverted Date;

Update NashvilleHousing
set SaleDateConverted = CONVERT(Date, SaleDate)

---- populate property address data

select PropertyAddress
from NashvilleHousing
--where propertyAddress is null
order by ParcelID

select a.ParcelID,a.PropertyAddress,a.ParcelID,b.PropertyAddress, ISNULL(a.propertyaddress,b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
on a.parcelID = b. ParcelID
and a.[uniqueID] <> b. [UniqueID]
WHERE a.PropertyAddress is null


update a
set propertyaddress = ISNULL(a.propertyaddress,b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
on a.parcelID = b. ParcelID
and a.[uniqueID] <> b. [UniqueID]
WHERE a.PropertyAddress is null

-----breaking out address into individual columns( address, city, state)

select PropertyAddress
from NashvilleHousing
--where propertyAddress is null
--order by ParcelID

select
substring(propertyaddress,1,CHARINDEX(',',propertyaddress)-1) as address,
substring(propertyaddress,CHARINDEX(',',propertyaddress)+1,len(propertyaddress)) as address
from NashvilleHousing

ALTER TABLE NashvilleHousing
ADD PropertSplitaddress nvarchar(255);

Update NashvilleHousing
set PropertSplitaddress  = substring(propertyaddress,1,CHARINDEX(',',propertyaddress)-1)

select 
PARSENAME(REPLACE(owneraddress, ',', '.'),3),
PARSENAME(REPLACE(owneraddress, ',', '.'),2),
PARSENAME(REPLACE(owneraddress, ', ', '.'),1)
from NashvilleHousing

---changing Y and No in " sold as vacant" field


select Distinct(SoldAsVacant), count (SoldAsVacant)
from NashvilleHousing
Group by SoldAsVacant
order by 2

select  SoldAsVacant,
CASE
when SoldAsVacant = 'Y' then 'Yes'
 when SoldAsVacant = 'N' then 'No'
 else SoldAsVacant
 end
from NashvilleHousing

-----------Remove Duplicate (CTE)
WITH RowNumCTE AS(
select*,
Row_number () over(
 PARTITION BY parcelID,
      propertyaddress,
	  saleprice,
	  saleDate,
	  LegalReference
	  order by
	  uniqueID
	  ) Row_num
from NashvilleHousing
--order by ParcelID
)
delete
from RowNumCTE
WHERE row_num > 1
---order by PropertyAddress

----deleting unused columns-----



alter table  NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress

alter table  NashvilleHousing
drop COLUMN SaleDate






select*from NashvilleHousing


