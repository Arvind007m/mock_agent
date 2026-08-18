-- Kezzler Mock Database Dump
-- Exported from kezzler

SET FOREIGN_KEY_CHECKS = 0;

-- Kezzler track-and-trace schema (structure only, rebuilt from xlsx).
-- Local TEST database. Contains NO real Kezzler data.
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `Code` (
  `CodeRecId` int(11) NOT NULL AUTO_INCREMENT,
  `SeqNum` int(11) NULL DEFAULT NULL,
  `Code` varchar(50) NOT NULL,
  `LotRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodeRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Distributor` (
  `DistributorRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ERPId` varchar(50) NULL DEFAULT NULL,
  `TempERPId` varchar(50) NULL DEFAULT NULL,
  `BusinessName` varchar(100) NOT NULL,
  `OwnerName` varchar(100) NULL DEFAULT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `StateRecId` int(11) NULL DEFAULT NULL,
  `DistrictRecId` int(11) NULL DEFAULT NULL,
  `CityRecId` int(11) NULL DEFAULT NULL,
  `Location` varchar(50) NULL DEFAULT NULL,
  `Address` varchar(500) NULL DEFAULT NULL,
  `City` varchar(100) NULL DEFAULT NULL,
  `Pincode` varchar(10) NULL DEFAULT NULL,
  `EmailId` varchar(100) NULL DEFAULT NULL,
  `SecEmailId` varchar(100) NULL DEFAULT NULL,
  `Mobile` varchar(15) NULL DEFAULT NULL,
  `SecMobile` varchar(15) NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `IsLoggedFromApp` tinyint(1) NULL DEFAULT NULL,
  `IsPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `IsDataPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `CreatedFrom` varchar(50) NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedFrom` varchar(50) NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `Potential` int(11) NULL DEFAULT NULL,
  `Target` int(11) NULL DEFAULT NULL,
  `ApprovedBy` int(11) NULL DEFAULT NULL,
  `ApprovedDate` datetime NULL DEFAULT NULL,
  `IsNursery` tinyint(1) NULL DEFAULT 0,
  `IsBLF` tinyint(1) NOT NULL DEFAULT 0,
  `Latitude` varchar(50) NULL DEFAULT NULL,
  `Longitude` varchar(50) NULL DEFAULT NULL,
  `GEOTSMRecId` int(11) NULL DEFAULT NULL,
  `GEOMDORecId` int(11) NULL DEFAULT NULL,
  `GEOCreatedOn` datetime NULL DEFAULT NULL,
  `IsFarmerPromoViewed` tinyint(1) NULL DEFAULT 0,
  `FarmerPromoViewedOn` datetime NULL DEFAULT NULL,
  `IsFarmerPromoGlowExpired` tinyint(1) NULL DEFAULT 0,
  `FarmerPromoGlowExpiredOn` datetime NULL DEFAULT NULL,
  `Passwd` varchar(100) NOT NULL,
  `PANNumber` varchar(100) NULL DEFAULT NULL,
  `DeactivatedOwn` tinyint(1) NULL DEFAULT 0,
  `FirstLoginDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`DistributorRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DistributorSales` (
  `DistributorSalesRecId` int(11) NOT NULL AUTO_INCREMENT,
  `DistributorRecId` int(11) NOT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `CodeRecId` int(11) NOT NULL,
  `ParentCodeRecId` int(11) NULL DEFAULT NULL,
  `ScannedDate` datetime NOT NULL,
  `HybridRecId` int(11) NOT NULL,
  `Points` decimal(11,4) NULL DEFAULT NULL,
  `Price` decimal(11,4) NULL DEFAULT NULL,
  `FYYear` varchar(20) NULL DEFAULT NULL,
  `IsDispatched` tinyint(1) NULL DEFAULT 0,
  `SoldDate` datetime NOT NULL,
  `IsReturned` tinyint(1) NULL DEFAULT 0,
  `IsDuplicateSales` tinyint(1) NULL DEFAULT 0,
  `LotRecId` int(11) NULL DEFAULT NULL,
  `DeviceRecId` int(11) NULL DEFAULT NULL,
  `HybridPointsHistoryRecId` int(11) NULL DEFAULT NULL,
  `HybridPriceHistoryRecId` int(11) NULL DEFAULT NULL,
  `ReturnedOn_UK` varchar(50) NULL DEFAULT '',
  `DupScannedOn_UK` varchar(50) NULL DEFAULT '',
  `Souce_UK` varchar(20) NULL DEFAULT '',
  `ReturnedOn` datetime NULL DEFAULT NULL,
  `Conv_RetailerSalesRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DistributorSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DistributorSecSales` (
  `DistributorSecSalesRecId` int(11) NOT NULL AUTO_INCREMENT,
  `DistributorRecId` int(11) NOT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `CodeRecId` int(11) NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `DeviceRecId` int(11) NULL DEFAULT NULL,
  `SoldToRetailerRecId` int(11) NULL DEFAULT NULL,
  `AlsoSoldByRetailerRecId` int(11) NULL DEFAULT NULL,
  `SoldDate` datetime NOT NULL,
  `ScannedDate` datetime NOT NULL,
  `IsReturned` tinyint(1) NULL DEFAULT NULL,
  `IsDuplicateSales` tinyint(1) NULL DEFAULT NULL,
  `ReturnedOn` datetime NULL DEFAULT NULL,
  `Conv_RetailerSecSalesRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DistributorSecSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `District` (
  `DistrictRecId` int(11) NOT NULL AUTO_INCREMENT,
  `District` varchar(50) NOT NULL,
  `ShortName` varchar(50) NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `StateRecId` int(11) NULL DEFAULT NULL,
  `TerritoryRecId` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`DistrictRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DuplicateSales` (
  `DuplicateSalesRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `ParentCodeRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NOT NULL,
  `DupDistributorRecId` int(11) NULL DEFAULT NULL,
  `DupRetailerRecId` int(11) NULL DEFAULT NULL,
  `DupMDORecId` int(11) NULL DEFAULT NULL,
  `DupTSMRecId` int(11) NULL DEFAULT NULL,
  `DupSoldOn` datetime NULL DEFAULT NULL,
  `DupScannedOn` datetime NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `RetailerRecId` int(11) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `SoldOn` datetime NULL DEFAULT NULL,
  `ScannedOn` datetime NULL DEFAULT NULL,
  `InsertedOn` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`DuplicateSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Hybrid` (
  `HybridRecId` int(11) NOT NULL AUTO_INCREMENT,
  `MaterialNumber` varchar(50) NULL DEFAULT NULL,
  `MaterialName` varchar(200) NULL DEFAULT NULL,
  `CategoryRecId` int(11) NULL DEFAULT NULL,
  `PhaseRecId` int(11) NULL DEFAULT NULL,
  `SegmentRecId` int(11) NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 0,
  `PackCount` int(11) NULL DEFAULT NULL,
  `Points` decimal(11,4) NULL DEFAULT NULL,
  `NewPoints` decimal(11,4) NULL DEFAULT NULL,
  `ScanWeight` decimal(11,3) NULL DEFAULT NULL,
  `CartonCount` int(11) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `SKURecId` int(11) NULL DEFAULT NULL,
  `MinGerm` int(11) NULL DEFAULT NULL,
  `MinPP` int(11) NULL DEFAULT NULL,
  `MinGP` int(11) NULL DEFAULT NULL,
  `MRP` int(11) NULL DEFAULT NULL,
  `Cultivation` varchar(1000) NULL DEFAULT NULL,
  `Treat` varchar(50) NULL DEFAULT NULL,
  `IsAllowPouchLiq` tinyint(1) NULL DEFAULT 0,
  `IsAllowPouchReturn` tinyint(1) NULL DEFAULT 0,
  `temp_MaterialRecId` int(11) NULL DEFAULT NULL,
  `tmp_IsDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`HybridRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `HybridPointsHistory` (
  `HybridPointsHistoryRecId` int(11) NOT NULL AUTO_INCREMENT,
  `HybridRecId` int(11) NOT NULL,
  `Name` varchar(100) NULL DEFAULT NULL,
  `Points` decimal(19,4) NULL DEFAULT NULL,
  `IsPromotionPoint` tinyint(1) NULL DEFAULT 0,
  `ValidFrom` datetime NULL DEFAULT NULL,
  `ValidTo` datetime NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`HybridPointsHistoryRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `HybridPriceHistory` (
  `HybridPriceHistoryRecId` int(11) NOT NULL AUTO_INCREMENT,
  `HybridRecId` int(11) NOT NULL,
  `Name` varchar(100) NULL DEFAULT NULL,
  `Price` decimal(19,2) NULL DEFAULT NULL,
  `ValidFrom` datetime NULL DEFAULT NULL,
  `ValidTo` datetime NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`HybridPriceHistoryRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `LooseBox` (
  `LooseBoxRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `PackCount` int(11) NOT NULL,
  `LooseBoxTypeRecId` int(11) NULL DEFAULT NULL,
  `IsOffer` tinyint(1) NULL DEFAULT 0,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`LooseBoxRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `LooseBoxType` (
  `LooseBoxTypeRecId` int(11) NOT NULL,
  `Code` varchar(20) NULL DEFAULT NULL,
  `Type` varchar(100) NULL DEFAULT NULL,
  PRIMARY KEY (`LooseBoxTypeRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Lot` (
  `LotRecId` int(11) NOT NULL AUTO_INCREMENT,
  `LotNum` varchar(50) NOT NULL,
  `PackingDate` datetime NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `PlantLineRecId` int(11) NULL DEFAULT NULL,
  `PlantRecId` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `IsCompleted` tinyint(1) NULL DEFAULT 0,
  `IsLBoxProcessed` tinyint(1) NULL DEFAULT 0,
  `TestedDate` datetime NULL DEFAULT NULL,
  `ExpiryDate` datetime NULL DEFAULT NULL,
  `CompletedBy` int(11) NULL DEFAULT NULL,
  `CompletedDate` datetime NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `DeletedBy` int(11) NULL DEFAULT NULL,
  `DeletedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`LotRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `LotRoll` (
  `LotRollRecId` int(11) NOT NULL AUTO_INCREMENT,
  `LotRecId` int(11) NOT NULL,
  `LabelRollRecId` int(11) NOT NULL,
  `StartCodeRecId` int(11) NULL DEFAULT NULL,
  `EndCodeRecId` int(11) NULL DEFAULT NULL,
  `NumOfCodes` int(11) NOT NULL,
  `IsPartiallyUsed` tinyint(1) NOT NULL,
  `IsActivated` tinyint(1) NULL DEFAULT 0,
  `IsUploaded` tinyint(1) NULL DEFAULT 0,
  `IssuedBy` int(11) NOT NULL,
  `IssuedDate` datetime NOT NULL,
  `ReceivedBy` int(11) NULL DEFAULT NULL,
  `ReceivedDate` datetime NULL DEFAULT NULL,
  `KezzlerActRequestCount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`LotRollRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `MDO` (
  `MDORecId` int(11) NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(50) NOT NULL,
  `SAPId` varchar(50) NULL DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NULL DEFAULT NULL,
  `Passwd` varchar(100) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `ReportingTo` int(11) NULL DEFAULT NULL,
  `RegionRecId` int(11) NULL DEFAULT NULL,
  `Location` varchar(50) NULL DEFAULT NULL,
  `Address` varchar(500) NULL DEFAULT NULL,
  `Pincode` varchar(10) NULL DEFAULT NULL,
  `EmailId` varchar(100) NULL DEFAULT NULL,
  `Mobile` varchar(15) NOT NULL,
  `SecMobile` varchar(15) NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `IsPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `IsDataPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `StateRecId` int(11) NULL DEFAULT NULL,
  `DistrictRecId` int(11) NULL DEFAULT NULL,
  `CityRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MDORecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Packing` (
  `PackingRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `ParentRecId` int(11) NULL DEFAULT NULL,
  `LotRecId` int(11) NULL DEFAULT NULL,
  `LabelRollRecId` int(11) NULL DEFAULT NULL,
  `WarehouseRecId` int(11) NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `Level` int(11) NULL DEFAULT NULL,
  `IsMixedPack` tinyint(1) NULL DEFAULT 0,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`PackingRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `PackingItems` (
  `PackingItemsRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `PackingRecId` int(11) NULL DEFAULT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `HybridRecId` int(11) NOT NULL,
  PRIMARY KEY (`PackingItemsRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `ProductGroup` (
  `ProductGroupRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductGroup` varchar(50) NOT NULL,
  `ShortName` varchar(50) NOT NULL,
  `ProductTypeRecId` int(11) NOT NULL,
  `Description` varchar(100) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `Color` varchar(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductGroupRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `ProductType` (
  `ProductTypeRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductType` varchar(50) NOT NULL,
  `Description` varchar(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductTypeRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `PlantLine` (
  `PlantLineRecId` int(11) NOT NULL,
  `PlantLineNum` varchar(50) NOT NULL,
  PRIMARY KEY (`PlantLineRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Plant` (
  `PlantRecId` int(11) NOT NULL,
  `PlantName` varchar(100) NOT NULL,
  PRIMARY KEY (`PlantRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Region` (
  `RegionRecId` int(11) NOT NULL AUTO_INCREMENT,
  `Region` varchar(50) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ZoneRecId` int(11) NOT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`RegionRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Retailer` (
  `RetailerRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ERPId` varchar(50) NULL DEFAULT NULL,
  `TempERPId` varchar(50) NULL DEFAULT NULL,
  `BusinessName` varchar(100) NOT NULL,
  `OwnerName` varchar(100) NULL DEFAULT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `StateRecId` int(11) NULL DEFAULT NULL,
  `DistrictRecId` int(11) NULL DEFAULT NULL,
  `CityRecId` int(11) NULL DEFAULT NULL,
  `Location` varchar(50) NULL DEFAULT NULL,
  `Passwd` varchar(100) NOT NULL,
  `Address` varchar(500) NULL DEFAULT NULL,
  `City` varchar(100) NULL DEFAULT NULL,
  `Pincode` varchar(10) NULL DEFAULT NULL,
  `EmailId` varchar(100) NULL DEFAULT NULL,
  `SecEmailId` varchar(100) NULL DEFAULT NULL,
  `Mobile` varchar(50) NULL DEFAULT NULL,
  `SecMobile` varchar(50) NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `IsLoggedFromApp` tinyint(1) NULL DEFAULT NULL,
  `IsPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `IsDataPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `CreatedFrom` varchar(50) NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedFrom` varchar(50) NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `Potential` int(11) NULL DEFAULT NULL,
  `Target` int(11) NULL DEFAULT NULL,
  `ApprovedBy` int(11) NULL DEFAULT NULL,
  `ApprovedDate` datetime NULL DEFAULT NULL,
  `IsNursery` tinyint(1) NULL DEFAULT 0,
  `IsBLF` tinyint(1) NOT NULL DEFAULT 0,
  `Latitude` varchar(50) NULL DEFAULT NULL,
  `Longitude` varchar(50) NULL DEFAULT NULL,
  `GEOTSMRecId` int(11) NULL DEFAULT NULL,
  `GEOMDORecId` int(11) NULL DEFAULT NULL,
  `GEOCreatedOn` datetime NULL DEFAULT NULL,
  `IsFarmerPromoViewed` tinyint(1) NULL DEFAULT 0,
  `FarmerPromoViewedOn` datetime NULL DEFAULT NULL,
  `IsFarmerPromoGlowExpired` tinyint(1) NULL DEFAULT 0,
  `FarmerPromoGlowExpiredOn` datetime NULL DEFAULT NULL,
  `PANNumber` varchar(100) NULL DEFAULT NULL,
  `DocumentNumber` varchar(100) NULL DEFAULT NULL,
  `DeactivatedOwn` tinyint(1) NULL DEFAULT 0,
  `FirstLoginDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`RetailerRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `RetailerSales` (
  `RetailerSalesRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `ParentCodeRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `Points` decimal(11,4) NULL DEFAULT NULL,
  `Price` decimal(11,4) NULL DEFAULT NULL,
  `FYYear` varchar(20) NULL DEFAULT NULL,
  `IsDispatched` tinyint(1) NULL DEFAULT 0,
  `RetailerRecId` int(11) NOT NULL,
  `ScannedDate` datetime NOT NULL,
  `SoldDate` datetime NOT NULL,
  `IsReturned` tinyint(1) NULL DEFAULT NULL,
  `IsDuplicateSales` tinyint(1) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `ReturnedOn` datetime NULL DEFAULT NULL,
  `DeviceRecId` int(11) NULL DEFAULT NULL,
  `LotRecId` int(11) NULL DEFAULT NULL,
  `HybridPointsHistoryRecId` int(11) NULL DEFAULT NULL,
  `HybridPriceHistoryRecId` int(11) NULL DEFAULT NULL,
  `ReturnedOn_UK` varchar(50) NULL DEFAULT '',
  `DupScannedOn_UK` varchar(50) NULL DEFAULT '',
  `Souce_UK` varchar(20) NULL DEFAULT '',
  `Conv_DistributorSalesRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`RetailerSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `RetailerSecSales` (
  `RetailerSecSalesRecId` int(11) NOT NULL AUTO_INCREMENT,
  `CodeRecId` int(11) NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `RetailerRecId` int(11) NOT NULL,
  `DeviceRecId` int(11) NULL DEFAULT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `SoldDate` datetime NOT NULL,
  `ScannedDate` datetime NOT NULL,
  `IsReturned` tinyint(1) NULL DEFAULT NULL,
  `ReturnedOn` datetime NULL DEFAULT NULL,
  `IsDuplicateSales` tinyint(1) NULL DEFAULT NULL,
  `Conv_DistributorSecSalesRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`RetailerSecSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `RSM` (
  `RSMRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ERPId` varchar(50) NULL DEFAULT NULL,
  `RegionRecId` int(11) NOT NULL,
  `UsersRecId` int(11) NOT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`RSMRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `State` (
  `StateRecId` int(11) NOT NULL AUTO_INCREMENT,
  `State` varchar(50) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`StateRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Territory` (
  `TerritoryRecId` int(11) NOT NULL AUTO_INCREMENT,
  `Territory` varchar(50) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `RegionRecId` int(11) NOT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`TerritoryRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Users` (
  `UsersRecId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NULL DEFAULT NULL,
  `PlantRecId` int(11) NULL DEFAULT NULL,
  `Designation` varchar(50) NULL DEFAULT NULL,
  `Type` varchar(50) NULL DEFAULT NULL,
  `EmailId` varchar(100) NULL DEFAULT NULL,
  `Title` varchar(50) NULL DEFAULT NULL,
  `Phone1` varchar(50) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `IsAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `IsSuperAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `IsTrackable` tinyint(1) NULL DEFAULT 0,
  `IsPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `IsDataPolicyAccepted` tinyint(1) NULL DEFAULT 0,
  `LoadingPage` varchar(500) NULL DEFAULT NULL,
  `FirstLogin` datetime NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `IsAutoMail` tinyint(1) NULL DEFAULT NULL,
  `Passwd` varchar(100) NULL DEFAULT NULL,
  `ThemeRecId` int(11) NULL DEFAULT NULL,
  `UserLanguageRecId` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `IsManager` tinyint(1) NOT NULL DEFAULT 0,
  `IsInternalUser` tinyint(1) NOT NULL DEFAULT 0,
  `IsDemoUser` tinyint(1) NULL DEFAULT 0,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`UsersRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Variety` (
  `VarietyRecId` int(11) NOT NULL AUTO_INCREMENT,
  `Variety` varchar(100) NOT NULL,
  `ShortName` varchar(100) NULL DEFAULT NULL,
  `Basic` varchar(50) NULL DEFAULT NULL,
  `ProductGroupRecId` int(11) NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`VarietyRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Zone` (
  `ZoneRecId` int(11) NOT NULL AUTO_INCREMENT,
  `Zone` varchar(50) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ZoneRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `ZSM` (
  `ZSMRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ERPId` varchar(50) NULL DEFAULT NULL,
  `ZoneRecId` int(11) NOT NULL,
  `UsersRecId` int(11) NOT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ZSMRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Warehouse` (
  `WarehouseRecId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `HideFromUI` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`WarehouseRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `TSM` (
  `TSMRecId` int(11) NOT NULL AUTO_INCREMENT,
  `ERPId` varchar(50) NULL DEFAULT NULL,
  `UsersRecId` int(11) NOT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 1,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `IsAmbassador` bigint(1) NULL DEFAULT 0,
  `AmbassadorRegionRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TSMRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `SKU` (
  `SKURecId` int(11) NOT NULL AUTO_INCREMENT,
  `PackSize` varchar(100) NOT NULL,
  `UnitType` varchar(50) NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `VarietyRecId` int(11) NOT NULL,
  PRIMARY KEY (`SKURecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Dispatch` (
  `DispatchRecId` int(11) NOT NULL,
  `PlantRecId` int(11) NULL DEFAULT NULL,
  `FromWarehouseRecId` int(11) NULL DEFAULT NULL,
  `WarehouseRecId` int(11) NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `CreatedBy` int(11) NULL DEFAULT NULL,
  `ModifiedBy` int(11) NULL DEFAULT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `Type` varchar(5) NULL DEFAULT NULL,
  `AppType` varchar(5) NULL DEFAULT NULL,
  `MailDescriptionRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DispatchRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DispatchItem` (
  `DispatchItemRecId` int(11) NOT NULL,
  `DispatchRecId` int(11) NULL DEFAULT NULL,
  `CodeRecId` int(11) NULL DEFAULT NULL,
  `ParentCodeRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `IsClosed` tinyint(1) NULL DEFAULT 0,
  `FYYear` varchar(20) NULL DEFAULT NULL,
  `Price` decimal(11,4) NULL DEFAULT NULL,
  `HybridPriceHistoryRecId` int(11) NULL DEFAULT NULL,
  `LotRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DispatchItemRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `WarehouseReturn` (
  `WarehouseReturnRecId` int(11) NOT NULL,
  `WarehouseRecId` int(11) NOT NULL,
  `CodeRecId` int(11) NOT NULL,
  `ParentCodeRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NOT NULL,
  `DeviceRecId` int(11) NULL DEFAULT NULL,
  `ScannedBy` int(11) NOT NULL,
  `ScannedDate` datetime NOT NULL,
  `LotRecId` int(11) NULL DEFAULT NULL,
  `FYYear` varchar(20) NULL DEFAULT NULL,
  `Price` decimal(11,4) NULL DEFAULT NULL,
  `HybridPriceHistoryRecId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WarehouseReturnRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `MonthlyBudget` (
  `MonthlyBudgetRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadBy` int(11) NOT NULL,
  PRIMARY KEY (`MonthlyBudgetRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `MonthlyBudgetMonth` (
  `MonthlyBudgetMonthRecId` int(11) NOT NULL,
  `MonthlyBudgetRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `Month` int(11) NULL DEFAULT NULL,
  `Weight` decimal(15,3) NULL DEFAULT NULL,
  `Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`MonthlyBudgetMonthRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `YBTopSaleDistributor` (
  `YBTopSaleDistributorRecId` int(11) NOT NULL,
  `YearlyBudgetRecId` int(11) NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `DisplayOrder` int(11) NULL DEFAULT 0,
  `CreatedOn` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`YBTopSaleDistributorRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `YearlyBudget` (
  `YearlyBudgetRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadBy` int(11) NOT NULL,
  PRIMARY KEY (`YearlyBudgetRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `YearlyBudgetMonth` (
  `YearlyBudgetMonthRecId` int(11) NOT NULL,
  `YearlyBudgetRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `Month` int(11) NULL DEFAULT NULL,
  `Weight` decimal(15,3) NULL DEFAULT NULL,
  `Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`YearlyBudgetMonthRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `YearlyBudgetTopDispDist` (
  `YearlyBudgetTopDispDistRecId` int(11) NOT NULL,
  `YBTopSaleDistributorRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NOT NULL,
  `Weight` decimal(15,3) NULL DEFAULT NULL,
  `Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`YearlyBudgetTopDispDistRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DealerInventory` (
  `DealerInventoryRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `Month` int(11) NULL DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadBy` int(11) NOT NULL,
  PRIMARY KEY (`DealerInventoryRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DealerInventorySales` (
  `DealerInventorySalesRecId` int(11) NOT NULL,
  `DealerInventoryRecId` int(11) NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `Inventory` decimal(15,3) NULL DEFAULT NULL,
  `InventoryPrice` decimal(21,3) NULL DEFAULT 0.000,
  `DistInventory` decimal(15,3) NULL DEFAULT NULL,
  `DistInventoryPrice` decimal(21,3) NULL DEFAULT 0.000,
  `Weight` decimal(15,3) NULL DEFAULT NULL,
  `Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`DealerInventorySalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DistributorInventory` (
  `DistributorInventoryRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `Month` int(11) NULL DEFAULT NULL,
  `Inventory` decimal(15,3) NULL DEFAULT NULL,
  `InventoryPrice` decimal(21,3) NULL DEFAULT 0.000,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `DistributorInventorySales` (
  `DistributorInventorySalesRecId` int(11) NOT NULL,
  `DistributorInventoryRecId` int(11) NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `Weight` decimal(15,3) NULL DEFAULT NULL,
  `Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`DistributorInventorySalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `OpeningInventory` (
  `OpeningInventoryRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadedBy` int(11) NOT NULL,
  PRIMARY KEY (`OpeningInventoryRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `OpeningInventorySales` (
  `OpeningInventorySalesRecId` int(11) NOT NULL,
  `OpeningInventoryRecId` int(11) NOT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `DT_OI` decimal(15,3) NULL DEFAULT NULL,
  `RT_OI` decimal(15,3) NULL DEFAULT NULL,
  `DT_OI_Price` decimal(21,3) NULL DEFAULT 0.000,
  `RT_OI_Price` decimal(21,3) NULL DEFAULT 0.000,
  PRIMARY KEY (`OpeningInventorySalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `SAPSales` (
  `SAPSalesRecId` int(11) NOT NULL,
  `TerritoryRecId` int(11) NULL DEFAULT NULL,
  `HybridRecId` int(11) NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `MaterialRecId_b` int(11) NULL DEFAULT NULL,
  `BillDate` date NULL DEFAULT NULL,
  `PricingDate` date NULL DEFAULT NULL,
  `Month` int(11) NULL DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `Returns` decimal(15,3) NULL DEFAULT 0.000,
  `BillINR` decimal(21,3) NULL DEFAULT 0.000,
  `PriceINR` decimal(21,3) NULL DEFAULT 0.000,
  `SAPSalesReasonRecId` int(11) NULL DEFAULT NULL,
  `UploadDocsRecId` int(11) NULL DEFAULT NULL,
  `UploadedOn` datetime NOT NULL,
  `UploadBy` int(11) NOT NULL,
  PRIMARY KEY (`SAPSalesRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Device` (
  `DeviceRecId` int(11) NOT NULL AUTO_INCREMENT,
  `IMEI` varchar(50) NULL DEFAULT NULL,
  `DistributorRecId` int(11) NULL DEFAULT NULL,
  `RetailerRecId` int(11) NULL DEFAULT NULL,
  `TSMRecId` int(11) NULL DEFAULT NULL,
  `MDORecId` int(11) NULL DEFAULT NULL,
  `UsersRecId` int(11) NULL DEFAULT NULL,
  `WarehouseUsersRecId` int(11) NULL DEFAULT NULL,
  `DeviceModel` varchar(50) NULL DEFAULT NULL,
  `AppVersion` varchar(50) NULL DEFAULT NULL,
  `FCMToken` varchar(500) NULL DEFAULT NULL,
  `OS` varchar(50) NULL DEFAULT NULL,
  `OSVersion` varchar(50) NULL DEFAULT NULL,
  `IsActive` tinyint(1) NULL DEFAULT 0,
  `ValidUpto` datetime NULL DEFAULT NULL,
  `AppLastUpdatedDate` datetime NULL DEFAULT NULL,
  `LastSeenDate` datetime NULL DEFAULT NULL,
  `CreatedDate` datetime NULL DEFAULT NULL,
  `ModifiedDate` datetime NULL DEFAULT NULL,
  `LastScannedDate` datetime NULL DEFAULT NULL,
  `Phone` varchar(20) NULL DEFAULT NULL,
  `IsOwnerDevice` tinyint(1) NULL DEFAULT 0,
  `Name` varchar(45) NULL DEFAULT NULL,
  `ERPId` int(11) NULL DEFAULT NULL,
  `IsOTPVerified` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`DeviceRecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Indexes on referenced non-PK columns
ALTER TABLE `DistributorInventory` ADD INDEX (`DistributorInventoryRecId`);

-- Foreign keys
ALTER TABLE `Code` ADD INDEX (`LotRecId`);
ALTER TABLE `Code` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `Distributor` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `Distributor` ADD INDEX (`MDORecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `Distributor` ADD INDEX (`StateRecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`StateRecId`) REFERENCES `State`(`StateRecId`);
ALTER TABLE `Distributor` ADD INDEX (`DistrictRecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`DistrictRecId`) REFERENCES `District`(`DistrictRecId`);
ALTER TABLE `Distributor` ADD INDEX (`ApprovedBy`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`ApprovedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Distributor` ADD INDEX (`GEOTSMRecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`GEOTSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `Distributor` ADD INDEX (`GEOMDORecId`);
ALTER TABLE `Distributor` ADD FOREIGN KEY (`GEOMDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`DistributorRecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`TSMRecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`MDORecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`CodeRecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`HybridRecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DistributorSecSales` ADD INDEX (`DeviceRecId`);
ALTER TABLE `DistributorSecSales` ADD FOREIGN KEY (`DeviceRecId`) REFERENCES `Device`(`DeviceRecId`);
ALTER TABLE `District` ADD INDEX (`StateRecId`);
ALTER TABLE `District` ADD FOREIGN KEY (`StateRecId`) REFERENCES `State`(`StateRecId`);
ALTER TABLE `District` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `District` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`CodeRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`ParentCodeRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`ParentCodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`HybridRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`DupDistributorRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`DupDistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`DupRetailerRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`DupRetailerRecId`) REFERENCES `Retailer`(`RetailerRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`DupMDORecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`DupMDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`DupTSMRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`DupTSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`DistributorRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`RetailerRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`RetailerRecId`) REFERENCES `Retailer`(`RetailerRecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`MDORecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `DuplicateSales` ADD INDEX (`TSMRecId`);
ALTER TABLE `DuplicateSales` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `Hybrid` ADD INDEX (`SKURecId`);
ALTER TABLE `Hybrid` ADD FOREIGN KEY (`SKURecId`) REFERENCES `SKU`(`SKURecId`);
ALTER TABLE `HybridPointsHistory` ADD INDEX (`HybridRecId`);
ALTER TABLE `HybridPointsHistory` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `HybridPointsHistory` ADD INDEX (`CreatedBy`);
ALTER TABLE `HybridPointsHistory` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `HybridPointsHistory` ADD INDEX (`ModifiedBy`);
ALTER TABLE `HybridPointsHistory` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `HybridPriceHistory` ADD INDEX (`HybridRecId`);
ALTER TABLE `HybridPriceHistory` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `HybridPriceHistory` ADD INDEX (`CreatedBy`);
ALTER TABLE `HybridPriceHistory` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `HybridPriceHistory` ADD INDEX (`ModifiedBy`);
ALTER TABLE `HybridPriceHistory` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `LooseBox` ADD INDEX (`CodeRecId`);
ALTER TABLE `LooseBox` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `LooseBox` ADD INDEX (`LooseBoxTypeRecId`);
ALTER TABLE `LooseBox` ADD FOREIGN KEY (`LooseBoxTypeRecId`) REFERENCES `LooseBoxType`(`LooseBoxTypeRecId`);
ALTER TABLE `LooseBox` ADD INDEX (`ModifiedBy`);
ALTER TABLE `LooseBox` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Lot` ADD INDEX (`HybridRecId`);
ALTER TABLE `Lot` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `Lot` ADD INDEX (`CreatedBy`);
ALTER TABLE `Lot` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Lot` ADD INDEX (`CompletedBy`);
ALTER TABLE `Lot` ADD FOREIGN KEY (`CompletedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Lot` ADD INDEX (`DeletedBy`);
ALTER TABLE `Lot` ADD FOREIGN KEY (`DeletedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `LotRoll` ADD INDEX (`LotRecId`);
ALTER TABLE `LotRoll` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `LotRoll` ADD INDEX (`StartCodeRecId`);
ALTER TABLE `LotRoll` ADD FOREIGN KEY (`StartCodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `LotRoll` ADD INDEX (`EndCodeRecId`);
ALTER TABLE `LotRoll` ADD FOREIGN KEY (`EndCodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `LotRoll` ADD INDEX (`IssuedBy`);
ALTER TABLE `LotRoll` ADD FOREIGN KEY (`IssuedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `LotRoll` ADD INDEX (`ReceivedBy`);
ALTER TABLE `LotRoll` ADD FOREIGN KEY (`ReceivedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `MDO` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `MDO` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `MDO` ADD INDEX (`StateRecId`);
ALTER TABLE `MDO` ADD FOREIGN KEY (`StateRecId`) REFERENCES `State`(`StateRecId`);
ALTER TABLE `MDO` ADD INDEX (`DistrictRecId`);
ALTER TABLE `MDO` ADD FOREIGN KEY (`DistrictRecId`) REFERENCES `District`(`DistrictRecId`);
ALTER TABLE `Packing` ADD INDEX (`CodeRecId`);
ALTER TABLE `Packing` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `Packing` ADD INDEX (`LotRecId`);
ALTER TABLE `Packing` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `Packing` ADD INDEX (`WarehouseRecId`);
ALTER TABLE `Packing` ADD FOREIGN KEY (`WarehouseRecId`) REFERENCES `Warehouse`(`WarehouseRecId`);
ALTER TABLE `Packing` ADD INDEX (`CreatedBy`);
ALTER TABLE `Packing` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `PackingItems` ADD INDEX (`CodeRecId`);
ALTER TABLE `PackingItems` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `PackingItems` ADD INDEX (`PackingRecId`);
ALTER TABLE `PackingItems` ADD FOREIGN KEY (`PackingRecId`) REFERENCES `Packing`(`PackingRecId`);
ALTER TABLE `PackingItems` ADD INDEX (`HybridRecId`);
ALTER TABLE `PackingItems` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `ProductGroup` ADD INDEX (`ProductTypeRecId`);
ALTER TABLE `ProductGroup` ADD FOREIGN KEY (`ProductTypeRecId`) REFERENCES `ProductType`(`ProductTypeRecId`);
ALTER TABLE `Region` ADD INDEX (`ZoneRecId`);
ALTER TABLE `Region` ADD FOREIGN KEY (`ZoneRecId`) REFERENCES `Zone`(`ZoneRecId`);
ALTER TABLE `Retailer` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `Retailer` ADD INDEX (`MDORecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `Retailer` ADD INDEX (`StateRecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`StateRecId`) REFERENCES `State`(`StateRecId`);
ALTER TABLE `Retailer` ADD INDEX (`DistrictRecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`DistrictRecId`) REFERENCES `District`(`DistrictRecId`);
ALTER TABLE `Retailer` ADD INDEX (`ApprovedBy`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`ApprovedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Retailer` ADD INDEX (`GEOTSMRecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`GEOTSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `Retailer` ADD INDEX (`GEOMDORecId`);
ALTER TABLE `Retailer` ADD FOREIGN KEY (`GEOMDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`CodeRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`ParentCodeRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`ParentCodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`HybridRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`RetailerRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`RetailerRecId`) REFERENCES `Retailer`(`RetailerRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`MDORecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`TSMRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`DeviceRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`DeviceRecId`) REFERENCES `Device`(`DeviceRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`LotRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `RetailerSales` ADD INDEX (`HybridPriceHistoryRecId`);
ALTER TABLE `RetailerSales` ADD FOREIGN KEY (`HybridPriceHistoryRecId`) REFERENCES `HybridPriceHistory`(`HybridPriceHistoryRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`CodeRecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`HybridRecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`RetailerRecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`RetailerRecId`) REFERENCES `Retailer`(`RetailerRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`DeviceRecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`DeviceRecId`) REFERENCES `Device`(`DeviceRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`TSMRecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `RetailerSecSales` ADD INDEX (`MDORecId`);
ALTER TABLE `RetailerSecSales` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `RSM` ADD INDEX (`RegionRecId`);
ALTER TABLE `RSM` ADD FOREIGN KEY (`RegionRecId`) REFERENCES `Region`(`RegionRecId`);
ALTER TABLE `RSM` ADD INDEX (`UsersRecId`);
ALTER TABLE `RSM` ADD FOREIGN KEY (`UsersRecId`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Territory` ADD INDEX (`TSMRecId`);
ALTER TABLE `Territory` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `Territory` ADD INDEX (`RegionRecId`);
ALTER TABLE `Territory` ADD FOREIGN KEY (`RegionRecId`) REFERENCES `Region`(`RegionRecId`);
ALTER TABLE `Variety` ADD INDEX (`ProductGroupRecId`);
ALTER TABLE `Variety` ADD FOREIGN KEY (`ProductGroupRecId`) REFERENCES `ProductGroup`(`ProductGroupRecId`);
ALTER TABLE `ZSM` ADD INDEX (`ZoneRecId`);
ALTER TABLE `ZSM` ADD FOREIGN KEY (`ZoneRecId`) REFERENCES `Zone`(`ZoneRecId`);
ALTER TABLE `ZSM` ADD INDEX (`UsersRecId`);
ALTER TABLE `ZSM` ADD FOREIGN KEY (`UsersRecId`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Warehouse` ADD INDEX (`ModifiedBy`);
ALTER TABLE `Warehouse` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `TSM` ADD INDEX (`UsersRecId`);
ALTER TABLE `TSM` ADD FOREIGN KEY (`UsersRecId`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `TSM` ADD INDEX (`AmbassadorRegionRecId`);
ALTER TABLE `TSM` ADD FOREIGN KEY (`AmbassadorRegionRecId`) REFERENCES `Region`(`RegionRecId`);
ALTER TABLE `SKU` ADD INDEX (`VarietyRecId`);
ALTER TABLE `SKU` ADD FOREIGN KEY (`VarietyRecId`) REFERENCES `Variety`(`VarietyRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`PlantRecId`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`PlantRecId`) REFERENCES `Plant`(`PlantRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`FromWarehouseRecId`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`FromWarehouseRecId`) REFERENCES `Warehouse`(`WarehouseRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`WarehouseRecId`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`WarehouseRecId`) REFERENCES `Warehouse`(`WarehouseRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`DistributorRecId`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`CreatedBy`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Dispatch` ADD INDEX (`ModifiedBy`);
ALTER TABLE `Dispatch` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`DispatchRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`DispatchRecId`) REFERENCES `Dispatch`(`DispatchRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`CodeRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`ParentCodeRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`ParentCodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`HybridRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`HybridPriceHistoryRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`HybridPriceHistoryRecId`) REFERENCES `HybridPriceHistory`(`HybridPriceHistoryRecId`);
ALTER TABLE `DispatchItem` ADD INDEX (`LotRecId`);
ALTER TABLE `DispatchItem` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`WarehouseRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`WarehouseRecId`) REFERENCES `Warehouse`(`WarehouseRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`CodeRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`CodeRecId`) REFERENCES `Code`(`CodeRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`HybridRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`DeviceRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`DeviceRecId`) REFERENCES `Device`(`DeviceRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`ScannedBy`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`ScannedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`LotRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`LotRecId`) REFERENCES `Lot`(`LotRecId`);
ALTER TABLE `WarehouseReturn` ADD INDEX (`HybridPriceHistoryRecId`);
ALTER TABLE `WarehouseReturn` ADD FOREIGN KEY (`HybridPriceHistoryRecId`) REFERENCES `HybridPriceHistory`(`HybridPriceHistoryRecId`);
ALTER TABLE `MonthlyBudget` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `MonthlyBudget` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `MonthlyBudget` ADD INDEX (`UploadBy`);
ALTER TABLE `MonthlyBudget` ADD FOREIGN KEY (`UploadBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `MonthlyBudgetMonth` ADD INDEX (`MonthlyBudgetRecId`);
ALTER TABLE `MonthlyBudgetMonth` ADD FOREIGN KEY (`MonthlyBudgetRecId`) REFERENCES `MonthlyBudget`(`MonthlyBudgetRecId`);
ALTER TABLE `MonthlyBudgetMonth` ADD INDEX (`HybridRecId`);
ALTER TABLE `MonthlyBudgetMonth` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `YBTopSaleDistributor` ADD INDEX (`YearlyBudgetRecId`);
ALTER TABLE `YBTopSaleDistributor` ADD FOREIGN KEY (`YearlyBudgetRecId`) REFERENCES `YearlyBudget`(`YearlyBudgetRecId`);
ALTER TABLE `YBTopSaleDistributor` ADD INDEX (`DistributorRecId`);
ALTER TABLE `YBTopSaleDistributor` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `YearlyBudget` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `YearlyBudget` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `YearlyBudget` ADD INDEX (`UploadBy`);
ALTER TABLE `YearlyBudget` ADD FOREIGN KEY (`UploadBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `YearlyBudgetMonth` ADD INDEX (`YearlyBudgetRecId`);
ALTER TABLE `YearlyBudgetMonth` ADD FOREIGN KEY (`YearlyBudgetRecId`) REFERENCES `YearlyBudget`(`YearlyBudgetRecId`);
ALTER TABLE `YearlyBudgetMonth` ADD INDEX (`HybridRecId`);
ALTER TABLE `YearlyBudgetMonth` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `YearlyBudgetTopDispDist` ADD INDEX (`YBTopSaleDistributorRecId`);
ALTER TABLE `YearlyBudgetTopDispDist` ADD FOREIGN KEY (`YBTopSaleDistributorRecId`) REFERENCES `YBTopSaleDistributor`(`YBTopSaleDistributorRecId`);
ALTER TABLE `YearlyBudgetTopDispDist` ADD INDEX (`HybridRecId`);
ALTER TABLE `YearlyBudgetTopDispDist` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DealerInventory` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `DealerInventory` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `DealerInventory` ADD INDEX (`UploadBy`);
ALTER TABLE `DealerInventory` ADD FOREIGN KEY (`UploadBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `DealerInventorySales` ADD INDEX (`HybridRecId`);
ALTER TABLE `DealerInventorySales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DistributorInventory` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `DistributorInventory` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `DistributorInventory` ADD INDEX (`HybridRecId`);
ALTER TABLE `DistributorInventory` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `DistributorInventory` ADD INDEX (`UploadBy`);
ALTER TABLE `DistributorInventory` ADD FOREIGN KEY (`UploadBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `DistributorInventorySales` ADD INDEX (`DistributorInventoryRecId`);
ALTER TABLE `DistributorInventorySales` ADD FOREIGN KEY (`DistributorInventoryRecId`) REFERENCES `DistributorInventory`(`DistributorInventoryRecId`);
ALTER TABLE `DistributorInventorySales` ADD INDEX (`DistributorRecId`);
ALTER TABLE `DistributorInventorySales` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `OpeningInventory` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `OpeningInventory` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `OpeningInventory` ADD INDEX (`UploadedBy`);
ALTER TABLE `OpeningInventory` ADD FOREIGN KEY (`UploadedBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `OpeningInventorySales` ADD INDEX (`OpeningInventoryRecId`);
ALTER TABLE `OpeningInventorySales` ADD FOREIGN KEY (`OpeningInventoryRecId`) REFERENCES `OpeningInventory`(`OpeningInventoryRecId`);
ALTER TABLE `OpeningInventorySales` ADD INDEX (`HybridRecId`);
ALTER TABLE `OpeningInventorySales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `SAPSales` ADD INDEX (`TerritoryRecId`);
ALTER TABLE `SAPSales` ADD FOREIGN KEY (`TerritoryRecId`) REFERENCES `Territory`(`TerritoryRecId`);
ALTER TABLE `SAPSales` ADD INDEX (`HybridRecId`);
ALTER TABLE `SAPSales` ADD FOREIGN KEY (`HybridRecId`) REFERENCES `Hybrid`(`HybridRecId`);
ALTER TABLE `SAPSales` ADD INDEX (`DistributorRecId`);
ALTER TABLE `SAPSales` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `SAPSales` ADD INDEX (`UploadBy`);
ALTER TABLE `SAPSales` ADD FOREIGN KEY (`UploadBy`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Device` ADD INDEX (`DistributorRecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`DistributorRecId`) REFERENCES `Distributor`(`DistributorRecId`);
ALTER TABLE `Device` ADD INDEX (`RetailerRecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`RetailerRecId`) REFERENCES `Retailer`(`RetailerRecId`);
ALTER TABLE `Device` ADD INDEX (`TSMRecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`TSMRecId`) REFERENCES `TSM`(`TSMRecId`);
ALTER TABLE `Device` ADD INDEX (`MDORecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`MDORecId`) REFERENCES `MDO`(`MDORecId`);
ALTER TABLE `Device` ADD INDEX (`UsersRecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`UsersRecId`) REFERENCES `Users`(`UsersRecId`);
ALTER TABLE `Device` ADD INDEX (`WarehouseUsersRecId`);
ALTER TABLE `Device` ADD FOREIGN KEY (`WarehouseUsersRecId`) REFERENCES `Users`(`UsersRecId`);

SET FOREIGN_KEY_CHECKS=1;

-- Data for table `code` (106 rows)
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9001, NULL, 'KCODE1', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9002, NULL, 'KCODE2', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9003, NULL, 'KCODE3', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9004, NULL, 'KCODE4', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9005, NULL, 'KCODE5', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9006, NULL, 'KCODE6', NULL);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9007, NULL, 'KZ2026-1001', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9008, NULL, 'KZ2026-1002', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9009, NULL, 'KZ2026-1003', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9010, NULL, 'KZ2026-1004', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9011, NULL, 'KZ2026-1005', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9012, NULL, 'KZ2026-1006', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9013, NULL, 'KZ2026-1007', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9014, NULL, 'KZ2026-1008', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9015, NULL, 'KZ2026-1009', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9016, NULL, 'KZ2026-1010', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9017, NULL, 'KZ2026-1011', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9018, NULL, 'KZ2026-1012', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9019, NULL, 'KZ2026-1013', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9020, NULL, 'KZ2026-1014', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9021, NULL, 'KZ2026-1015', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9022, NULL, 'KZ2026-1016', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9023, NULL, 'KZ2026-1017', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9024, NULL, 'KZ2026-1018', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9025, NULL, 'KZ2026-1019', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9026, NULL, 'KZ2026-1020', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9027, NULL, 'KZ2026-1021', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9028, NULL, 'KZ2026-1022', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9029, NULL, 'KZ2026-1023', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9030, NULL, 'KZ2026-1024', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9031, NULL, 'KZ2026-1025', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9032, NULL, 'KZ2026-1026', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9033, NULL, 'KZ2026-1027', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9034, NULL, 'KZ2026-1028', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9035, NULL, 'KZ2026-1029', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9036, NULL, 'KZ2026-1030', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9037, NULL, 'KZ2026-1031', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9038, NULL, 'KZ2026-1032', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9039, NULL, 'KZ2026-1033', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9040, NULL, 'KZ2026-1034', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9041, NULL, 'KZ2026-1035', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9042, NULL, 'KZ2026-1036', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9043, NULL, 'KZ2026-1037', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9044, NULL, 'KZ2026-1038', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9045, NULL, 'KZ2026-1039', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9046, NULL, 'KZ2026-1040', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9047, NULL, 'KZ2026-1041', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9048, NULL, 'KZ2026-1042', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9049, NULL, 'KZ2026-1043', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9050, NULL, 'KZ2026-1044', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9051, NULL, 'KZ2026-1045', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9052, NULL, 'KZ2026-1046', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9053, NULL, 'KZ2026-1047', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9054, NULL, 'KZ2026-1048', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9055, NULL, 'KZ2026-1049', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9056, NULL, 'KZ2026-1050', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9057, NULL, 'KZ2026-1051', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9058, NULL, 'KZ2026-1052', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9059, NULL, 'KZ2026-1053', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9060, NULL, 'KZ2026-1054', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9061, NULL, 'KZ2026-1055', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9062, NULL, 'KZ2026-1056', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9063, NULL, 'KZ2026-1057', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9064, NULL, 'KZ2026-1058', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9065, NULL, 'KZ2026-1059', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9066, NULL, 'KZ2026-1060', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9067, NULL, 'KZ2026-1061', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9068, NULL, 'KZ2026-1062', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9069, NULL, 'KZ2026-1063', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9070, NULL, 'KZ2026-1064', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9071, NULL, 'KZ2026-1065', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9072, NULL, 'KZ2026-1066', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9073, NULL, 'KZ2026-1067', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9074, NULL, 'KZ2026-1068', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9075, NULL, 'KZ2026-1069', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9076, NULL, 'KZ2026-1070', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9077, NULL, 'KZ2026-1071', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9078, NULL, 'KZ2026-1072', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9079, NULL, 'KZ2026-1073', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9080, NULL, 'KZ2026-1074', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9081, NULL, 'KZ2026-1075', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9082, NULL, 'KZ2026-1076', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9083, NULL, 'KZ2026-1077', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9084, NULL, 'KZ2026-1078', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9085, NULL, 'KZ2026-1079', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9086, NULL, 'KZ2026-1080', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9087, NULL, 'KZ2026-1081', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9088, NULL, 'KZ2026-1082', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9089, NULL, 'KZ2026-1083', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9090, NULL, 'KZ2026-1084', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9091, NULL, 'KZ2026-1085', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9092, NULL, 'KZ2026-1086', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9093, NULL, 'KZ2026-1087', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9094, NULL, 'KZ2026-1088', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9095, NULL, 'KZ2026-1089', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9096, NULL, 'KZ2026-1090', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9097, NULL, 'KZ2026-1091', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9098, NULL, 'KZ2026-1092', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9099, NULL, 'KZ2026-1093', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9100, NULL, 'KZ2026-1094', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9101, NULL, 'KZ2026-1095', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9102, NULL, 'KZ2026-1096', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9103, NULL, 'KZ2026-1097', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9104, NULL, 'KZ2026-1098', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9105, NULL, 'KZ2026-1099', 9001);
INSERT INTO `code` (`CodeRecId`, `SeqNum`, `Code`, `LotRecId`) VALUES (9106, NULL, 'KZ2026-1100', 9001);

-- Data for table `dealerinventory` (10 rows)
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (14, 23, 46, 84, 49, '2026-08-18 19:07:05', 17);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (25, 3, 32, 94, 69, '2026-08-18 19:07:05', 54);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (33, 64, 38, 76, 41, '2026-08-18 19:07:05', 4);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (54, 48, 41, 9, 20, '2026-08-18 19:07:05', 33);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (58, 28, 21, 58, 30, '2026-08-18 19:07:05', 47);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (69, 81, 7, 17, 16, '2026-08-18 19:07:05', 61);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (72, 31, 27, 69, 43, '2026-08-18 19:07:05', 3);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (80, 55, 31, 20, 23, '2026-08-18 19:07:05', 7);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (85, 75, 28, 55, 67, '2026-08-18 19:07:05', 21);
INSERT INTO `dealerinventory` (`DealerInventoryRecId`, `TerritoryRecId`, `Month`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (95, 49, 97, 91, 5, '2026-08-18 19:07:05', 44);

-- Data for table `dealerinventorysales` (10 rows)
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (9, 94, 79, 30, '448.160', '28.550', '248.260', '180.210', '154.610', '226.710');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (11, 68, 57, 49, '53.980', '198.210', '224.650', '464.450', '458.240', '222.530');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (25, 79, 44, 98, '344.920', '204.290', '407.570', '268.880', '170.680', '229.950');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (32, 72, 94, 92, '156.980', '123.900', '97.500', '173.710', '156.920', '363.320');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (39, 72, 100, 38, '238.640', '423.530', '285.820', '186.100', '421.400', '387.860');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (42, 93, 13, 6, '447.670', '445.870', '267.940', '214.940', '405.840', '163.920');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (43, 79, 45, 60, '396.830', '313.780', '174.730', '138.510', '201.790', '487.680');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (73, 11, 14, 90, '155.540', '458.050', '42.660', '363.170', '352.400', '336.590');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (85, 61, 15, 19, '248.150', '23.670', '405.660', '393.820', '458.620', '257.220');
INSERT INTO `dealerinventorysales` (`DealerInventorySalesRecId`, `DealerInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Inventory`, `InventoryPrice`, `DistInventory`, `DistInventoryPrice`, `Weight`, `Price`) VALUES (91, 9, 3, 62, '391.200', '467.400', '462.280', '219.390', '209.280', '288.580');

-- Data for table `device` (10 rows)
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (1, 'IMEI_656', 35, 33, 19, 49, 82, 90, 'DeviceModel_878', 'AppVersion_908', 'FCMToken_437', 'OS_825', 'OSVersion_869', 32, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_789', 92, 'Name_548', 66, 64);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (2, 'IMEI_433', 82, 6, 82, 88, 76, 46, 'DeviceModel_976', 'AppVersion_504', 'FCMToken_314', 'OS_800', 'OSVersion_494', 44, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_205', 2, 'Name_467', 87, 31);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (3, 'IMEI_239', 43, 53, 86, 64, 26, 81, 'DeviceModel_536', 'AppVersion_863', 'FCMToken_211', 'OS_120', 'OSVersion_233', 37, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_231', 33, 'Name_565', 33, 35);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (4, 'IMEI_366', 59, 64, 89, 48, 22, 49, 'DeviceModel_404', 'AppVersion_932', 'FCMToken_992', 'OS_535', 'OSVersion_889', 18, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_405', 61, 'Name_194', 73, 34);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (5, 'IMEI_564', 83, 81, 86, 41, 33, 15, 'DeviceModel_857', 'AppVersion_372', 'FCMToken_838', 'OS_818', 'OSVersion_238', 42, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_353', 98, 'Name_936', 20, 60);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (6, 'IMEI_187', 80, 56, 85, 24, 89, 72, 'DeviceModel_183', 'AppVersion_121', 'FCMToken_578', 'OS_821', 'OSVersion_689', 36, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_746', 19, 'Name_807', 1, 78);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (7, 'IMEI_213', 29, 11, 23, 57, 16, 69, 'DeviceModel_129', 'AppVersion_378', 'FCMToken_206', 'OS_373', 'OSVersion_224', 88, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_388', 47, 'Name_473', 74, 97);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (8, 'IMEI_529', 58, 53, 47, 51, 3, 49, 'DeviceModel_942', 'AppVersion_350', 'FCMToken_936', 'OS_994', 'OSVersion_337', 54, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_161', 100, 'Name_679', 70, 75);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (9, 'IMEI_796', 58, 85, 66, 49, 48, 82, 'DeviceModel_341', 'AppVersion_930', 'FCMToken_138', 'OS_566', 'OSVersion_330', 79, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_503', 77, 'Name_730', 4, 100);
INSERT INTO `device` (`DeviceRecId`, `IMEI`, `DistributorRecId`, `RetailerRecId`, `TSMRecId`, `MDORecId`, `UsersRecId`, `WarehouseUsersRecId`, `DeviceModel`, `AppVersion`, `FCMToken`, `OS`, `OSVersion`, `IsActive`, `ValidUpto`, `AppLastUpdatedDate`, `LastSeenDate`, `CreatedDate`, `ModifiedDate`, `LastScannedDate`, `Phone`, `IsOwnerDevice`, `Name`, `ERPId`, `IsOTPVerified`) VALUES (10, 'IMEI_573', 5, 6, 43, 40, 59, 74, 'DeviceModel_416', 'AppVersion_333', 'FCMToken_284', 'OS_184', 'OSVersion_825', 53, '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 'Phone_496', 51, 'Name_405', 65, 63);

-- Data for table `dispatch` (1 rows)
INSERT INTO `dispatch` (`DispatchRecId`, `PlantRecId`, `FromWarehouseRecId`, `WarehouseRecId`, `DistributorRecId`, `CreatedBy`, `ModifiedBy`, `CreatedOn`, `ModifiedOn`, `Type`, `AppType`, `MailDescriptionRecId`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'Web', NULL);

-- Data for table `dispatchitem` (9 rows)
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (3, 14, 22, 43, 54, '2026-08-18 19:07:05', 17, 'FYYear_506', '58.1600', 19, 27);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (8, 71, 81, 1, 48, '2026-08-18 19:07:05', 8, 'FYYear_317', '61.6300', 32, 1);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (27, 5, 6, 40, 96, '2026-08-18 19:07:05', 76, 'FYYear_308', '57.2400', 40, 99);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (32, 98, 14, 81, 34, '2026-08-18 19:07:05', 94, 'FYYear_146', '256.1800', 38, 11);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (34, 80, 82, 51, 84, '2026-08-18 19:07:05', 75, 'FYYear_365', '297.1500', 40, 89);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (37, 71, 38, 38, 98, '2026-08-18 19:07:05', 53, 'FYYear_172', '72.7400', 90, 87);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (45, 50, 11, 98, 26, '2026-08-18 19:07:05', 33, 'FYYear_693', '272.5900', 21, 63);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (66, 98, 73, 83, 98, '2026-08-18 19:07:05', 51, 'FYYear_219', '12.9200', 77, 76);
INSERT INTO `dispatchitem` (`DispatchItemRecId`, `DispatchRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `ModifiedOn`, `IsClosed`, `FYYear`, `Price`, `HybridPriceHistoryRecId`, `LotRecId`) VALUES (88, 61, 92, 11, 14, '2026-08-18 19:07:05', 59, 'FYYear_881', '180.4800', 100, 74);

-- Data for table `distributor` (8 rows)
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9001, NULL, NULL, 'Alpha', NULL, 9001, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'x', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9002, NULL, NULL, 'Bravo', NULL, 9001, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'x', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9003, NULL, NULL, 'Charlie', NULL, 9002, 9002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'x', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9004, NULL, NULL, 'AgriSupply Corp', NULL, 9008, 9001, 1, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'pass_hash', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9005, NULL, NULL, 'GreenField Logistics', NULL, 9008, 9001, 1, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'pass_hash', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9006, NULL, NULL, 'Apex Crop Solutions', NULL, 9008, 9001, 1, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'pass_hash', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9007, NULL, NULL, 'Horizon Ag Distributors', NULL, 9008, 9001, 1, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'pass_hash', NULL, 0, NULL);
INSERT INTO `distributor` (`DistributorRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `Passwd`, `PANNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (9008, NULL, NULL, 'Vanguard Farm Supply', NULL, 9008, 9001, 1, 9001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'pass_hash', NULL, 0, NULL);

-- Data for table `distributorinventory` (10 rows)
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (32, 84, 93, 69, 22, 90, '139.690', '356.990', 65, '2026-08-18 19:07:05', 87);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (73, 62, 81, 38, 48, 82, '381.120', '108.680', 17, '2026-08-18 19:07:05', 96);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (40, 46, 2, 99, 5, 83, '325.990', '488.240', 88, '2026-08-18 19:07:05', 66);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (94, 24, 56, 4, 57, 30, '60.280', '89.710', 22, '2026-08-18 19:07:05', 5);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (43, 6, 5, 68, 56, 33, '79.140', '393.780', 55, '2026-08-18 19:07:05', 8);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (29, 83, 73, 67, 52, 51, '431.920', '188.060', 30, '2026-08-18 19:07:05', 38);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (28, 6, 17, 67, 51, 43, '470.230', '374.100', 15, '2026-08-18 19:07:05', 92);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (32, 100, 24, 16, 30, 35, '296.210', '299.640', 29, '2026-08-18 19:07:05', 4);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (89, 78, 37, 41, 42, 89, '414.830', '402.280', 75, '2026-08-18 19:07:05', 46);
INSERT INTO `distributorinventory` (`DistributorInventoryRecId`, `TerritoryRecId`, `HybridRecId`, `MaterialRecId_b`, `Year`, `Month`, `Inventory`, `InventoryPrice`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (100, 16, 67, 7, 28, 68, '150.710', '96.850', 81, '2026-08-18 19:07:05', 77);

-- Data for table `distributorinventorysales` (10 rows)
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (6, 39, 18, '446.470', '153.860');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (9, 42, 39, '73.460', '144.540');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (15, 47, 77, '410.990', '29.060');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (28, 71, 4, '37.540', '85.430');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (32, 60, 71, '159.140', '343.370');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (38, 76, 24, '159.020', '445.200');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (39, 50, 24, '112.890', '21.430');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (56, 65, 63, '186.400', '266.030');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (58, 7, 65, '434.350', '113.850');
INSERT INTO `distributorinventorysales` (`DistributorInventorySalesRecId`, `DistributorInventoryRecId`, `DistributorRecId`, `Weight`, `Price`) VALUES (69, 88, 95, '249.620', '281.070');

-- Data for table `distributorsales` (55 rows)
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9001, 9001, NULL, NULL, 9001, NULL, '2026-08-13 18:37:43', 9001, NULL, '100.0000', NULL, 0, '2026-08-13 18:37:43', 0, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9002, 9001, NULL, NULL, 9002, NULL, '2026-08-13 18:37:43', 9001, NULL, '200.0000', NULL, 0, '2026-08-13 18:37:43', 0, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9003, 9002, NULL, NULL, 9003, NULL, '2026-08-13 18:37:43', 9001, NULL, '50.0000', NULL, 0, '2026-08-13 18:37:43', 0, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9004, 9003, NULL, NULL, 9004, NULL, '2026-08-13 18:37:43', 9001, NULL, '400.0000', NULL, 0, '2026-08-13 18:37:43', 0, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9005, 9003, NULL, NULL, 9005, NULL, '2026-08-13 18:37:43', 9001, NULL, '100.0000', NULL, 0, '2026-08-13 18:37:43', 1, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9006, 9005, 2, 9001, 9030, NULL, '2026-05-29 21:07:05', 9005, '66.2000', '1324.4900', NULL, 0, '2026-05-29 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9007, 9005, 2, 9001, 9034, NULL, '2026-07-13 21:07:05', 9003, '20.2000', '404.9700', NULL, 0, '2026-07-13 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9008, 9005, 2, 9001, 9066, NULL, '2026-07-13 21:07:05', 9004, '31.2000', '624.1500', NULL, 0, '2026-07-13 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9009, 9005, 1, 9001, 9074, NULL, '2026-06-02 21:07:05', 9005, '71.1000', '1422.0500', NULL, 0, '2026-06-02 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9010, 9004, 3, 9001, 9080, NULL, '2026-07-08 21:07:05', 9005, '13.1000', '261.2100', NULL, 0, '2026-07-08 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9011, 9007, 3, 9001, 9084, NULL, '2026-06-05 21:07:05', 9003, '62.8000', '1256.3100', NULL, 0, '2026-06-05 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9012, 9004, 3, 9001, 9064, NULL, '2026-07-20 21:07:05', 9005, '74.2000', '1483.2100', NULL, 0, '2026-07-20 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9013, 9006, 3, 9001, 9029, NULL, '2026-06-25 21:07:05', 9006, '55.5000', '1110.5200', NULL, 0, '2026-06-25 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9014, 9004, 3, 9001, 9070, NULL, '2026-08-08 21:07:05', 9005, '19.6000', '392.0600', NULL, 0, '2026-08-08 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9015, 9007, 1, 9001, 9057, NULL, '2026-06-16 21:07:05', 9002, '64.2000', '1283.2900', NULL, 0, '2026-06-16 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9016, 9008, 2, 9001, 9091, NULL, '2026-05-27 21:07:05', 9004, '62.4000', '1248.1500', NULL, 0, '2026-05-27 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9017, 9006, 1, 9001, 9015, NULL, '2026-06-18 21:07:05', 9006, '16.9000', '338.1500', NULL, 0, '2026-06-18 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9018, 9006, 3, 9001, 9063, NULL, '2026-07-29 21:07:05', 9006, '40.6000', '811.9900', NULL, 0, '2026-07-29 19:07:05', 1, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9019, 9004, 3, 9001, 9043, NULL, '2026-05-30 21:07:05', 9006, '69.4000', '1388.5500', NULL, 0, '2026-05-30 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9020, 9008, 3, 9001, 9104, NULL, '2026-07-21 21:07:05', 9003, '17.0000', '339.8500', NULL, 0, '2026-07-21 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9021, 9005, 3, 9001, 9028, NULL, '2026-07-21 21:07:05', 9005, '9.1000', '182.9600', NULL, 0, '2026-07-21 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9022, 9006, 2, 9001, 9020, NULL, '2026-07-24 21:07:05', 9005, '34.2000', '683.9200', NULL, 0, '2026-07-24 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9023, 9007, 3, 9001, 9049, NULL, '2026-07-20 21:07:05', 9003, '44.1000', '881.1600', NULL, 0, '2026-07-20 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9024, 9006, 1, 9001, 9026, NULL, '2026-08-04 21:07:05', 9002, '52.6000', '1051.4800', NULL, 0, '2026-08-04 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9025, 9004, 1, 9001, 9077, NULL, '2026-08-09 21:07:05', 9003, '58.4000', '1168.2100', NULL, 0, '2026-08-09 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9026, 9004, 1, 9001, 9093, NULL, '2026-06-14 21:07:05', 9004, '20.2000', '404.8100', NULL, 0, '2026-06-14 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9027, 9008, 2, 9001, 9086, NULL, '2026-05-28 21:07:05', 9006, '59.3000', '1185.7100', NULL, 0, '2026-05-28 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9028, 9005, 2, 9001, 9052, NULL, '2026-07-18 21:07:05', 9002, '17.9000', '357.5700', NULL, 0, '2026-07-18 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9029, 9005, 2, 9001, 9090, NULL, '2026-07-09 21:07:05', 9004, '38.4000', '768.5800', NULL, 0, '2026-07-09 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9030, 9004, 1, 9001, 9084, NULL, '2026-05-31 21:07:05', 9004, '18.9000', '377.6000', NULL, 0, '2026-05-31 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9031, 9004, 3, 9001, 9028, NULL, '2026-06-29 21:07:05', 9006, '9.2000', '184.8800', NULL, 0, '2026-06-29 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9032, 9004, 3, 9001, 9021, NULL, '2026-07-28 21:07:05', 9002, '62.7000', '1253.3300', NULL, 0, '2026-07-28 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9033, 9006, 1, 9001, 9057, NULL, '2026-05-30 21:07:05', 9002, '71.9000', '1437.7300', NULL, 0, '2026-05-30 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9034, 9005, 2, 9001, 9104, NULL, '2026-06-23 21:07:05', 9005, '14.3000', '286.5600', NULL, 0, '2026-06-23 19:07:05', 1, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9035, 9004, 2, 9001, 9101, NULL, '2026-06-26 21:07:05', 9003, '63.1000', '1261.6400', NULL, 0, '2026-06-26 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9036, 9006, 3, 9001, 9042, NULL, '2026-08-05 21:07:05', 9004, '56.3000', '1125.4600', NULL, 0, '2026-08-05 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9037, 9004, 1, 9001, 9097, NULL, '2026-08-10 21:07:05', 9006, '13.9000', '277.1900', NULL, 0, '2026-08-10 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9038, 9005, 2, 9001, 9010, NULL, '2026-08-04 21:07:05', 9004, '23.4000', '468.5900', NULL, 0, '2026-08-04 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9039, 9006, 1, 9001, 9017, NULL, '2026-05-30 21:07:05', 9004, '49.4000', '987.2000', NULL, 0, '2026-05-30 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9040, 9007, 1, 9001, 9075, NULL, '2026-08-05 21:07:05', 9006, '55.7000', '1113.9700', NULL, 0, '2026-08-05 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9041, 9004, 1, 9001, 9012, NULL, '2026-07-15 21:07:05', 9004, '20.1000', '402.8600', NULL, 0, '2026-07-15 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9042, 9008, 2, 9001, 9050, NULL, '2026-07-18 21:07:05', 9004, '70.7000', '1414.9200', NULL, 0, '2026-07-18 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9043, 9005, 2, 9001, 9093, NULL, '2026-08-03 21:07:05', 9006, '67.2000', '1344.4900', NULL, 0, '2026-08-03 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9044, 9007, 2, 9001, 9020, NULL, '2026-06-30 21:07:05', 9002, '13.4000', '267.6900', NULL, 0, '2026-06-30 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9045, 9004, 2, 9001, 9019, NULL, '2026-07-08 21:07:05', 9002, '66.8000', '1336.4700', NULL, 0, '2026-07-08 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9046, 9007, 3, 9001, 9032, NULL, '2026-07-12 21:07:05', 9006, '63.4000', '1267.6900', NULL, 0, '2026-07-12 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9047, 9007, 1, 9001, 9007, NULL, '2026-07-22 21:07:05', 9006, '19.6000', '392.6100', NULL, 0, '2026-07-22 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9048, 9008, 2, 9001, 9075, NULL, '2026-06-27 21:07:05', 9002, '53.4000', '1067.7500', NULL, 0, '2026-06-27 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9049, 9007, 1, 9001, 9071, NULL, '2026-07-09 21:07:05', 9002, '40.0000', '799.2400', NULL, 0, '2026-07-09 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9050, 9007, 1, 9001, 9103, NULL, '2026-06-16 21:07:05', 9006, '72.2000', '1443.0300', NULL, 0, '2026-06-16 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9051, 9005, 3, 9001, 9012, NULL, '2026-08-02 21:07:05', 9005, '67.1000', '1342.4600', NULL, 0, '2026-08-02 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9052, 9006, 3, 9001, 9019, NULL, '2026-06-12 21:07:05', 9006, '44.2000', '884.3200', NULL, 0, '2026-06-12 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9053, 9005, 2, 9001, 9020, NULL, '2026-07-31 21:07:05', 9002, '21.4000', '427.9900', NULL, 0, '2026-07-31 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9054, 9004, 1, 9001, 9018, NULL, '2026-06-09 21:07:05', 9002, '21.3000', '425.3400', NULL, 0, '2026-06-09 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `distributorsales` (`DistributorSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `ParentCodeRecId`, `ScannedDate`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `LotRecId`, `DeviceRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `ReturnedOn`, `Conv_RetailerSalesRecId`) VALUES (9055, 9008, 2, 9001, 9079, NULL, '2026-06-12 21:07:05', 9003, '69.5000', '1389.2300', NULL, 0, '2026-06-12 19:07:05', 0, 0, 9001, NULL, NULL, NULL, '', '', '', NULL, NULL);

-- Data for table `distributorsecsales` (10 rows)
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (1, 29, 70, 48, 10, 69, 65, 61, 57, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 21, 29, '2026-08-18 19:07:05', 40);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (2, 45, 45, 95, 56, 46, 90, 32, 62, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 78, 11, '2026-08-18 19:07:05', 57);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (3, 81, 39, 56, 39, 99, 39, 25, 46, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 47, 3, '2026-08-18 19:07:05', 21);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (4, 59, 76, 16, 74, 54, 46, 83, 29, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 17, 65, '2026-08-18 19:07:05', 76);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (5, 35, 56, 98, 72, 90, 11, 47, 94, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 88, 99, '2026-08-18 19:07:05', 15);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (6, 47, 31, 39, 91, 25, 95, 56, 50, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 67, 17, '2026-08-18 19:07:05', 76);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (7, 2, 11, 47, 98, 21, 37, 49, 56, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 71, 73, '2026-08-18 19:07:05', 43);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (8, 66, 32, 14, 43, 77, 50, 58, 26, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 39, 26, '2026-08-18 19:07:05', 14);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (9, 27, 68, 30, 14, 41, 70, 90, 48, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 14, 30, '2026-08-18 19:07:05', 1);
INSERT INTO `distributorsecsales` (`DistributorSecSalesRecId`, `DistributorRecId`, `TSMRecId`, `MDORecId`, `CodeRecId`, `HybridRecId`, `DeviceRecId`, `SoldToRetailerRecId`, `AlsoSoldByRetailerRecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`, `ReturnedOn`, `Conv_RetailerSecSalesRecId`) VALUES (10, 19, 53, 75, 49, 1, 92, 90, 5, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 98, 78, '2026-08-18 19:07:05', 2);

-- Data for table `district` (10 rows)
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (1, 'District_528', 'ShortName_616', 68, 70, '2026-08-18 19:07:05', 35, 15, 83, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (2, 'District_810', 'ShortName_784', 10, 83, '2026-08-18 19:07:05', 70, 31, 69, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (3, 'District_854', 'ShortName_233', 47, 27, '2026-08-18 19:07:05', 65, 37, 54, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (4, 'District_803', 'ShortName_907', 31, 16, '2026-08-18 19:07:05', 84, 87, 83, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (5, 'District_383', 'ShortName_766', 38, 100, '2026-08-18 19:07:05', 2, 40, 8, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (6, 'District_487', 'ShortName_219', 65, 70, '2026-08-18 19:07:05', 11, 48, 19, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (7, 'District_682', 'ShortName_696', 62, 24, '2026-08-18 19:07:05', 85, 54, 70, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (8, 'District_866', 'ShortName_110', 51, 28, '2026-08-18 19:07:05', 62, 37, 25, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (9, 'District_544', 'ShortName_720', 1, 26, '2026-08-18 19:07:05', 21, 95, 31, '2026-08-18 19:07:05');
INSERT INTO `district` (`DistrictRecId`, `District`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `StateRecId`, `TerritoryRecId`, `ModifiedDate`) VALUES (10, 'District_989', 'ShortName_328', 56, 61, '2026-08-18 19:07:05', 16, 67, 58, '2026-08-18 19:07:05');

-- Data for table `duplicatesales` (10 rows)
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (1, 9007, NULL, 9006, NULL, NULL, NULL, NULL, NULL, NULL, 9005, 9001, NULL, NULL, NULL, '2026-06-01 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (2, 9106, NULL, 9004, NULL, NULL, NULL, NULL, NULL, NULL, 9006, 9001, NULL, NULL, NULL, '2026-08-05 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (3, 9029, NULL, 9003, NULL, NULL, NULL, NULL, NULL, NULL, 9005, 9001, NULL, NULL, NULL, '2026-06-23 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (4, 9007, NULL, 9006, NULL, NULL, NULL, NULL, NULL, NULL, 9005, 9001, NULL, NULL, NULL, '2026-07-10 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (5, 9009, NULL, 9002, NULL, NULL, NULL, NULL, NULL, NULL, 9007, 9001, NULL, NULL, NULL, '2026-06-06 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (6, 9036, NULL, 9004, NULL, NULL, NULL, NULL, NULL, NULL, 9005, 9001, NULL, NULL, NULL, '2026-06-05 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (7, 9080, NULL, 9003, NULL, NULL, NULL, NULL, NULL, NULL, 9006, 9001, NULL, NULL, NULL, '2026-06-11 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (8, 9054, NULL, 9006, NULL, NULL, NULL, NULL, NULL, NULL, 9008, 9001, NULL, NULL, NULL, '2026-06-19 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (9, 9053, NULL, 9006, NULL, NULL, NULL, NULL, NULL, NULL, 9006, 9001, NULL, NULL, NULL, '2026-07-13 19:07:05', NULL);
INSERT INTO `duplicatesales` (`DuplicateSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DupDistributorRecId`, `DupRetailerRecId`, `DupMDORecId`, `DupTSMRecId`, `DupSoldOn`, `DupScannedOn`, `DistributorRecId`, `RetailerRecId`, `MDORecId`, `TSMRecId`, `SoldOn`, `ScannedOn`, `InsertedOn`) VALUES (10, 9023, NULL, 9002, NULL, NULL, NULL, NULL, NULL, NULL, 9006, 9001, NULL, NULL, NULL, '2026-06-09 19:07:05', NULL);

-- Data for table `hybrid` (6 rows)
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9001, NULL, 'KnownProduct', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0);
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9002, 'MAT-001', 'Kezzler Shield 500ml Insecticide', 9001, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 9001, NULL, NULL, NULL, 120, NULL, NULL, 0, 0, NULL, 0);
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9003, 'MAT-002', 'AgriGrow Pro 1kg Fertilizer', 9001, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 9001, NULL, NULL, NULL, 85, NULL, NULL, 0, 0, NULL, 0);
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9004, 'MAT-003', 'BioYield Max 5L Concentrate', 9001, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 9001, NULL, NULL, NULL, 450, NULL, NULL, 0, 0, NULL, 0);
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9005, 'MAT-004', 'SeedGuard Premium 10kg Bag', 9001, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 9001, NULL, NULL, NULL, 680, NULL, NULL, 0, 0, NULL, 0);
INSERT INTO `hybrid` (`HybridRecId`, `MaterialNumber`, `MaterialName`, `CategoryRecId`, `PhaseRecId`, `SegmentRecId`, `IsActive`, `PackCount`, `Points`, `NewPoints`, `ScanWeight`, `CartonCount`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `SKURecId`, `MinGerm`, `MinPP`, `MinGP`, `MRP`, `Cultivation`, `Treat`, `IsAllowPouchLiq`, `IsAllowPouchReturn`, `temp_MaterialRecId`, `tmp_IsDeleted`) VALUES (9006, 'MAT-005', 'CropProtect Gold 1L Fungicide', 9001, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 9001, NULL, NULL, NULL, 210, NULL, NULL, 0, 0, NULL, 0);

-- Data for table `hybridpointshistory` (10 rows)
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (1, 20, 'Name_639', '406.8600', 71, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 60, '2026-08-18 19:07:05', 1, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (2, 92, 'Name_582', '385.0300', 78, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 37, '2026-08-18 19:07:05', 63, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (3, 91, 'Name_228', '462.3700', 41, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 99, '2026-08-18 19:07:05', 83, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (4, 96, 'Name_969', '298.6200', 52, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 41, '2026-08-18 19:07:05', 13, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (5, 77, 'Name_174', '323.5000', 72, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 81, '2026-08-18 19:07:05', 47, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (6, 31, 'Name_536', '120.5500', 19, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 12, '2026-08-18 19:07:05', 2, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (7, 13, 'Name_565', '51.2300', 72, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 26, '2026-08-18 19:07:05', 3, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (8, 56, 'Name_147', '96.9000', 33, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 56, '2026-08-18 19:07:05', 100, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (9, 7, 'Name_107', '466.8400', 87, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 97, '2026-08-18 19:07:05', 41, '2026-08-18 19:07:05');
INSERT INTO `hybridpointshistory` (`HybridPointsHistoryRecId`, `HybridRecId`, `Name`, `Points`, `IsPromotionPoint`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (10, 96, 'Name_935', '478.5200', 11, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 83, '2026-08-18 19:07:05', 39, '2026-08-18 19:07:05');

-- Data for table `hybridpricehistory` (10 rows)
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (1, 64, 'Name_829', '199.65', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 91, '2026-08-18 19:07:05', 42, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (2, 1, 'Name_526', '125.38', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 40, '2026-08-18 19:07:05', 23, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (3, 67, 'Name_528', '246.91', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 29, '2026-08-18 19:07:05', 50, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (4, 65, 'Name_580', '478.61', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 13, '2026-08-18 19:07:05', 58, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (5, 5, 'Name_501', '169.39', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 4, '2026-08-18 19:07:05', 39, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (6, 79, 'Name_938', '423.57', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 73, '2026-08-18 19:07:05', 14, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (7, 47, 'Name_972', '169.62', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 55, '2026-08-18 19:07:05', 43, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (8, 76, 'Name_474', '499.84', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 56, '2026-08-18 19:07:05', 36, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (9, 68, 'Name_953', '40.83', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 88, '2026-08-18 19:07:05', 44, '2026-08-18 19:07:05');
INSERT INTO `hybridpricehistory` (`HybridPriceHistoryRecId`, `HybridRecId`, `Name`, `Price`, `ValidFrom`, `ValidTo`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`) VALUES (10, 22, 'Name_398', '197.23', '2026-08-18 19:07:05', '2026-08-18 19:07:05', 100, '2026-08-18 19:07:05', 24, '2026-08-18 19:07:05');

-- Data for table `loosebox` (10 rows)
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (1, 18, 75, 89, 44, 11, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (2, 38, 28, 29, 11, 29, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (3, 84, 13, 54, 51, 79, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (4, 75, 57, 58, 70, 51, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (5, 60, 37, 9, 12, 65, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (6, 98, 60, 27, 56, 46, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (7, 36, 28, 24, 57, 47, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (8, 92, 80, 48, 56, 86, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (9, 37, 6, 90, 44, 62, '2026-08-18 19:07:05');
INSERT INTO `loosebox` (`LooseBoxRecId`, `CodeRecId`, `PackCount`, `LooseBoxTypeRecId`, `IsOffer`, `ModifiedBy`, `ModifiedDate`) VALUES (10, 57, 33, 44, 31, 83, '2026-08-18 19:07:05');

-- Data for table `looseboxtype` (10 rows)
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (13, 'Code_940', 'Type_465');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (20, 'Code_858', 'Type_924');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (24, 'Code_825', 'Type_567');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (44, 'Code_854', 'Type_173');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (56, 'Code_232', 'Type_595');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (75, 'Code_419', 'Type_422');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (81, 'Code_359', 'Type_504');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (84, 'Code_873', 'Type_511');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (92, 'Code_794', 'Type_414');
INSERT INTO `looseboxtype` (`LooseBoxTypeRecId`, `Code`, `Type`) VALUES (94, 'Code_724', 'Type_756');

-- Data for table `lot` (10 rows)
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (1, 'LotNum_312', '2026-08-18 19:07:05', 74, 26, 8, 91, '2026-08-18 19:07:05', 41, '2026-08-18 19:07:05', 63, 11, 13, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 31, '2026-08-18 19:07:05', 92, 43, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (2, 'LotNum_517', '2026-08-18 19:07:05', 33, 77, 37, 82, '2026-08-18 19:07:05', 25, '2026-08-18 19:07:05', 23, 1, 95, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 92, '2026-08-18 19:07:05', 39, 90, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (3, 'LotNum_791', '2026-08-18 19:07:05', 15, 12, 80, 34, '2026-08-18 19:07:05', 64, '2026-08-18 19:07:05', 84, 27, 61, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 38, '2026-08-18 19:07:05', 6, 32, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (4, 'LotNum_435', '2026-08-18 19:07:05', 7, 19, 39, 31, '2026-08-18 19:07:05', 64, '2026-08-18 19:07:05', 55, 87, 23, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 64, '2026-08-18 19:07:05', 2, 79, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (5, 'LotNum_272', '2026-08-18 19:07:05', 17, 43, 33, 59, '2026-08-18 19:07:05', 1, '2026-08-18 19:07:05', 60, 32, 97, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 37, '2026-08-18 19:07:05', 24, 27, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (6, 'LotNum_192', '2026-08-18 19:07:05', 52, 77, 78, 50, '2026-08-18 19:07:05', 22, '2026-08-18 19:07:05', 70, 99, 55, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 90, '2026-08-18 19:07:05', 44, 62, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (7, 'LotNum_847', '2026-08-18 19:07:05', 12, 73, 44, 37, '2026-08-18 19:07:05', 84, '2026-08-18 19:07:05', 8, 85, 1, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 59, '2026-08-18 19:07:05', 12, 11, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (8, 'LotNum_164', '2026-08-18 19:07:05', 34, 77, 54, 4, '2026-08-18 19:07:05', 83, '2026-08-18 19:07:05', 22, 60, 94, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 8, '2026-08-18 19:07:05', 20, 72, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (9, 'LotNum_807', '2026-08-18 19:07:05', 81, 15, 70, 93, '2026-08-18 19:07:05', 8, '2026-08-18 19:07:05', 7, 77, 86, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 76, '2026-08-18 19:07:05', 11, 34, '2026-08-18 19:07:05');
INSERT INTO `lot` (`LotRecId`, `LotNum`, `PackingDate`, `HybridRecId`, `MaterialRecId_b`, `PlantLineRecId`, `PlantRecId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsCompleted`, `IsLBoxProcessed`, `TestedDate`, `ExpiryDate`, `CompletedBy`, `CompletedDate`, `IsDeleted`, `DeletedBy`, `DeletedDate`) VALUES (10, 'LotNum_977', '2026-08-18 19:07:05', 92, 40, 17, 55, '2026-08-18 19:07:05', 80, '2026-08-18 19:07:05', 75, 91, 53, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 33, '2026-08-18 19:07:05', 10, 30, '2026-08-18 19:07:05');

-- Data for table `lotroll` (10 rows)
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (1, 64, 71, 15, 27, 99, 50, 18, 45, 6, '2026-08-18 19:07:05', 96, '2026-08-18 19:07:05', 6);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (2, 65, 5, 17, 44, 52, 30, 97, 9, 96, '2026-08-18 19:07:05', 21, '2026-08-18 19:07:05', 47);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (3, 36, 55, 15, 36, 88, 57, 78, 48, 58, '2026-08-18 19:07:05', 92, '2026-08-18 19:07:05', 38);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (4, 30, 39, 71, 65, 26, 73, 2, 14, 62, '2026-08-18 19:07:05', 32, '2026-08-18 19:07:05', 81);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (5, 22, 59, 58, 74, 44, 33, 91, 9, 92, '2026-08-18 19:07:05', 67, '2026-08-18 19:07:05', 51);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (6, 57, 61, 92, 88, 2, 2, 80, 74, 35, '2026-08-18 19:07:05', 45, '2026-08-18 19:07:05', 48);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (7, 39, 55, 55, 27, 44, 57, 46, 11, 7, '2026-08-18 19:07:05', 100, '2026-08-18 19:07:05', 20);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (8, 18, 12, 29, 17, 12, 5, 91, 11, 51, '2026-08-18 19:07:05', 93, '2026-08-18 19:07:05', 1);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (9, 56, 53, 2, 53, 53, 58, 44, 31, 69, '2026-08-18 19:07:05', 79, '2026-08-18 19:07:05', 20);
INSERT INTO `lotroll` (`LotRollRecId`, `LotRecId`, `LabelRollRecId`, `StartCodeRecId`, `EndCodeRecId`, `NumOfCodes`, `IsPartiallyUsed`, `IsActivated`, `IsUploaded`, `IssuedBy`, `IssuedDate`, `ReceivedBy`, `ReceivedDate`, `KezzlerActRequestCount`) VALUES (10, 95, 100, 77, 28, 25, 76, 17, 2, 49, '2026-08-18 19:07:05', 1, '2026-08-18 19:07:05', 35);

-- Data for table `mdo` (2 rows)
INSERT INTO `mdo` (`MDORecId`, `EmpId`, `SAPId`, `FirstName`, `LastName`, `Passwd`, `TerritoryRecId`, `ReportingTo`, `RegionRecId`, `Location`, `Address`, `Pincode`, `EmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `StateRecId`, `DistrictRecId`, `CityRecId`) VALUES (9001, 'EMP-N', NULL, 'RepNorth', NULL, 'x', 9001, NULL, NULL, NULL, NULL, NULL, NULL, '9000000001', NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdo` (`MDORecId`, `EmpId`, `SAPId`, `FirstName`, `LastName`, `Passwd`, `TerritoryRecId`, `ReportingTo`, `RegionRecId`, `Location`, `Address`, `Pincode`, `EmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `StateRecId`, `DistrictRecId`, `CityRecId`) VALUES (9002, 'EMP-S', NULL, 'RepSouth', NULL, 'x', 9002, NULL, NULL, NULL, NULL, NULL, NULL, '9000000002', NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Data for table `monthlybudget` (10 rows)
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (1, 6, 31, 67, '2026-08-18 19:07:05', 67);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (10, 68, 8, 35, '2026-08-18 19:07:05', 49);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (24, 63, 43, 48, '2026-08-18 19:07:05', 84);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (35, 50, 68, 64, '2026-08-18 19:07:05', 78);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (44, 14, 54, 46, '2026-08-18 19:07:05', 41);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (49, 88, 84, 15, '2026-08-18 19:07:05', 23);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (55, 36, 89, 2, '2026-08-18 19:07:05', 33);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (56, 90, 42, 4, '2026-08-18 19:07:05', 55);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (61, 94, 80, 77, '2026-08-18 19:07:05', 75);
INSERT INTO `monthlybudget` (`MonthlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (66, 80, 92, 23, '2026-08-18 19:07:05', 79);

-- Data for table `monthlybudgetmonth` (10 rows)
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (6, 51, 61, 48, 11, '380.320', '433.470');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (26, 94, 11, 57, 27, '261.890', '357.990');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (44, 63, 3, 78, 24, '243.350', '277.160');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (57, 34, 4, 54, 75, '82.860', '401.370');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (59, 60, 18, 18, 70, '145.450', '211.750');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (66, 61, 90, 57, 34, '163.130', '26.620');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (71, 71, 17, 57, 47, '139.900', '95.430');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (79, 34, 38, 41, 42, '216.800', '319.850');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (80, 59, 44, 86, 95, '355.500', '113.740');
INSERT INTO `monthlybudgetmonth` (`MonthlyBudgetMonthRecId`, `MonthlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (94, 69, 5, 66, 58, '136.740', '423.130');

-- Data for table `openinginventory` (10 rows)
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (6, 50, 94, 5, '2026-08-18 19:07:05', 68);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (7, 66, 71, 82, '2026-08-18 19:07:05', 47);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (18, 62, 52, 45, '2026-08-18 19:07:05', 20);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (43, 60, 15, 92, '2026-08-18 19:07:05', 32);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (48, 48, 31, 13, '2026-08-18 19:07:05', 80);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (63, 28, 91, 57, '2026-08-18 19:07:05', 59);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (75, 47, 35, 17, '2026-08-18 19:07:05', 3);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (79, 81, 4, 93, '2026-08-18 19:07:05', 32);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (86, 5, 59, 81, '2026-08-18 19:07:05', 46);
INSERT INTO `openinginventory` (`OpeningInventoryRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadedBy`) VALUES (94, 91, 60, 99, '2026-08-18 19:07:05', 86);

-- Data for table `openinginventorysales` (9 rows)
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (12, 33, 26, 80, '331.510', '237.910', '458.580', '487.590');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (29, 58, 80, 81, '302.210', '98.970', '244.100', '310.990');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (30, 97, 9, 72, '303.950', '340.920', '35.340', '188.350');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (35, 61, 100, 86, '249.190', '362.140', '61.340', '467.060');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (55, 35, 15, 51, '21.130', '475.430', '483.490', '322.730');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (69, 37, 43, 80, '388.690', '94.170', '499.020', '238.580');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (71, 56, 88, 63, '474.090', '240.710', '144.930', '350.340');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (85, 97, 52, 69, '122.370', '53.180', '215.760', '73.230');
INSERT INTO `openinginventorysales` (`OpeningInventorySalesRecId`, `OpeningInventoryRecId`, `HybridRecId`, `MaterialRecId_b`, `DT_OI`, `RT_OI`, `DT_OI_Price`, `RT_OI_Price`) VALUES (96, 32, 43, 79, '281.130', '85.390', '290.430', '239.350');

-- Data for table `packing` (10 rows)
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (1, 13, 8, 9, 63, 34, 15, 49, 100, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 48);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (2, 83, 92, 69, 5, 95, 14, 39, 60, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 40);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (3, 24, 93, 51, 8, 24, 53, 27, 29, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 74);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (4, 39, 78, 39, 30, 21, 20, 52, 74, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 16);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (5, 90, 68, 99, 87, 45, 3, 45, 64, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 14);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (6, 21, 51, 46, 13, 2, 99, 71, 2, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 4);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (7, 64, 80, 10, 81, 21, 46, 72, 35, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 26);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (8, 82, 23, 82, 72, 86, 15, 58, 36, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 56);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (9, 86, 85, 43, 37, 66, 46, 15, 36, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 9);
INSERT INTO `packing` (`PackingRecId`, `CodeRecId`, `ParentRecId`, `LotRecId`, `LabelRollRecId`, `WarehouseRecId`, `CreatedBy`, `Level`, `IsMixedPack`, `CreatedOn`, `ModifiedOn`, `ModifiedBy`) VALUES (10, 29, 6, 43, 46, 6, 94, 84, 45, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 46);

-- Data for table `packingitems` (10 rows)
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (1, 76, 25, '2026-08-18 19:07:05', 73);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (2, 34, 75, '2026-08-18 19:07:05', 9);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (3, 78, 96, '2026-08-18 19:07:05', 37);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (4, 83, 94, '2026-08-18 19:07:05', 37);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (5, 44, 78, '2026-08-18 19:07:05', 12);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (6, 74, 64, '2026-08-18 19:07:05', 79);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (7, 47, 80, '2026-08-18 19:07:05', 34);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (8, 94, 74, '2026-08-18 19:07:05', 80);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (9, 25, 71, '2026-08-18 19:07:05', 63);
INSERT INTO `packingitems` (`PackingItemsRecId`, `CodeRecId`, `PackingRecId`, `CreatedOn`, `HybridRecId`) VALUES (10, 73, 88, '2026-08-18 19:07:05', 46);

-- Data for table `plant` (9 rows)
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (6, 'PlantName_485');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (12, 'PlantName_612');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (13, 'PlantName_408');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (29, 'PlantName_254');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (40, 'PlantName_674');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (64, 'PlantName_955');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (67, 'PlantName_274');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (91, 'PlantName_221');
INSERT INTO `plant` (`PlantRecId`, `PlantName`) VALUES (100, 'PlantName_585');

-- Data for table `plantline` (10 rows)
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (1, 'PlantLineNum_174');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (3, 'PlantLineNum_949');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (9, 'PlantLineNum_579');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (12, 'PlantLineNum_289');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (30, 'PlantLineNum_237');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (43, 'PlantLineNum_918');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (50, 'PlantLineNum_897');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (57, 'PlantLineNum_484');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (82, 'PlantLineNum_854');
INSERT INTO `plantline` (`PlantLineRecId`, `PlantLineNum`) VALUES (96, 'PlantLineNum_134');

-- Data for table `productgroup` (10 rows)
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (1, 'ProductGroup_702', 'ShortName_250', 86, 'Description_113', 27, 75, '2026-08-18 19:07:05', 85, '2026-08-18 19:07:05', 'Color_856');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (2, 'ProductGroup_550', 'ShortName_397', 48, 'Description_416', 36, 60, '2026-08-18 19:07:05', 90, '2026-08-18 19:07:05', 'Color_942');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (3, 'ProductGroup_578', 'ShortName_184', 54, 'Description_209', 82, 95, '2026-08-18 19:07:05', 28, '2026-08-18 19:07:05', 'Color_890');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (4, 'ProductGroup_668', 'ShortName_879', 30, 'Description_666', 21, 55, '2026-08-18 19:07:05', 61, '2026-08-18 19:07:05', 'Color_135');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (5, 'ProductGroup_456', 'ShortName_186', 92, 'Description_658', 12, 65, '2026-08-18 19:07:05', 37, '2026-08-18 19:07:05', 'Color_675');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (6, 'ProductGroup_535', 'ShortName_298', 49, 'Description_542', 76, 92, '2026-08-18 19:07:05', 25, '2026-08-18 19:07:05', 'Color_716');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (7, 'ProductGroup_501', 'ShortName_361', 27, 'Description_291', 50, 9, '2026-08-18 19:07:05', 6, '2026-08-18 19:07:05', 'Color_350');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (8, 'ProductGroup_377', 'ShortName_859', 61, 'Description_692', 26, 55, '2026-08-18 19:07:05', 58, '2026-08-18 19:07:05', 'Color_213');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (9, 'ProductGroup_118', 'ShortName_247', 75, 'Description_864', 61, 92, '2026-08-18 19:07:05', 35, '2026-08-18 19:07:05', 'Color_101');
INSERT INTO `productgroup` (`ProductGroupRecId`, `ProductGroup`, `ShortName`, `ProductTypeRecId`, `Description`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Color`) VALUES (10, 'ProductGroup_231', 'ShortName_964', 40, 'Description_942', 67, 66, '2026-08-18 19:07:05', 65, '2026-08-18 19:07:05', 'Color_695');

-- Data for table `producttype` (10 rows)
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (1, 'ProductType_877', 'Description_611');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (2, 'ProductType_249', 'Description_848');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (3, 'ProductType_189', 'Description_641');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (4, 'ProductType_335', 'Description_416');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (5, 'ProductType_391', 'Description_571');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (6, 'ProductType_970', 'Description_410');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (7, 'ProductType_172', 'Description_895');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (8, 'ProductType_605', 'Description_704');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (9, 'ProductType_296', 'Description_491');
INSERT INTO `producttype` (`ProductTypeRecId`, `ProductType`, `Description`) VALUES (10, 'ProductType_753', 'Description_544');

-- Data for table `region` (6 rows)
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9001, 'KnownRegion', 'KR', 0, NULL, NULL, NULL, 9001, NULL);
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9007, 'Midwest Region', 'MW', 0, NULL, NULL, NULL, 9006, NULL);
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9008, 'Pacific Northwest', 'PNW', 0, NULL, NULL, NULL, 9006, NULL);
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9009, 'Central Europe', 'CE', 0, NULL, NULL, NULL, 9006, NULL);
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9010, 'South Asia', 'SA', 0, NULL, NULL, NULL, 9006, NULL);
INSERT INTO `region` (`RegionRecId`, `Region`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ZoneRecId`, `ModifiedDate`) VALUES (9011, 'Latin America South', 'LAS', 0, NULL, NULL, NULL, 9006, NULL);

-- Data for table `retailer` (3 rows)
INSERT INTO `retailer` (`RetailerRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Passwd`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `PANNumber`, `DocumentNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (1, NULL, NULL, 'Sunrise Ag Store', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `retailer` (`RetailerRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Passwd`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `PANNumber`, `DocumentNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (2, NULL, NULL, 'Sunrise Ag Store', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `retailer` (`RetailerRecId`, `ERPId`, `TempERPId`, `BusinessName`, `OwnerName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `CityRecId`, `Location`, `Passwd`, `Address`, `City`, `Pincode`, `EmailId`, `SecEmailId`, `Mobile`, `SecMobile`, `IsActive`, `IsDeleted`, `IsLoggedFromApp`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `CreatedFrom`, `CreatedBy`, `CreatedDate`, `ModifiedFrom`, `ModifiedBy`, `ModifiedDate`, `Potential`, `Target`, `ApprovedBy`, `ApprovedDate`, `IsNursery`, `IsBLF`, `Latitude`, `Longitude`, `GEOTSMRecId`, `GEOMDORecId`, `GEOCreatedOn`, `IsFarmerPromoViewed`, `FarmerPromoViewedOn`, `IsFarmerPromoGlowExpired`, `FarmerPromoGlowExpiredOn`, `PANNumber`, `DocumentNumber`, `DeactivatedOwn`, `FirstLoginDate`) VALUES (3, NULL, NULL, 'Sunrise Ag Store', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, NULL);

-- Data for table `retailersales` (50 rows)
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (1, 9078, NULL, 9003, NULL, '858.4100', NULL, 0, 9001, '2026-07-24 20:07:05', '2026-07-24 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (2, 9030, NULL, 9005, NULL, '738.7700', NULL, 0, 9001, '2026-08-13 20:07:05', '2026-08-13 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (3, 9079, NULL, 9002, NULL, '626.0300', NULL, 0, 9001, '2026-08-01 20:07:05', '2026-08-01 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (4, 9072, NULL, 9003, NULL, '941.4000', NULL, 0, 9001, '2026-07-23 20:07:05', '2026-07-23 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (5, 9080, NULL, 9006, NULL, '925.7300', NULL, 0, 9001, '2026-06-13 20:07:05', '2026-06-13 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (6, 9044, NULL, 9006, NULL, '724.2300', NULL, 0, 9001, '2026-08-16 20:07:05', '2026-08-16 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (7, 9009, NULL, 9004, NULL, '179.5400', NULL, 0, 9001, '2026-07-12 20:07:05', '2026-07-12 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (8, 9103, NULL, 9005, NULL, '869.6400', NULL, 0, 9001, '2026-07-25 20:07:05', '2026-07-25 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (9, 9057, NULL, 9004, NULL, '278.2700', NULL, 0, 9001, '2026-06-13 20:07:05', '2026-06-13 19:07:05', 1, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (10, 9046, NULL, 9002, NULL, '385.2200', NULL, 0, 9001, '2026-06-24 20:07:05', '2026-06-24 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (11, 9059, NULL, 9005, NULL, '703.4900', NULL, 0, 9001, '2026-07-16 20:07:05', '2026-07-16 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (12, 9087, NULL, 9005, NULL, '243.6500', NULL, 0, 9001, '2026-07-17 20:07:05', '2026-07-17 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (13, 9079, NULL, 9005, NULL, '290.3300', NULL, 0, 9001, '2026-07-17 20:07:05', '2026-07-17 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (14, 9086, NULL, 9003, NULL, '914.9000', NULL, 0, 9001, '2026-06-14 20:07:05', '2026-06-14 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (15, 9047, NULL, 9003, NULL, '835.0700', NULL, 0, 9001, '2026-07-10 20:07:05', '2026-07-10 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (16, 9087, NULL, 9006, NULL, '256.8500', NULL, 0, 9001, '2026-05-26 20:07:05', '2026-05-26 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (17, 9033, NULL, 9003, NULL, '134.2700', NULL, 0, 9001, '2026-06-02 20:07:05', '2026-06-02 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (18, 9047, NULL, 9006, NULL, '148.2500', NULL, 0, 9001, '2026-06-02 20:07:05', '2026-06-02 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (19, 9023, NULL, 9003, NULL, '309.6500', NULL, 0, 9001, '2026-05-29 20:07:05', '2026-05-29 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (20, 9088, NULL, 9006, NULL, '914.3500', NULL, 0, 9001, '2026-07-01 20:07:05', '2026-07-01 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (21, 9010, NULL, 9006, NULL, '618.8500', NULL, 0, 9001, '2026-06-09 20:07:05', '2026-06-09 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (22, 9078, NULL, 9002, NULL, '725.1200', NULL, 0, 9001, '2026-08-13 20:07:05', '2026-08-13 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (23, 9024, NULL, 9003, NULL, '240.7000', NULL, 0, 9001, '2026-06-21 20:07:05', '2026-06-21 19:07:05', 1, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (24, 9104, NULL, 9004, NULL, '854.8900', NULL, 0, 9001, '2026-08-09 20:07:05', '2026-08-09 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (25, 9054, NULL, 9006, NULL, '887.7400', NULL, 0, 9001, '2026-07-31 20:07:05', '2026-07-31 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (26, 9061, NULL, 9002, NULL, '302.5200', NULL, 0, 9001, '2026-08-11 20:07:05', '2026-08-11 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (27, 9024, NULL, 9005, NULL, '845.5300', NULL, 0, 9001, '2026-05-26 20:07:05', '2026-05-26 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (28, 9083, NULL, 9005, NULL, '510.5400', NULL, 0, 9001, '2026-05-29 20:07:05', '2026-05-29 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (29, 9074, NULL, 9002, NULL, '197.9100', NULL, 0, 9001, '2026-05-30 20:07:05', '2026-05-30 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (30, 9019, NULL, 9003, NULL, '404.6400', NULL, 0, 9001, '2026-07-24 20:07:05', '2026-07-24 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (31, 9015, NULL, 9002, NULL, '208.3700', NULL, 0, 9001, '2026-08-16 20:07:05', '2026-08-16 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (32, 9043, NULL, 9004, NULL, '807.5500', NULL, 0, 9001, '2026-07-17 20:07:05', '2026-07-17 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (33, 9061, NULL, 9003, NULL, '889.1400', NULL, 0, 9001, '2026-06-13 20:07:05', '2026-06-13 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (34, 9085, NULL, 9006, NULL, '570.4900', NULL, 0, 9001, '2026-06-29 20:07:05', '2026-06-29 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (35, 9083, NULL, 9004, NULL, '495.0800', NULL, 0, 9001, '2026-06-21 20:07:05', '2026-06-21 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (36, 9074, NULL, 9003, NULL, '539.5300', NULL, 0, 9001, '2026-08-04 20:07:05', '2026-08-04 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (37, 9038, NULL, 9006, NULL, '582.2400', NULL, 0, 9001, '2026-06-27 20:07:05', '2026-06-27 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (38, 9106, NULL, 9002, NULL, '428.5900', NULL, 0, 9001, '2026-08-01 20:07:05', '2026-08-01 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (39, 9091, NULL, 9005, NULL, '451.2900', NULL, 0, 9001, '2026-07-05 20:07:05', '2026-07-05 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (40, 9065, NULL, 9006, NULL, '710.6100', NULL, 0, 9001, '2026-07-01 20:07:05', '2026-07-01 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (41, 9031, NULL, 9002, NULL, '248.6900', NULL, 0, 9001, '2026-06-30 20:07:05', '2026-06-30 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (42, 9017, NULL, 9005, NULL, '629.8700', NULL, 0, 9001, '2026-08-16 20:07:05', '2026-08-16 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (43, 9073, NULL, 9006, NULL, '885.8700', NULL, 0, 9001, '2026-06-19 20:07:05', '2026-06-19 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (44, 9007, NULL, 9005, NULL, '590.0500', NULL, 0, 9001, '2026-07-21 20:07:05', '2026-07-21 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (45, 9100, NULL, 9002, NULL, '350.5400', NULL, 0, 9001, '2026-08-11 20:07:05', '2026-08-11 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (46, 9040, NULL, 9004, NULL, '664.3100', NULL, 0, 9001, '2026-07-12 20:07:05', '2026-07-12 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (47, 9074, NULL, 9006, NULL, '447.9000', NULL, 0, 9001, '2026-06-01 20:07:05', '2026-06-01 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (48, 9065, NULL, 9005, NULL, '779.4400', NULL, 0, 9001, '2026-08-01 20:07:05', '2026-08-01 19:07:05', 0, 0, 9001, 2, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (49, 9080, NULL, 9004, NULL, '774.2400', NULL, 0, 9001, '2026-07-12 20:07:05', '2026-07-12 19:07:05', 0, 0, 9001, 3, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);
INSERT INTO `retailersales` (`RetailerSalesRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `Points`, `Price`, `FYYear`, `IsDispatched`, `RetailerRecId`, `ScannedDate`, `SoldDate`, `IsReturned`, `IsDuplicateSales`, `MDORecId`, `TSMRecId`, `ReturnedOn`, `DeviceRecId`, `LotRecId`, `HybridPointsHistoryRecId`, `HybridPriceHistoryRecId`, `ReturnedOn_UK`, `DupScannedOn_UK`, `Souce_UK`, `Conv_DistributorSalesRecId`) VALUES (50, 9059, NULL, 9006, NULL, '134.2200', NULL, 0, 9001, '2026-06-01 20:07:05', '2026-06-01 19:07:05', 0, 0, 9001, 1, NULL, NULL, 9001, NULL, NULL, '', '', '', NULL);

-- Data for table `retailersecsales` (10 rows)
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (1, 66, 22, 89, 77, 56, 81, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 43, '2026-08-18 19:07:05', 66, 60);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (2, 62, 4, 80, 96, 72, 7, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 86, '2026-08-18 19:07:05', 91, 10);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (3, 59, 65, 96, 10, 28, 18, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 71, '2026-08-18 19:07:05', 22, 77);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (4, 24, 93, 65, 77, 39, 80, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 95, '2026-08-18 19:07:05', 82, 82);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (5, 32, 95, 24, 3, 90, 74, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 69, '2026-08-18 19:07:05', 46, 43);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (6, 60, 94, 88, 85, 11, 43, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 3, '2026-08-18 19:07:05', 94, 57);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (7, 54, 96, 62, 55, 78, 100, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 1, '2026-08-18 19:07:05', 48, 51);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (8, 98, 55, 39, 81, 47, 8, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 25, '2026-08-18 19:07:05', 26, 73);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (9, 10, 81, 82, 70, 46, 32, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 96, '2026-08-18 19:07:05', 74, 26);
INSERT INTO `retailersecsales` (`RetailerSecSalesRecId`, `CodeRecId`, `HybridRecId`, `RetailerRecId`, `DeviceRecId`, `TSMRecId`, `MDORecId`, `SoldDate`, `ScannedDate`, `IsReturned`, `ReturnedOn`, `IsDuplicateSales`, `Conv_DistributorSecSalesRecId`) VALUES (10, 53, 79, 30, 74, 74, 65, '2026-08-18 19:07:05', '2026-08-18 19:07:05', 96, '2026-08-18 19:07:05', 30, 36);

-- Data for table `rsm` (10 rows)
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (1, 'ERPId_332', 88, 44, 1, 53, '2026-08-18 19:07:05', 48, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (2, 'ERPId_811', 100, 39, 90, 60, '2026-08-18 19:07:05', 39, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (3, 'ERPId_988', 63, 71, 90, 88, '2026-08-18 19:07:05', 82, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (4, 'ERPId_465', 98, 32, 11, 39, '2026-08-18 19:07:05', 56, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (5, 'ERPId_856', 94, 66, 87, 13, '2026-08-18 19:07:05', 13, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (6, 'ERPId_841', 68, 25, 97, 56, '2026-08-18 19:07:05', 72, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (7, 'ERPId_165', 57, 71, 42, 4, '2026-08-18 19:07:05', 53, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (8, 'ERPId_896', 14, 43, 13, 12, '2026-08-18 19:07:05', 4, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9, 'ERPId_634', 72, 97, 3, 2, '2026-08-18 19:07:05', 93, '2026-08-18 19:07:05');
INSERT INTO `rsm` (`RSMRecId`, `ERPId`, `RegionRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (10, 'ERPId_652', 4, 50, 99, 79, '2026-08-18 19:07:05', 95, '2026-08-18 19:07:05');

-- Data for table `sapsales` (10 rows)
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (29, 34, 46, 87, 71, '2026-08-18', '2026-08-18', 41, 72, '57.240', '417.490', '370.570', 11, 87, '2026-08-18 19:07:05', 23);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (34, 72, 88, 59, 10, '2026-08-18', '2026-08-18', 41, 13, '175.810', '489.460', '182.540', 65, 16, '2026-08-18 19:07:05', 63);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (36, 4, 49, 3, 64, '2026-08-18', '2026-08-18', 87, 19, '115.060', '441.130', '348.820', 39, 67, '2026-08-18 19:07:05', 84);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (39, 37, 88, 80, 94, '2026-08-18', '2026-08-18', 11, 68, '298.310', '76.650', '341.840', 50, 68, '2026-08-18 19:07:05', 79);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (42, 66, 53, 53, 15, '2026-08-18', '2026-08-18', 55, 73, '24.730', '36.490', '117.820', 11, 82, '2026-08-18 19:07:05', 64);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (47, 3, 44, 49, 96, '2026-08-18', '2026-08-18', 65, 39, '56.340', '342.050', '232.770', 18, 82, '2026-08-18 19:07:05', 35);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (48, 3, 10, 96, 85, '2026-08-18', '2026-08-18', 63, 33, '252.200', '24.080', '480.940', 44, 9, '2026-08-18 19:07:05', 54);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (54, 47, 47, 93, 14, '2026-08-18', '2026-08-18', 19, 89, '20.960', '10.640', '245.470', 14, 87, '2026-08-18 19:07:05', 89);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (73, 7, 25, 88, 60, '2026-08-18', '2026-08-18', 56, 9, '204.150', '78.100', '242.890', 67, 68, '2026-08-18 19:07:05', 51);
INSERT INTO `sapsales` (`SAPSalesRecId`, `TerritoryRecId`, `HybridRecId`, `DistributorRecId`, `MaterialRecId_b`, `BillDate`, `PricingDate`, `Month`, `Year`, `Returns`, `BillINR`, `PriceINR`, `SAPSalesReasonRecId`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (100, 12, 74, 35, 40, '2026-08-18', '2026-08-18', 10, 11, '467.000', '177.130', '87.690', 16, 8, '2026-08-18 19:07:05', 37);

-- Data for table `sku` (10 rows)
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (1, 'PackSize_534', 'UnitType_274', 10, 74, '2026-08-18 19:07:05', 7, '2026-08-18 19:07:05', 54);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (2, 'PackSize_487', 'UnitType_463', 6, 47, '2026-08-18 19:07:05', 90, '2026-08-18 19:07:05', 22);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (3, 'PackSize_127', 'UnitType_863', 89, 96, '2026-08-18 19:07:05', 66, '2026-08-18 19:07:05', 26);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (4, 'PackSize_289', 'UnitType_481', 60, 53, '2026-08-18 19:07:05', 84, '2026-08-18 19:07:05', 92);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (5, 'PackSize_787', 'UnitType_136', 31, 95, '2026-08-18 19:07:05', 26, '2026-08-18 19:07:05', 57);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (6, 'PackSize_891', 'UnitType_175', 66, 42, '2026-08-18 19:07:05', 34, '2026-08-18 19:07:05', 19);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (7, 'PackSize_529', 'UnitType_225', 12, 11, '2026-08-18 19:07:05', 32, '2026-08-18 19:07:05', 99);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (8, 'PackSize_831', 'UnitType_369', 74, 42, '2026-08-18 19:07:05', 60, '2026-08-18 19:07:05', 24);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (9, 'PackSize_398', 'UnitType_418', 3, 18, '2026-08-18 19:07:05', 69, '2026-08-18 19:07:05', 56);
INSERT INTO `sku` (`SKURecId`, `PackSize`, `UnitType`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `VarietyRecId`) VALUES (10, 'PackSize_687', 'UnitType_692', 91, 55, '2026-08-18 19:07:05', 32, '2026-08-18 19:07:05', 39);

-- Data for table `state` (5 rows)
INSERT INTO `state` (`StateRecId`, `State`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (1, 'Illinois', 'IL', 0, NULL, NULL, NULL, NULL);
INSERT INTO `state` (`StateRecId`, `State`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (2, 'Washington', 'WA', 0, NULL, NULL, NULL, NULL);
INSERT INTO `state` (`StateRecId`, `State`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (3, 'Bavaria', 'BY', 0, NULL, NULL, NULL, NULL);
INSERT INTO `state` (`StateRecId`, `State`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (4, 'Punjab', 'PB', 0, NULL, NULL, NULL, NULL);
INSERT INTO `state` (`StateRecId`, `State`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (5, 'Texas', 'TX', 0, NULL, NULL, NULL, NULL);

-- Data for table `territory` (7 rows)
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9001, 'North', 'N', NULL, 0, NULL, NULL, NULL, 9001, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9002, 'South', 'S', NULL, 0, NULL, NULL, NULL, 9001, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9008, 'Chicago Metro', 'CHI', NULL, 0, NULL, NULL, NULL, 9007, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9009, 'Seattle West', 'SEA', NULL, 0, NULL, NULL, NULL, 9007, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9010, 'Bavaria North', 'BAV', NULL, 0, NULL, NULL, NULL, 9007, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9011, 'Punjab Central', 'PUN', NULL, 0, NULL, NULL, NULL, 9007, NULL);
INSERT INTO `territory` (`TerritoryRecId`, `Territory`, `ShortName`, `TSMRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `RegionRecId`, `ModifiedDate`) VALUES (9012, 'Texas South', 'TEX', NULL, 0, NULL, NULL, NULL, 9007, NULL);

-- Data for table `tsm` (3 rows)
INSERT INTO `tsm` (`TSMRecId`, `ERPId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `IsAmbassador`, `AmbassadorRegionRecId`) VALUES (1, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, 9007);
INSERT INTO `tsm` (`TSMRecId`, `ERPId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `IsAmbassador`, `AmbassadorRegionRecId`) VALUES (2, NULL, 2, 1, NULL, NULL, NULL, NULL, 0, 9007);
INSERT INTO `tsm` (`TSMRecId`, `ERPId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `IsAmbassador`, `AmbassadorRegionRecId`) VALUES (3, NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 9007);

-- Data for table `users` (10 rows)
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (1, 'UserId_960', 'FirstName_902', 'LastName_126', 15, 'Designation_692', 'Type_107', 'EmailId_914', 'Title_270', 'Phone1_880', 93, 6, 13, 15, 48, 51, 'LoadingPage_710', '2026-08-18 19:07:05', 16, '2026-08-18 19:07:05', 75, 18, 'Passwd_808', 58, 70, '2026-08-18 19:07:05', 51, 72, 38, 32);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (2, 'UserId_271', 'FirstName_864', 'LastName_329', 55, 'Designation_417', 'Type_603', 'EmailId_311', 'Title_597', 'Phone1_404', 54, 21, 56, 58, 78, 21, 'LoadingPage_111', '2026-08-18 19:07:05', 13, '2026-08-18 19:07:05', 55, 73, 'Passwd_822', 52, 54, '2026-08-18 19:07:05', 27, 67, 60, 17);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (3, 'UserId_314', 'FirstName_215', 'LastName_306', 44, 'Designation_548', 'Type_353', 'EmailId_240', 'Title_329', 'Phone1_676', 21, 87, 88, 58, 17, 85, 'LoadingPage_706', '2026-08-18 19:07:05', 58, '2026-08-18 19:07:05', 8, 80, 'Passwd_503', 96, 59, '2026-08-18 19:07:05', 40, 53, 13, 26);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (4, 'UserId_325', 'FirstName_714', 'LastName_183', 30, 'Designation_504', 'Type_438', 'EmailId_101', 'Title_223', 'Phone1_395', 29, 7, 47, 60, 1, 13, 'LoadingPage_479', '2026-08-18 19:07:05', 97, '2026-08-18 19:07:05', 87, 46, 'Passwd_698', 97, 39, '2026-08-18 19:07:05', 56, 22, 41, 17);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (5, 'UserId_311', 'FirstName_606', 'LastName_779', 76, 'Designation_731', 'Type_705', 'EmailId_252', 'Title_111', 'Phone1_306', 11, 32, 94, 24, 35, 70, 'LoadingPage_953', '2026-08-18 19:07:05', 53, '2026-08-18 19:07:05', 23, 36, 'Passwd_469', 27, 28, '2026-08-18 19:07:05', 73, 73, 27, 39);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (6, 'UserId_613', 'FirstName_807', 'LastName_104', 25, 'Designation_845', 'Type_821', 'EmailId_494', 'Title_950', 'Phone1_111', 8, 100, 81, 75, 18, 32, 'LoadingPage_113', '2026-08-18 19:07:05', 56, '2026-08-18 19:07:05', 31, 35, 'Passwd_393', 90, 34, '2026-08-18 19:07:05', 43, 95, 77, 74);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (7, 'UserId_570', 'FirstName_371', 'LastName_985', 5, 'Designation_420', 'Type_262', 'EmailId_745', 'Title_562', 'Phone1_823', 83, 37, 50, 28, 69, 93, 'LoadingPage_887', '2026-08-18 19:07:05', 28, '2026-08-18 19:07:05', 100, 25, 'Passwd_237', 88, 5, '2026-08-18 19:07:05', 66, 99, 16, 27);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (8, 'UserId_547', 'FirstName_385', 'LastName_424', 21, 'Designation_885', 'Type_192', 'EmailId_475', 'Title_159', 'Phone1_998', 51, 79, 45, 35, 61, 18, 'LoadingPage_972', '2026-08-18 19:07:05', 7, '2026-08-18 19:07:05', 61, 67, 'Passwd_885', 69, 17, '2026-08-18 19:07:05', 49, 13, 81, 48);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (9, 'UserId_480', 'FirstName_250', 'LastName_503', 83, 'Designation_382', 'Type_270', 'EmailId_666', 'Title_794', 'Phone1_904', 76, 35, 30, 37, 20, 14, 'LoadingPage_727', '2026-08-18 19:07:05', 58, '2026-08-18 19:07:05', 8, 89, 'Passwd_958', 84, 19, '2026-08-18 19:07:05', 66, 97, 22, 8);
INSERT INTO `users` (`UsersRecId`, `UserId`, `FirstName`, `LastName`, `PlantRecId`, `Designation`, `Type`, `EmailId`, `Title`, `Phone1`, `IsDeleted`, `IsAdmin`, `IsSuperAdmin`, `IsTrackable`, `IsPolicyAccepted`, `IsDataPolicyAccepted`, `LoadingPage`, `FirstLogin`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `IsAutoMail`, `Passwd`, `ThemeRecId`, `UserLanguageRecId`, `ModifiedDate`, `IsManager`, `IsInternalUser`, `IsDemoUser`, `IsActive`) VALUES (10, 'UserId_847', 'FirstName_887', 'LastName_742', 79, 'Designation_663', 'Type_337', 'EmailId_602', 'Title_174', 'Phone1_935', 9, 84, 88, 58, 4, 2, 'LoadingPage_633', '2026-08-18 19:07:05', 84, '2026-08-18 19:07:05', 30, 95, 'Passwd_183', 39, 70, '2026-08-18 19:07:05', 58, 39, 39, 2);

-- Data for table `variety` (10 rows)
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (1, 'Variety_914', 'ShortName_214', 'Basic_728', 17, 40, 93, '2026-08-18 19:07:05', 35, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (2, 'Variety_944', 'ShortName_715', 'Basic_580', 24, 88, 96, '2026-08-18 19:07:05', 73, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (3, 'Variety_478', 'ShortName_857', 'Basic_363', 8, 94, 95, '2026-08-18 19:07:05', 10, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (4, 'Variety_138', 'ShortName_617', 'Basic_373', 76, 72, 54, '2026-08-18 19:07:05', 63, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (5, 'Variety_824', 'ShortName_589', 'Basic_552', 63, 27, 100, '2026-08-18 19:07:05', 84, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (6, 'Variety_911', 'ShortName_348', 'Basic_798', 41, 43, 32, '2026-08-18 19:07:05', 100, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (7, 'Variety_321', 'ShortName_311', 'Basic_206', 97, 87, 56, '2026-08-18 19:07:05', 51, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (8, 'Variety_183', 'ShortName_146', 'Basic_355', 16, 97, 76, '2026-08-18 19:07:05', 74, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9, 'Variety_713', 'ShortName_503', 'Basic_362', 57, 52, 77, '2026-08-18 19:07:05', 75, '2026-08-18 19:07:05');
INSERT INTO `variety` (`VarietyRecId`, `Variety`, `ShortName`, `Basic`, `ProductGroupRecId`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (10, 'Variety_639', 'ShortName_137', 'Basic_840', 55, 76, 78, '2026-08-18 19:07:05', 76, '2026-08-18 19:07:05');

-- Data for table `warehouse` (10 rows)
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (1, 'Name_828', 80, '2026-08-18 19:07:05', 46, 19);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (2, 'Name_484', 14, '2026-08-18 19:07:05', 2, 67);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (3, 'Name_881', 95, '2026-08-18 19:07:05', 34, 68);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (4, 'Name_470', 51, '2026-08-18 19:07:05', 46, 42);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (5, 'Name_786', 61, '2026-08-18 19:07:05', 70, 83);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (6, 'Name_290', 60, '2026-08-18 19:07:05', 76, 31);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (7, 'Name_985', 54, '2026-08-18 19:07:05', 25, 51);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (8, 'Name_215', 58, '2026-08-18 19:07:05', 74, 54);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (9, 'Name_405', 67, '2026-08-18 19:07:05', 15, 32);
INSERT INTO `warehouse` (`WarehouseRecId`, `Name`, `ModifiedBy`, `ModifiedOn`, `IsActive`, `HideFromUI`) VALUES (10, 'Name_248', 79, '2026-08-18 19:07:05', 19, 77);

-- Data for table `warehousereturn` (10 rows)
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (2, 92, 67, 88, 22, 24, 85, '2026-08-18 19:07:05', 12, 'FYYear_470', '156.5800', 91);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (15, 31, 95, 96, 18, 82, 6, '2026-08-18 19:07:05', 77, 'FYYear_943', '183.0500', 65);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (18, 15, 97, 27, 99, 82, 45, '2026-08-18 19:07:05', 18, 'FYYear_605', '252.9800', 20);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (19, 57, 97, 100, 52, 35, 76, '2026-08-18 19:07:05', 6, 'FYYear_183', '40.7300', 92);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (34, 62, 55, 15, 54, 91, 20, '2026-08-18 19:07:05', 82, 'FYYear_394', '406.9700', 89);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (58, 30, 49, 97, 73, 87, 6, '2026-08-18 19:07:05', 73, 'FYYear_409', '242.3900', 12);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (65, 99, 72, 80, 91, 60, 18, '2026-08-18 19:07:05', 43, 'FYYear_978', '482.7900', 65);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (68, 8, 45, 71, 42, 42, 34, '2026-08-18 19:07:05', 31, 'FYYear_747', '423.0700', 30);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (69, 42, 3, 33, 5, 15, 23, '2026-08-18 19:07:05', 86, 'FYYear_130', '77.1300', 10);
INSERT INTO `warehousereturn` (`WarehouseReturnRecId`, `WarehouseRecId`, `CodeRecId`, `ParentCodeRecId`, `HybridRecId`, `DeviceRecId`, `ScannedBy`, `ScannedDate`, `LotRecId`, `FYYear`, `Price`, `HybridPriceHistoryRecId`) VALUES (96, 98, 77, 34, 17, 69, 80, '2026-08-18 19:07:05', 77, 'FYYear_794', '222.0200', 99);

-- Data for table `ybtopsaledistributor` (10 rows)
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (7, 8, 99, 7, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (10, 87, 70, 91, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (13, 90, 35, 62, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (23, 48, 4, 52, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (37, 16, 27, 83, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (49, 78, 3, 33, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (65, 6, 99, 80, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (75, 14, 83, 96, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (78, 37, 14, 12, '2026-08-18 19:07:05');
INSERT INTO `ybtopsaledistributor` (`YBTopSaleDistributorRecId`, `YearlyBudgetRecId`, `DistributorRecId`, `DisplayOrder`, `CreatedOn`) VALUES (84, 18, 89, 2, '2026-08-18 19:07:05');

-- Data for table `yearlybudget` (9 rows)
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (5, 24, 95, 96, '2026-08-18 19:07:05', 9);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (26, 3, 25, 38, '2026-08-18 19:07:05', 26);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (27, 82, 34, 10, '2026-08-18 19:07:05', 63);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (31, 35, 73, 54, '2026-08-18 19:07:05', 82);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (49, 97, 20, 46, '2026-08-18 19:07:05', 2);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (65, 69, 8, 86, '2026-08-18 19:07:05', 85);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (73, 14, 95, 53, '2026-08-18 19:07:05', 93);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (80, 47, 48, 59, '2026-08-18 19:07:05', 44);
INSERT INTO `yearlybudget` (`YearlyBudgetRecId`, `TerritoryRecId`, `Year`, `UploadDocsRecId`, `UploadedOn`, `UploadBy`) VALUES (81, 25, 20, 67, '2026-08-18 19:07:05', 17);

-- Data for table `yearlybudgetmonth` (10 rows)
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (19, 42, 33, 30, 6, '372.850', '257.200');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (23, 37, 89, 30, 72, '88.790', '404.140');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (31, 56, 16, 15, 37, '427.530', '336.590');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (37, 59, 84, 45, 47, '232.580', '35.980');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (51, 22, 58, 68, 38, '148.360', '123.440');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (65, 73, 46, 43, 81, '466.570', '191.030');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (73, 20, 34, 10, 18, '118.860', '164.420');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (87, 35, 97, 14, 18, '492.560', '296.200');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (92, 68, 48, 83, 1, '474.380', '435.740');
INSERT INTO `yearlybudgetmonth` (`YearlyBudgetMonthRecId`, `YearlyBudgetRecId`, `HybridRecId`, `MaterialRecId_b`, `Month`, `Weight`, `Price`) VALUES (96, 65, 36, 33, 92, '337.980', '452.520');

-- Data for table `yearlybudgettopdispdist` (9 rows)
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (23, 85, 69, '221.250', '421.500');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (37, 28, 25, '397.780', '190.280');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (44, 82, 27, '244.970', '143.680');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (48, 5, 86, '459.630', '263.420');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (59, 49, 54, '170.330', '281.850');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (62, 36, 53, '87.360', '330.300');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (73, 2, 50, '181.330', '10.200');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (87, 32, 46, '76.580', '226.000');
INSERT INTO `yearlybudgettopdispdist` (`YearlyBudgetTopDispDistRecId`, `YBTopSaleDistributorRecId`, `HybridRecId`, `Weight`, `Price`) VALUES (96, 28, 12, '353.730', '446.340');

-- Data for table `zone` (5 rows)
INSERT INTO `zone` (`ZoneRecId`, `Zone`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9001, 'KnownZone', 'KZ', 0, NULL, NULL, NULL, NULL);
INSERT INTO `zone` (`ZoneRecId`, `Zone`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9006, 'North America Zone', 'NO', 0, NULL, NULL, NULL, NULL);
INSERT INTO `zone` (`ZoneRecId`, `Zone`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9007, 'Europe Zone', 'EU', 0, NULL, NULL, NULL, NULL);
INSERT INTO `zone` (`ZoneRecId`, `Zone`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9008, 'Asia Pacific Zone', 'AS', 0, NULL, NULL, NULL, NULL);
INSERT INTO `zone` (`ZoneRecId`, `Zone`, `ShortName`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9009, 'Latin America Zone', 'LA', 0, NULL, NULL, NULL, NULL);

-- Data for table `zsm` (10 rows)
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (1, 'ERPId_407', 16, 23, 100, 25, '2026-08-18 19:07:05', 76, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (2, 'ERPId_711', 63, 83, 46, 54, '2026-08-18 19:07:05', 61, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (3, 'ERPId_759', 72, 12, 15, 45, '2026-08-18 19:07:05', 22, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (4, 'ERPId_116', 18, 66, 81, 67, '2026-08-18 19:07:05', 77, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (5, 'ERPId_427', 80, 6, 43, 19, '2026-08-18 19:07:05', 90, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (6, 'ERPId_479', 61, 49, 67, 45, '2026-08-18 19:07:05', 7, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (7, 'ERPId_243', 98, 9, 1, 9, '2026-08-18 19:07:05', 19, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (8, 'ERPId_723', 94, 97, 76, 36, '2026-08-18 19:07:05', 63, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (9, 'ERPId_936', 28, 67, 54, 92, '2026-08-18 19:07:05', 26, '2026-08-18 19:07:05');
INSERT INTO `zsm` (`ZSMRecId`, `ERPId`, `ZoneRecId`, `UsersRecId`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (10, 'ERPId_856', 34, 60, 84, 82, '2026-08-18 19:07:05', 98, '2026-08-18 19:07:05');

SET FOREIGN_KEY_CHECKS = 1;
