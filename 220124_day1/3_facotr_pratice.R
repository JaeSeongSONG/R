bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt.new <- factor(bt) # 팩터 bt.new 정의
bt 
bt.new
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new) # 숫자로 바꿔서 출력
bt.new[7] <- 'B'
bt.new[8] <- 'C' # C는 levels에 없는 값이라 오류가 나면서 NA로 저장
bt.new

