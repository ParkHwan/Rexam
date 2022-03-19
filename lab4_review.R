# 문제 1
L1 <- list(name = "scott", sal = 3000)
result1 <- L1[["sal"]]*2
result1
L1$sal*2
L1[[2]]*2

# 문제 2
L2 <- list("scott",c(100,200,300))
L2

# 문제 3
L3 <- list(c(3,5,7),c("A","B","C"))
L3[[2]][1] <- "Alpha"
L3

# 문제 4

L4 <- list(alpha = 0:4, beta = sqrt(1:5), gamma = log(1:5))
L4[[1]] <- L4[[1]] + 10
L4

L4 <- list(alpha = 0:4, beta = sqrt(1:5), gamma = log(1:5))
L4$alpha <- L4$alpha + 10
L4

# 문제 5
emp <- read.csv("data/emp.csv")
L5 <- list(data1 = LETTERS, data2 = emp[1:3,], data3 = L4)
L5

L5[[1]][1]
L5[["data1"]][1]
L5$data1[1]

L5[[2]][,"ename"]
L5[[2]]$ename
L5[["data2"]]$ename
L5$data2[,"ename"]
L5$data2$ename

L5[[3]][3]
L5[["data3"]]["gamma"]
L5$data3$gamma

# 문제 6

L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
L6
unlist(L6)
mean(unlist(L6))


# 질문내용 리뷰

# 데이터프레임을 생성하고 열이름을 별도로 지정할때는 ()가 정확하게 표시 됨
burger <- data.frame(c(514, 533, 566),
                     c(917, 853, 888),
                     c(11, 13, 10),
                     c("새우", "불고기", "치킨"),
                     row.names = (c("M", "L", "B")))
colnames(burger) <- c("열량(kcal)", "나트륨(na)", "포화지방(fat)", "메뉴명")
burger
burger["나트륨(na)"]
burger$나트륨(na) # 에러
burger$나트륨
burger$"나트륨(na)"

# 열이름을 지정해서 데이터프레임을 생성할때는 ()가 .으로 표시 됨
# 왜 그렇게 되는건가요???
burger1 <- data.frame("열량(kcal)" = c(514, 533, 566),
                     "나트륨(na)" = c(917, 853, 888),
                     "포화지방(fat)" = c(11, 13, 10),
                     "메뉴명" = c("새우", "불고기", "치킨"),
                     row.names = (c("M", "L", "B")))
burger1
burger1["나트륨.na."]
burger1$나트륨.na.

burger <- data.frame(열량(kcal)= c(514, 533, 566),
                     나트륨(na)= c(917, 853, 888),
                     포화지방(fat) = c(11, 13, 10),
                     메뉴명 = c("새우", "불고기", "치킨"),
                     row.names = (c("M", "L", "B")))