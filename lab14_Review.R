####################
# 실습1
product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

head(product_click)

click_table <- table(product_click$product)
png(filename="output/clicklog1.png", height=500, width=700, bg="white") # 출력을 png파일로 설정

barplot(click_table,
        main="세로바 그래프 실습",
        col.main="red",
        col=terrain.colors(10),
        xlab='상품ID',                       # x축 레이블
        ylab='출력수',
        cex.axis=0.7,
        cex.names=0.7,
        cex.lab=0.7)

dev.off()

# 문제 1

product_c <- read.table("data/product_click.log")
head(product_c)
product_click <- table(product_c[,2])
clicklog1 <- barplot(product_click, main="세로바 그래프 실습", xlab="상품ID", 
                     ylab="클릭수", col=terrain.colors(10), col.main='red',family="dog")

dev.copy(png, "output/clicklog1.png") 
dev.off()




####################
# 실습2
product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

hour_click <- as.numeric(substr(product_click$time, 9, 10))
hour_table <- table(hour_click)
names(hour_table) <- paste0(names(hour_table), "~", as.numeric(names(hour_table))+1)

png(filename="output/clicklog2.png", height=500, width=700, bg="white") # 출력을 png파일로 설정

pie(hour_table,
    main="파이그래프 실습",
    radius=1,
    col.main="blue",
    col=rainbow(18),
    cex.axis=0.7,
    cex.names=0.7)

dev.off()



# 문제 2
all <- readLines("data/product_click.log")

time <- sapply(all,function(x) substr(x,9,10),USE.NAMES = F)

time_freq <- table(time)

pie(time_freq, labels=paste(as.numeric(names(time_freq)),"~",
                            as.character(as.numeric(names(time_freq))+ 1)),
    col=rainbow(17), 
    main="파이그래프 실습")


####################
# 실습3
grade <- read.table("data/성적.txt", header=TRUE)
grade
grade_matrix <- as.matrix(grade[,3:5])
row.names(grade_matrix) <- grade$성명

png(filename="output/clicklog3.png", height=500, width=600, bg="white") # 출력을 png파일로 설정

barplot(t(grade_matrix),
        main="학생별 점수",
        col=c("orange", "skyblue", "pink"),
        cex.axis=0.7,
        cex.names=0.7)
legend(x="topright", row.names(t(grade_matrix)),
       cex=0.8,
       fill=c("orange", "skyblue", "pink")
       )

dev.off()

# 문제 3

성적 <- read.table("data/성적.txt", header=TRUE)
성적$성명 <- c('길동', '둘리', '또치', '도우너', '희동', '듀크', '턱시', '토토로', '올라프', '우디')
score <- 성적[3:5]


barplot(t(score), main='학생별 점수', names.arg=성적$성명, col=cm.colors(3), col.main='magenta', cex.main=2.2, family="dog")
legend(11,30, names(score), cex=0.8, fill=cm.colors(3))

dev.copy(png, "output/clicklog3.png") 
dev.off()
