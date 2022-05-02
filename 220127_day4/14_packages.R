#####################################################################

# cowsay package

install.packages('cowsay')
library(cowsay)

say('I want go home right now',  by = 'cat')
say('I want go home right now', by = 'snowman')
say('I want go home right now', by = 'rabbit')
say('I want go home right now', by = 'smallcat')

NameList = c('cat', 'snowman', 'rabbit')

for (Name in NameList){
say('I want go home right now', by = Name)
}


#####################################################################

# reshape2 packages - ������ �÷��� ���� ���� ( Wide )�� ���η� �� ( Long ) ���·� �������ְ� 

                      �ݴ�� ���η� �� ���¸� ������ �а� �ٲ��ִ� ��Ű�� 


install.packages('reshape2')
library(reshape2)








































