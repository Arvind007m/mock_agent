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