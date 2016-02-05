library(stringr)

dd <- function(date){
  c(substring(date,1,4),substring(date,5,6),substring(date,7,8))
}


get_dat <- function(yy){
  aa <- dd(yy)
  url <- paste("apps.who.int/gho/athena/xmart/EBOLA_MEASURE/CASES,DEATHS.csv?profile=text&filter=COUNTRY:*;LOCATION:-;DATAPACKAGEID:"
               ,aa[1]
               ,"-"
               ,aa[2]
               ,"-"
               ,aa[3]
               ,";INDICATOR_TYPE:SITREP_CUMULATIVE;INDICATOR_TYPE:SITREP_CUMULATIVE_21_DAYS",sep = '')
  download.file(url, destfile = paste("ebola_summary",yy,"csv",sep="."), method="curl")
}


sources <- readLines("temp.txt")
chuck <- sources[148:length(sources)]
urllist <- str_extract(chuck,"201[0-9]{5}")
urllist <- na.omit(urllist)


for(i in urllist[1]){get_dat(i)}
