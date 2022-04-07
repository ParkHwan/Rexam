library(tidyr)
library(dplyr)
library(ggplot2)
library(proxy)
library(tm)
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# [ 문제1 ]
# 다음은 data 폴더의 성적2.csv 파일을 읽고 View() 함수로 출력한 결과이다(그림1). 
# 학생들의 점수는 0~10 점이다. 과목별 boxplot을 그려서 이상치가 발견되면 (그림2) 
# 해당 과목의 평균으로 변경하는데 평균은 정수만 사용한다.(그림3)  
# NA 값은 “updown” 방식으로 값을 채운다.(그림4) 
# 마지막으로 국어 점수와 수학점수에 대한 산점도를 그린다.(그림5) 

score_data <- read.csv("data/성적2.csv", fileEncoding = "UTF-8")
# 그림1.
View(score_data)

# 그림 2.
png("output/result1-2.png", width = 700, height = 500)
boxplot(score_data[3:4],
        range = 1)
dev.off()

# 그림 3.
score_data$수학 <- ifelse(score_data$수학 > 10, round(mean(score_data$수학, na.rm = T)), score_data$수학)

# 그림 4.
score_data <- score_data %>%
              fill(국어, 수학, .direction = "updown")

# 그림 5.
ggplot(score_data, aes(x = 국어, y = 수학, color = 성명)) + geom_point(aes(size = 3))
ggsave("output/result1-5.png", dpi = 72)

# [ 문제2 ]
# 함께 제시된 reshapedata.csv 파일의 내용을 데이터프레임으로 읽어보면 wide 포맷이라는 것을 알 수 있다.
# (1) 다음과 같이 구성되는 long 포맷의 데이터로 변경하여 longdata 라는 객체를 생성하고 View() 함수로 출력한다.

resh_wide <- read.csv("data/reshapedata.csv", stringsAsFactors = FALSE)
str(resh_wide)

longdata <- resh_wide %>%
              gather(exam, jumsu, math.mid:eng.final)
str(longdata)
View(longdata)

# 2) longdata 를 다시 다음과 같이 구성되는 widedata 를 생성하고 View() 함수로 출력한다.

widedata <- longdata %>% 
              spread(key = "exam", value = "jumsu")
str(widedata)
View(widedata)

# (3) longdata를 가지고 다음과 같이 과목명과 중간&기말 시험 항목을 분리하여 
# 새로운 데이터프레임 result를 만들고 View() 함수로 출력한다.

result <- longdata %>% 
            separate(col = exam,
                    into = c("subname", "subnum"),
                    sep = "\\.")

View(result)

# [ 문제 3 ]
# [ tm 패키지와 유사도 분석 실습 ]
# 설문을 통해서 학생들에게 제일 좋아하는 과일을 3개씩 선택하도록 했다. 다음의 결과를 얻게 되었다.
# 학생들에게 제시된 선택 보기 : 사과 포도 망고 자몽 귤 오렌지 바나나 복숭아 자두
# 듀크 : 사과 포도 망고
# 둘리 : 포도 자몽 자두
# 또치 : 복숭아 사과 포도
# 도우너 : 오렌지 바나나 복숭아
# 길동 : 포도 바나나 망고
# 희동 : 포도 귤 오렌지 
# tm 패키지에서 제공되는 DocumentTermMatrix() 와 proxy 패키지의 dist() 등을 이용하여 
# 다음에 제시된 결과를 R 코드로 해결해 본다.

select_fruit <- c("사과 포도 망고",
                  "포도 자몽 자두",
                  "복숭아 사과 포도",
                  "오렌지 바나나 복숭아",
                  "포도 바나나 망고",
                  "포도 귤 오렌지")
select_fruit

# (1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.

vcps <- VCorpus(VectorSource(select_fruit))
dtm <- DocumentTermMatrix(vcps, control=list(wordLengths = c(1, Inf)))
similar_friends <- as.matrix(dtm)
row.names(similar_friends) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
doccom <- similar_friends %*% t(similar_friends); doccom
(similar_friends_result <- dist(doccom, method = "cosine"))
cat("듀크와 또치, 듀크와 길동이 좋아하는 과일이 가장 유사한 친구들입니다.")

# (2) 학생들에게 가장 많이 선택된 과일을 찾아본다.

tdm <- TermDocumentMatrix(vcps, control=list(wordLengths = c(1, Inf)))
favorite_fruit <- as.matrix(tdm)
colnames(favorite_fruit) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
termcom <- favorite_fruit %*% t(favorite_fruit); termcom
(favorite_fruit_result <- sort(rowSums(favorite_fruit), decreasing = T))

cat("학생들이 가장 선택한 과일은 포도 입니다.")

# (3) 학생들에게 가장 적게 선택된 과일을 찾아본다.

cat("학생들이 가장 적게 선택한 과일은 귤, 자두와 자몽입니다.")