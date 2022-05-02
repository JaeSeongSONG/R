# data frame 만들기

english <- c(90,80,60,70)
english

math <- c(50,60,100,20)
math

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

# df_midterm_english 평균 산출

mean(df_midterm$english)

# df_midterm_math 평균 산출

mean(df_midterm$math)



# excel data 사용 (readxl 활용)

install.packages("readxl")
library(readxl)

setwd("C:/Sources/StudyR/220207_day6/1day")
getwd()

df_exam = read_excel("./Data-20220207T040151Z-001/Data/excel_exam.xlsx") # ./ 는 현재 디렉토리를 뜻함
df_exam

mean(df_exam$english)
mean(df_exam$science)



# excel data에서 column이 없을 때
# ...1 ...2 ...3 의 형식으로 column name이 붙음

df_exam_novar = read_excel("./Data-20220207T040151Z-001/Data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar



# excel data에서 sheet가 여러개인 경우

df_exam_sheet = read_excel("./Data-20220207T040151Z-001/Data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet



# csv 파일 저장하기

df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))

df_midterm
write.csv(df_midterm, file = "./df_midterm.csv")



# 데이터를 확인할 수 있는 함수
# head() 첫번째 행부터 출력(6개), tail() 마지막 행부터 출력(6개), view() 뷰어 창에서 출력, dim() 차원을 알려줌
# str() 타입을 알려줌, summary() 데이터의 요약(기초통계)를 출력
