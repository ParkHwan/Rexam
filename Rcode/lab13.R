# [ 문제 1  ]
# “output/movie_reviews3.csv”를 읽고 리뷰글에서 제일 많이 나온 명사 10개를 명칭(wname)과
# 빈도수(wcount)로 구성되는 데이터프레임을 생성해서 movie_top_word.csv 로 저장한다. 
# (내림차순으로 구성) – 내용이 많으면 extractNoun() 이 제대로 처리 못하므로 정제를 먼저 한 후에 명사들을 
# 뽑습니다.
# 제거 대상  : 특수 문자, 숫자, 영어, 한글 자모

library(KoNLP)
(movie_review <- read.csv("output/movie_reviews3.csv"))
movie_review.v <- movie_review$vreview
# movie_review.v <- as.vector(movie_review[["vreview"]])
movieReview.R1 <- gsub("[[:punct:][:digit:]]", "", movie_review.v) #
# movieReview.R1 <- gsub("[A-z]|[ㄱ-ㅎ]*[ㅏ-ㅣ]*", "", movieReview.R1)
movieReview.R1 <- gsub("[A-Za-zㄱ-ㅎㅏ-ㅣ]*", "", movieReview.R1)

text_mining <- extractNoun(movieReview.R1)
un_text_mining <- unlist(text_mining)
text_mining_word <- table(un_text_mining)
text_mining_result <- sort(text_mining_word, decreasing = T)

wname <- head(names(text_mining_result), 10); str(wname)
wcount <- head(as.integer(text_mining_result), 10)

text_mining_df <- data.frame(wname, wcount)
View(text_mining_df)
write.csv(text_mining_df, "output/movie_top_word.csv", fileEncoding = "UTF-8")

# [ 문제 2 ]
# output/yes24.txt 파일의 내용을 읽고 다음과 같이 워드클라우드를 구현해 본다.
# wordcloud2로 처리한다.
# (1) yes24.txt 파일을 읽고 명사만을 추출한다.
# (2) 텍스트 전처리 - 한글이 아닌 것은 모두 제거한다.
# (3) 단어의 길이가 2자이상이고 4자 이하인 단어만을 필터링한다.
# (4) 각 단어의 개수를 센다.
# (5) 많은 순으로 정렬한다.
# (6) 데이터프레임으로 만든다.
# (7) 다음과 같이 워드크라우드2로 시각화한다. 
# (8) 시각화 한 것을 htmltools::save_html () 함수를 사용하여 yes24.html 로 저장한다.

library(wordcloud)
library(wordcloud2)
(yes24word_data <- readLines("output/yes24.txt"))
yes24word_data2 <- gsub("[[:digit:][:punct:]]", "", yes24word_data)
yes24word_data2 <- gsub("[A-z]", "", yes24word_data2)
yes24word_data2[6] <- gsub("추천합니다", "", yes24word_data2[6])
yes24word_data2[6] <- gsub("", "추천합니다", yes24word_data2[6])

yes24word <- extractNoun(yes24word_data2)
yes24word_v <- unlist(yes24word)
yes24word_twoTofour <- Filter(function(x) {nchar(x) >=2 & nchar(x) <4}, yes24word_v )
yes24word_count <- sort(table(yes24word_2.4), decreasing = T)
yes24word_df <- data.frame(yes24word_count)
View(yes24word_df)
yes24word_graphics <- wordcloud2(yes24word_df, fontFamily = "휴먼옛체")
htmltools::save_html(yes24word_graphics, "output/yes24.html")
