USJudgeRatings
class(USJudgeRatings)
apply(USJudgeRatings, 1, mean)
apply(USJudgeRatings, 2, mean)
library(svDialogs)
purchase <- dlgInput("Enter the purchase amount")$res
purchase <- as.numeric(purchase)
level <- 0
ratio <- 0
if (purchase >= 300000) {
  level <- "플래티넘"
  ratio <- 0.07
  save.up <- purchase * ratio
} else if (purchase >= 200000) {
  level <- "골드"
  ratio <- 0.05
  save.up <- purchase * ratio
} else if (purchase >= 100000) {
  level <- "실버"
  ratio <- 0.03
  save.up <- purchase * ratio
} else {
  level <- "브론즈"
  ratio <- 0.01
  save.up <- purchase * ratio
}
cat("고객님은", level, "등급 회원으로 구매액의", ratio * 100, "%인", save.up, "원이 적립됩니다.")

library(rvest)
# 네이버 해외야구 타이틀 추출

url <- "https://sports.news.naver.com/wbaseball/index"
baseball <- read_html(url); baseball

title <- html_nodes(baseball, "div.home_news > ul * > a > span")
title.text <- html_text(title, trim = T); title.text
df <- data.frame(title.text)
View(df)
title.text_r1 <- gsub('\"', "", title.text); title.text_r1 # 백슬래쉬만 제거하는 패턴 표현이 부족

text3<-("[R programming]  R은 쉬운언어에요  (feat python)")
gsub("[.*?]","",text3)
gsub("\\[.*?\\]","",text3)
gsub("\\(.*?\\)","",text3)
gsub("\\[.*?\\]|\\(.*?\\)","",text3)

# 네이버 경제 뉴스 타이틀 및 img href 속성 값 추출!! 질문 사항

url1 <- "https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=101"
news <- read_html(url1); news
(html.test <- html_nodes(news, "#section_body")) # 이거는  div#section_body 태그안 자식 태그들이 감춰져 있다?
headlines <- html_text(html.test); headlines

# 네이버 금융 상한가 항목 관련 정보 추출!!

url2 <- "https://finance.naver.com/sise/"
finance <- read_html(url2, encoding = "euc-kr")
finance.tags <- html_nodes(finance, "#siselist_tab_0  td > a"); finance.tags
company <- html_text(finance.tags)

# 링크 클릭시 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
url<-'https://comic.naver.com/comment/comment?titleId=680911&no=2'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(vest_repl))

toralReview <- remDr$findElement(using='css selector','span.u_cbox_in_view_comment')
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat {
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css selector',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css selector',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "output/webtoon.txt")