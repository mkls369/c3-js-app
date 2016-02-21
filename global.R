# Any code in this file is guaranteed to be called before either
# ui.R or server.R
rm(list=ls())
source("linechart.R")
require("reshape2")

dta.n <- matrix( round(rnorm(90*5) * 10, 1), ncol = 6) 

dta.c <- cbind(rep(c("Brazil", "Germany", "USA"), each = 25),
               rep(rep(c("Product1", "Product2","Product3","Product4","Product5")
                , each = 5),3), rep(2015:2019,15)
               )

dta.m <- as.data.frame(cbind(dta.c, dta.n), stringsAsFactors = F)

colnames(dta.m) <- c("Country", "Product", "Year", paste0("Factor", 1:6))

dta.m[paste0("Factor", 1:6)] <- apply(dta.m[paste0("Factor", 1:6)], 2, as.numeric)

dta.m["Growth"] <-  rowSums(dta.m[grep("Factor", colnames(dta.m), value = T) ])

#dta.m <- subset(dta.m, Product %in% c("Product1", "Product2"))

dta.m1 <- melt(dta.m, id= 1:3)

dta.m2 <- dcast(dta.m1, Country + Product + variable ~ Year)

countries <- unique(unlist(dta.m["Country"]))
countrylist <- list()

for (i in 1:length(countries)){
  
  name <- paste0(countries[i])
  countrylist[[name]] <- countries[i]

}

product <- unique(unlist(dta.m["Product"]))
productlist <- list()

for (i in 1:length(product)){
  
  name <- paste0(product[i])
  productlist[[name]] <- product[i]
  
}
