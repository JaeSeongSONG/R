# list
# 자료형 다양, 개수 다양할 시 사용, 길이가 달라도 가능
# 자료형이 다른 두 벡터를 합치면 둘다 문자형으로 변환됨


cafe <- list(espresso = c(4,5,3,6,5,4,7),
americano = c(63,68,64,68,72,89,94),
latte = c(61,70,59,71,71,92,88),
price = c(2.0,2.5,3.0),
menu = c('espresso', 'americano', 'latte'))

# 다른 방법
#espresso = c(4,5,3,6,5,4,7)
#americano = c(63,68,64,68,72,89,94)
#latte = c(61,70,59,71,71,92,88)
#price = c(2.0,2.5,3.0)
#menu = c('espresso', 'americano', 'latte')
#cafe = list(espresso=espresso, americano=americano, latte=latte, price=price, menu=menu)

cafe

str(cafe)
summary(cafe)

cafe$menu <- factor(cafe$menu) # cafe[[5]] menu를 선택하는 법
str(cafe)
cafe[[1]]

cafe$price
names(cafe$price) <- cafe$menu # 벡터에 이름 할당
cafe$price
str(cafe)

cafe$price[1]

