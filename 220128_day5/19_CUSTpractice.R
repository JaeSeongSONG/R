rm(list=ls())
ls()

df = read.csv('C:/Sources/R/R/참고교재 및 미션데이터전처리/data_r/cust_order_data.csv',sep='\t',header = TRUE, encoding='ANSI')
str(df)
head(df,10)

df <- df[df$SEX != '*',]

sex1 <- subset(df, select = c(ORDER_DATE, SEX, QTY))
sex1

install.packages('lubridate')
library(lubridate)

sex2 <- cbind(sex1, month = month(sex1$ORDER_DATE))
head(sex2)

# dcast(원본 data, formula, value 칼럼 지정)

library(reshape2)
dcast(sex2, SEX ~ month,value.var = 'QTY',sum)

changeGender <- function(x){if (x[2] == 'M'){return('male')} else
{return('female')}}
sex2$gender <- apply(sex2, 2, changeGender)
head(sex2)

vhd <- read.csv(" VHD_GOODSKIND.csv",header =
vhd
cbind vhd ,
LMSD_ICODE=paste( vhd$LGROUP vhd$MGROUP vhd$SGROUP vhd$DGRO
UP

# 60p

anal.df <- subset(df, LGROUP == c(10,20))
anal.df <- cbind(anal.df, month = month(anal.df$ORDER_DATE))
anal.df$ID <- paste(anal.df$CUST_SERIAL_NO, anal.df$month, anal.df$ORDER_WEEKDAY, sep ='_')
anal.df <- cbind(anal.df, LMSD_ICODE = paste(anal.df$LGROUP,"|",anal.df$MGROUP,"|",anal.df$SGROUP,"|",anal.df$DGROUP))
anal.df <- merge(x=anal.df, y = vhd2, by = 'LMSD_ICODE', all = TRUE)
str(anal.df)

anal.df <- anal.df[,c('ID', 'DGROUP_NAME')]

library(data.table)
uni.id <- unique(anal.df$ID)
list.x <- data.table(anal.df)
list.x <- list.x[,unique(DGROUP_NAME), by = ID]
list.x 





