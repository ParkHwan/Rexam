library(fmsb)
library(dplyr)
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


# [ 문제1 ] picher_stats_2017.csv 파일을 읽고 원하는 선수에 대한 다음과 같이 
# 삼진, 볼넷, 홈런 등 성적에 대한 레이더차트를 그려 본다.
# (다른 성적을 추가해도 됨, 칼라는 임의로) lab20.png로 저장한다.

baseball_player_data <- read.csv("data/picher_stats_2017.csv", fileEncoding = "UTF-8")
View(baseball_player_data)
Yang_Hyeon_Jong <- baseball_player_data[3,]
max_score <- rep(30, 6)
min_score <- rep(0, 6)
yhj_score <- rbind(max_score, min_score, Yang_Hyeon_Jong[c(3,4,11:13,16)]); str(yhj_score)
colnames(yhj_score) <- c('승','패','삼진','볼넷','홈런', "평균자책점")

png("output/lab20.png", width = 700, height = 500)
radarchart(yhj_score,
           title = "양현종 선수의 성적",
           pcol ='red',            
           pfcol = rgb(0.1, 0.2, 0.2, 0.2),   
           plwd = 3,
           vlcex = 0.8,
           cglcol = 'blue',               
           cglty = 1,                      
           cglwd = 0.8,                    
           axistype = 1,                   
           seg = 5,                                              
           axislabcol = 'black',            
           caxislabels = seq(0, 25, 5)     
)
dev.off()

# [문제2] iris 라는 데이터셋을 가지고 다음 문제들을 해결한다. 
# iris 는 3가지 품종의 붓꽃에 대해서 각각 50개씩의 샘플데이터를 담고 있다.
# (1) Sepal.Width(꽃받침 너비)열의 데이터 평균과 표준편차 그리고 3분위수를 구한다.

View(iris); iris_sW <- iris$Sepal.Width
summary(iris_sW)
mean(iris_sW)
sd(iris_sW)
quantile(iris_sW, 0.75)

# (2) Sepal.Width열의 데이터 히스토그램을 그린다.

hist(iris_sW,
     main = "꽃받침 너비",
     cex.main = 3,
     family = "dog",
     xlab = "Sepal.Width",
     cex.lab = 1.5)


# (3) iris 데이터 셋에서 품종별 Sepal.Width의 최소값을 나타내시오.(aggregate() 함수를 이용)

(iris_sW_min <- aggregate(iris[2], by = list("품종" = iris$Species), FUN = min))
# (4) Sepal.Width 값의 분포가 가장 넓은(최대값과 최소값의 범위가 가장 큰) 품종은 어떤 종인가?
#     aggregate() 함수를 이용해서 해결해 본다.

aggregate(iris[2], by = list("품종" = iris$Species), FUN = sd)
print("setosa iris품종이 Sepal.Width값 분포가 넓다")

# (5) iris 데이터셋에서 Species가 virginica 인 수치형 데이터(1열~4열)만을 필터링하여 test라는 데이터셋을 만든다.

test <- iris %>% 
          filter(iris$Species == "virginica") %>% 
          select(-Species)
# (6) test의 Sepal.Length(꽃받침 길이)와 나머지 변수들이 어떤 상관관계가 있는지 
#     상관분석을 해보고 그중 상관계수가 가장 높은 변수가 무엇인지 알아본다.

cor(test)
cat("iris 품종 virginica의 Sepal.Length 길이는 Petal.Length와 상관계수가 높다")