# [문제1]
# product_click.log 파일을 읽어서 요일별 클릭 갯수에 대한 데이터를 가지고 다음과 같이 
# 두가지 그래프(plot, barplot)를 1행 2열로 그린다. 
# 저장할 때는 크기 지정을 위해 png() 함수를 사용하며 png() 함수 호출후에 
# 1행 2열의 레이아웃을 구성한 다음 두 개의 그래프를 그린다. 
# 폰트와 칼라는 보여지는대로 적용하여 그리며 칼라는 변경 가능하다. 두 개의 그래프를 모두 clicklog4.png 에 저장한다.

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

product_click <- read.table("data/product_click.log")
head(product_click)
product_click_date <- as.Date(as.character(product_click$V1), "%Y%m%d")
product_click_weekday <- table(weekdays(product_click_date))
product_click_weekday <- product_click_weekday[c(4, 6, 3, 2, 1, 5)]
str(product_click_weekday)

png("output/clicklog4.png", width = 700, height = 500)
par(mfrow=c(1,2))
plot(product_click_weekday, type = "o", lwd = 7, ylab = "",
     family = "cat", main = "요일별 클릭 수", cex.main = 3,
     col = "orange", ylim = c(0,300))
barplot(product_click_weekday, col = terrain.colors(10), ylim = c(0,300),
        main = "요일별 클릭 수", family = "cat", cex.main = 3)

dev.off()

# [문제 2] 
# movie_reviews3.csv 파일을 읽어서 다음과 같이 1000개의 평점에 대한 히스토그램을 그리는데 
# 히스토그램의 계급수(구간수)를 첫 번째는 자동으로, 두 번째는 2개로 나누며, 
# 세 번째는 1~5,6,7,8,9,10으로 지정해서 그린다.  
# 다음과 같이 세가지 히스토그램을 1행 3열로 그린다. 저장할 때는 크기 지정을 위해 png() 함수를 사용하며 
# png() 함수 호출후에 1행 3열의 레이아웃을 구성한 다음 세 개의 히스토그램을 그린다. 
# 폰트와 칼라는 보여지는대로 적용하여 그리며 칼라는 변경 가능하다. 
# 세 개의 그래프를 모두 clicklog5.png 에 저장한다.

movie_reviews <- read.csv("output/movie_reviews3.csv")
movie_reviews_point <- movie_reviews$vpoint
ymax <- max(table(movie_reviews_point))

png("output/clicklog5.png", width = 1000, height = 600)
par(mfrow=c(1,3))
hist(movie_reviews_point, main = "영화 평점 히스토그램(auto)", family = "maple",
     xlab = "평점", ylab = "평가지수", ylim = c(0, 500),
     col = heat.colors(10))
hist(movie_reviews_point, main = "영화 평점 히스토그램(1~5, 6~10)", family = "maple",
     xlab = "평점", ylab = "평가지수", ylim = c(0, 800),
     col = topo.colors(10), breaks = 2)
hist(movie_reviews_point, main = "영화 평점 히스토그램(1~5,6,7,8,9,10)", family = "maple",
     xlab = "평점", ylab = "평가지수", ylim = c(0, 500),
     col = gray.colors(10), breaks = c(1, 5, 6, 7, 8, 9, 10), probability = F)

dev.off()
par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)

# [문제 3] 
# “data/one.csv” 파일을 가지고 다음과 같은 그래프를 R로 구현해 본다. 
# 칼라는 원하는대로 지정하며 그래프는 clicklog6.png 에 저장한다. 

one <- read.csv("data/one.csv")
oneGagu <- one[-2]; str(oneGagu)

png("output/clicklog6.png", width = 600, height = 700)
par(mfrow=c(1,1), mar=c(5,5,5,2))
boxplot(X1인가구~구별, data = oneGagu, axes = F, col = rainbow(30), ann = F)

axis(1, at=1:25, lab = unique(oneGagu$구별), family = "maple", las = 2)
axis(2, at=seq(0 , 10000, 2000), family = "maple", las =1)
title("구별 1인 가구", family = "maple", cex.main = 2, col.main = "orange")
box()

dev.off()