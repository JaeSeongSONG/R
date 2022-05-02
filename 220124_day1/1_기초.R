# 스크립트 창에서 작성한 코드는 커서를 그 줄에 두고 ctrl + R 또는 f5
3+4

# ctrl + L 콘솔창 클리어

seq(1,5) = 1, 2, 3, 4, 5

# seq() 함수는 첫 번째 인수 값부터 두 번째 인수
# 값 사이의 연속된 값을 생성한다

rep(1,5,2) = 1, 2, 3, 4, 5, 1, 2, 3, 4, 5

# rep() 함수는 첫 번째 인수 값부터 두 번째 인수
# 값 사이의 연속된 값을 세 번째 인수 만큼
# 반복해서 생성한다부터 5까지 벡터 생성


# 데이터 프레임 생성

no <- c(1,2,3,4,5)
name <- c('Hong', 'Park', 'Kim', 'Song', 'Jeong')
salary <- c(100,200,300,400,500)

employee <- data.frame(NO = no, NAME = name, SALARY = salary)

# rbind, cbind