##### Question 1 ----
# Make a separate plot of the stream stage data for each river. In 3-4 
# sentences compare general patterns in the stream stage between sites around 
# Hurricane Irma.

Floods_FisheatingCreek <- Floods %>%
                          filter(siteID == 2256500)
View(Floods_FisheatingCreek)

Floods_PeaceRiver <- Floods %>%
                      filter(siteID == 2295637)

Floods_SantaFe <- Floods %>%
                  filter(siteID == 2322500)

Floods_Withlacoochee <- Floods %>%
                        filter(siteID == 2312000)

Floods$dateF <- ymd_hm(Floods$datetime)

plot(Floods_FisheatingCreek$dateF, Floods_FisheatingCreek$gheight.ft, 
     type = "b", pch = 19, xlab = "Dates", ylab = "Stage Height (ft)")


plot(Floods_PeaceRiver$dateF, Floods_PeaceRiver$gheight.ft, 
     type = "b", pch = 19, xlab = "Dates", ylab = "Stage Height (ft)")

plot(Floods_SantaFe$dateF, Floods_SantaFe$gheight.ft, 
     type = "b", pch = 19, xlab = "Dates", ylab = "Stage Height (ft)")

plot(Floods_Withlacoochee$dateF, Floods_Withlacoochee$gheight.ft, 
     type = "b", pch = 19, xlab = "Dates", ylab = "Stage Height (ft)")


##### Question 2 ----
# What was the earliest date of occurrence for each flood category in each 
# river? How quickly did changes in flood category occur for each river? 
# Do you think there was enough time for advanced warning before a flood 
# category changed?

earliest_floods.ft <- Floods %>%
                    group_by(names) %>%
                    filter(gheight.ft >= flood.ft) %>%
                    summarise(min.date = min(dateF), max.ht = max(gheight.ft))

earliest_moderate.ft <- Floods %>%
                        group_by(names) %>%
                        filter(gheight.ft >= moderate.ft) %>%
                        summarise(min.date = min(dateF), max.ht = max(gheight.ft))

earliest_major.ft <- Floods %>%
                      group_by(names) %>%
                      filter(gheight.ft >= major.ft) %>%
                      summarise(min.date = min(dateF), max.ht = max(gheight.ft))

##### Question 3 ----
# Which river had the highest stream stage exceedance of its major flood 
# category?

stream_stage_exceedance <- Floods %>%
                            group_by(names) %>%
                            summarise(max.ht = max(gheight.ft), 
                                      stream.exceedance = max.ht - major.ft)










                              











