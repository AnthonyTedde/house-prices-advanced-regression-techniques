library(magrittr)


################################################################################
# Read data
################################################################################

data_train <- read.csv(file = "data-raw/train.csv",
                       stringsAsFactors = F)


################################################################################
#  data
################################################################################

dplyr::glimpse(data_train)

categorical_dat <- c("MSZoning", "Street", "MSSubClass", "MSZoning",
                    "Street", "Alley", "LotShape", "LandContour", "Utilities",
                    "LotConfig", "LandSlope", "Neighborhood", "Condition1",
                    "Condition2", "BldgType", "HouseStyle", "OverallQual",
                    "OverallCond", "YearBuilt", "YearRemodAdd", "RoofStyle",
                    "RoofMatl", "Exterior1st", "Exterior2nd", "MasVnrType",
                    "ExterQual", "ExterCond", "Foundation", "BsmtQual",
                    "BsmtCond", "BsmtExposure", "BsmtFinType1", "BsmtFinType2",
                    "Heating", "HeatingQC", "CentralAir", "CentralAir",
                    "Electrical", "KitchenQual", "Functional", "FireplaceQu",
                    "GarageType", "GarageYrBlt", "GarageFinish", "GarageQual",
                    "GarageCond", "PavedDrive", "PoolQC", "Fence", "MiscFeature",
                    "MoSold", "YrSold", "SaleType", "SaleCondition")

id_dat <- c("Id")

data_train %<>%
  dplyr::mutate(dplyr::across(dplyr::all_of(categorical_dat), as.factor)) %>%
  dplyr::mutate(dplyr::across(dplyr::all_of(id_dat), as.character))

dplyr::glimpse(data_train)


################################################################################
# Save
################################################################################

save(data_train, file = "data/data_train.rda")
