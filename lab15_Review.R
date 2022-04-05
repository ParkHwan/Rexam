# 문제1
# CASE 1
library(showtext)
showtext_auto()
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


product_click <- read.table("data/product_click.log", col.names=c("time", "product"))

product_click

weekday_click <- as.POSIXlt(paste(substr(product_click$time, 1, 4), 
                                        substr(product_click$time, 5, 6),
                                        substr(product_click$time, 7, 8),
                                        sep="-"))$wday

weekday_click_table <- table(weekday_click)
names(weekday_click_table) <- c("월요일", "화요일", "수요일", "목요일", "금요일", "토요일")

png(filename="output/clicklog4.png", height=400, width=700, bg="white")

par(mfrow=c(1, 2))
plot(weekday_click_table,
     main="요일별 클릭 수",
     ylim=c(0, 300),
     ylab="",
     col="orange",
     type="o",
     pch=16,
     family="cat",
     cex.axis=0.8,
     cex.main=2)
barplot(weekday_click_table,
        main="요일별 클릭 수",
        ylim=c(0, 300),
        ylab="",
        col=topo.colors(6),
        pch=16,
        family="cat",
        cex.axis=0.8,
        cex.main=2)

dev.off()

# CASE 2


product <- read.table("data/product_click.log",col.names = c('time','product'))

year <- substr(product$time,1,4)
month <- substr(product$time,5,6)
day <- substr(product$time,7,8)

product$time <- paste(year,month,day,sep='-')

product$weekday <- weekdays(as.POSIXct(product$time))

head(product)

weekday_click <- table(product$weekday)

res_weekday_click <- c()
res_weekday_click[1] <-  weekday_click["월요일"]
res_weekday_click[2] <-  weekday_click["화요일"]
res_weekday_click[3] <-  weekday_click["수요일"]
res_weekday_click[4] <-  weekday_click["목요일"]
res_weekday_click[5] <-  weekday_click["금요일"]
res_weekday_click[6] <-  weekday_click["토요일"]

names(res_weekday_click) <- c('월요일','화요일','수요일','목요일','금요일','토요일')

#str(weekday_click_table)
#str(res_weekday_click)

par(mfrow=c(1,2))
plot(res_weekday_click,
     main="요일별 클릭 수",
     type='l',
     col='orange',
     xlab="요일",
     ylab="클릭 수",
     lty=1,
     lwd=2,
     ylim=c(0,300),
     xaxt = "n",
     family="cat")
axis(1,at=1:6,lab=names(res_weekday_click),family="maple")


barplot(res_weekday_click,
        main="요일별 클릭 수",
        col=rainbow(6),
        xlab="요일",
        ylim=c(0,300),
        family="maple")


dev.copy(png, "output/clicklog4.png") # 출력을 png파일로 설정
dev.off()


# 문제2
movie_review <- read.csv("output/movie_reviews3.csv")
movie_review$vpoint

png(filename="output/clicklog5.png", height=400, width=1000, bg="white")

par(mfrow=c(1, 3))
hist(movie_review$vpoint,
     main="영화 평점 히스토그램(auto)",
     ylim=c(0, 500),
     xlab="평점",
     ylab="평가자수",
     col=heat.colors(10),
     family="maple",
     cex.main=1.5)
hist(movie_review$vpoint,
     main="영화 평점 히스토그램(1~5, 6~10)",
     breaks=2,
     ylim=c(0, 800),
     xlab="평점",
     ylab="평가자수",
     col=c("skyblue", "pink"),
     family="maple",
     cex.main=1.5)
hist(movie_review$vpoint,
     main="영화 평점 히스토그램(1~5, 6, 7, 8, 9, 10)",
     freq=T,
     breaks=c(1,5,6,7,8,9,10),
     ylim=c(0, 500),
     xlab="평점",
     ylab="평가자수",
     col="grey",
     col.main="red",
     family="maple",
     cex.main=1.5)

dev.off()


# 문제3

# CASE1
one <- read.csv("data/one.csv")
head(one)
str(one)
png(filename="output/clicklog6.png", height=800, width=700, bg="white")

par(mfrow=c(1, 1), mar=c(5,5,5,5))
boxplot(X1인가구~구별,
        data=one,
        col=cm.colors(25),
        axes=F,
        ann=F)
axis(1, at=seq(1, 25), lab=names(table(one$구별)), family="maple", las=2)
axis(2, at=seq(0, 10000, 2000), family="maple", las=2)
title("구별 1인가구", family="maple", col.main="orange", cex.main=2)
box()

dev.off()

# CASE2
data <-  read.csv("data/one.csv")
head(data)
colnames(data) <- c("gu","dong","onePerson")

png(filename="output/clicklog6.png")
par(mfrow=c(1,1))
boxplot(data$onePerson~data$gu,
        #data=data,
        main="구별 1인가구",
        xlab = NULL,
        ylab = NULL,
        col = rainbow(13),
        col.main = "orange",
        las=2)

 # 출력을 png파일로 설정
dev.off()
