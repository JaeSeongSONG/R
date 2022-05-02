#####################################################################

# cowsay package

install.packages('cowsay')
library(cowsay)

say('I want go home right now', by = 'cat')
say('I want go home right now', by = 'snowman')
say('I want go home right now', by = 'rabbit')
say('I want go home right now', by = 'smallcat')

NameList = c('cat', 'snowman', 'rabbit')

for (Name in NameList){
say('I want go home right now', by = Name)
}


#####################################################################

# reshape2 packages - 옆으로 컬럼이 많은 형태 ( Wide )를 세로로 긴 ( Long ) 형태로 변경해주고 

                      반대로 세로로 긴 형태를 옆으로 넓게 바꿔주는 패키지 


install.packages('reshape2')
library(reshape2)








































