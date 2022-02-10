# install packages
install.packages(c("dplyr","lubridate"))
library(dplyr)
library(lubridate)

streamH <- read.csv("/cloud/project/activtiy02/stream_gauge.csv")
siteInfo <- read.csv("/cloud/project/activtiy02/site_info.csv")


###### In class prompts ----

# Prompt 1: join streamH and siteInfo into a data frame called Floods

#preview streamH table 
str(streamH)

#print siteInfo
siteInfo

Floods <- full_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier in quotes

# full join keeps all info from both tables
# the columns in the table with missing data would be given NULL values
# inner join excludes any observations that are not in both tables
# size of the resulting table depends on the number of records associated with 
# the key
# for joins with multiple records for a key, rows from the other table will be
# repeated such that each record matches up

head(floods)

floods_1 <- left_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier
# we want to keep all of the observations in the left table
# if an observation is missing in the right table, there will be an NA
# observations in the right table that aren't in the left table wont be included

floods_2 <- right_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier
# it does not matter because we do not have to make decisions about which columns
# to include and which to exclude

# right join = same as left join but for the right table


# Prompt 2: Parse the date for the Floods data frame.

Floods$dateF <- ymd_hm(Floods$datetime)

# Prompt 3: What was the earliest date that each river reached the flood stage?

earlier <- Floods %>%
  group_by(names) %>%
  filter(gheight.ft >= flood.ft) %>%
  summarise(min.date = min(dateF), max.ht = max(gheight.ft))

##### Homework Part 1 ----

# create a new variable that indicates the river is in northern Florida 
# (Santa Fe river) or central Florida (three other rivers).
      

Floods$RiverLocations <- ifelse(Floods$names == 
                                  "SANTA FE RIVER NEAR FORT WHITE",
                                 "Northern Florida", "Central Florida")


Floods$RiverLocations <- ifelse(Floods$names == "SANTA FE RIVER NEAR FORT WHITE",
                                1, 0)
View(Floods)

Floods$RiverLocations <- ifelse(Floods$names == "SANTA FE RIVER NEAR FORT WHITE", 
                         "YES", "NO")
View(Floods)


##### Select function ----

VariableB <- select(Floods, gheight.ft:dateF)
# colon is used to pick a range of data

VariableC <- select(Floods, -datetime, -siteID)
# the - sign is used to exclude columns

VariableE <- select(Floods, contains("e"), - agency)

VariableF <- select(Floods,(!(gheight.ft:dateF)))


##### mutate function -----

Floods_mutated <- mutate(Floods, 
                         stage_meters = gheight.ft * 0.3048)

Floods$test <- ifelse(is.na(Floods$gheight.ft), "Yes", "No")












