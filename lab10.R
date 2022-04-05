# 다음에 제시된 웹 페이지는 다음뉴스의 랭킹페이지이다. (https://news.daum.net/)
# 이 페이지에서 각 뉴스의 제목과 이 뉴스를 올린 신문사명칭을 스크래핑(20개)하여 
# 각각 newstitle, newscategory 라는 변수명(컬럼명)을 지정하여 데이터프레임을 만들고
# CSV 파일로 저장한다. (output/daumnews.csv)

library(rvest)
# case 1
newstitle <- NULL; newscategory <- NULL
daum.url <- "https://news.daum.net/"
daum.html <- read_html(daum.url)
for (n in 1:20) {
  nodes <- html_node(daum.html, paste0("div.box_g.box_news_issue > ul > li:nth-child(", n ,") > div > div > strong > a"))
  title <- html_text(nodes, trim = T)
  newstitle[n] <- title
  newstitle <- gsub('\"', "", newstitle)
  nodes1 <- html_node(daum.html, paste0("div.box_g.box_news_issue > ul > li:nth-child(", n ,") > div > div > span > span.txt_category"))
  category <- html_text(nodes1)
  newscategory <- c(newscategory, category)
}
daumpages <- data.frame(newstitle, newscategory)
View(daumpages)
write.csv(daumpages, "output/daumnews.csv")

# case 2
newstitle1 <- NULL; newscategory1 <- NULL
daum.url1 <- "https://news.daum.net/"
daum.html1 <- read_html(daum.url1)
nodes2 <- html_nodes(daum.html1, "ul.list_newsissue strong.tit_g")
newstitle1 <- html_text(nodes2, trim = T)
newstitle1 <- gsub('\"', "", newstitle1)
nodes2 <- html_nodes(daum.html1, "ul.list_newsissue span.txt_category")
newscategory1 <- html_text(nodes2)
daumpages1 <- data.frame(newstitle1, newscategory1)
View(daumpages1)
write.csv(daumpages1, "output/daumnews1.csv", fileEncoding = "UTF-8")




