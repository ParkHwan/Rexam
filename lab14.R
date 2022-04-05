# [문제1]
# product_click.log 파일을 읽어와서
# 제품당 클릭 갯수에 대한 데이터를 가지고 다음 조건으로 그래프를 그린다.  
# 옆의 그림처럼 세로 바 그래프를 칼라는 terrain.colors 칼라로 설정한다. 
# 그래프 메인 제목 : "세로바 그래프 실습"
# clicklog1.png 에 저장한다.

product_click <- read.table("data/product_click.log")
head(product_click)
product_click_count <- table(product_click$V2)

png("output/clicklog.png", width = 500, height = 400, bg = "white")
barplot(product_click_count, main = "세로바 그래프 실습", col.main = "red", cex.main =1.3, 
        col = terrain.colors(10), xlab = "상품ID", ylab = "클릭수", family = "dog")

dev.off()

# [문제2] 
# product_click.log 파일을 읽어와서 다음과 같이 상품이 클릭된 시간 정보를 가지고 파이그래프를 그리며 칼라는 자율이다. 
# 그래프 메인 제목 : "파이그래프 실습"
# 그래프는 clicklog2.png 에 저장한다.

product_click <- read.table("data/product_click.log")
product_click_time <- table(substring(product_click$V1, 9, 10))

png("output/clicklog2.png", width = 500, height = 400, bg = "white")
pie(product_click_time, main = "파이그래프 실습", col = heat.colors(10),  family = "maple", cex.main =1.8, col.main = "blue",
    labels = paste0(as.integer(names(product_click_time)), "~", as.integer(names(product_click_time)) + 1),
    cex = 0.9)

dev.off()

# [문제3] 
# 수업시간에 다뤘던 성적데이터를 가지고 다음과 같은 그래프를 R로 구현해 본다. 
# 칼라는 원하는대로 지정하며 그래프는 clicklog3.png 에 저장한다.

record_data <- read.table("data/성적.txt", header = T)
record_data1 <- t(record_data[3:5])
colnames(record_data1) <- c("길동", "둘리", "또치", "도우너", "희동",
                            "듀크", "턱시", "토토로", "올라프", "우디")

png("output/clicklog3.png", width = 500, height = 400, bg = "white")
par(xpd=T, mar=c(5,5,5,2))
barplot(record_data1, main = "학생별 점수", col = topo.colors(3),  family = "maple", 
        col.main = "#a64dff", cex.main = 2)
legend("topright", legend = rownames(record_data1), fill = topo.colors(3))

dev.off()