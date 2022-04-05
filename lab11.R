# [ OPEN API 실습 1 ] 
# 네이버의 블로그에서 “맛집” 이라는 단어가 들어간 글들을 검색하여 100개까지 추출한 다음 naverblog.txt 파일로 저장하시오.
# 단, XML 형식의 요청을 처리한다.
library(httr)
library(rvest)
library(XML)
library(jsonlite)

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("맛집")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")
blog.masjib <- xpathSApply(doc2, "//item/description", xmlValue)
blog.masjib <- gsub("</?b>", "", blog.masjib)
write(blog.masjib, "./output/naverblog.txt")

# [ OPEN API 실습 2 ] 
# 공공DB에서 360번 차량에 대하여 정보를 추출한 다음 노선ID, 노선길이, 기점, 종점, 배차간격을 다음 형식으로 출력하시오.
# [ 360번 버스정보 ]
# 노선ID : xxx
# 노선길이 : xxx
# 기점 : xxx
# 종점 : xxx
# 배차간격 : xxx
# 참고 : http://api.bus.go.kr/contents/sub02/getBusRouteList.html

API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "3315"
dataurl <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(dataurl, encoding="UTF-8")
busID <- xpathSApply(doc, "//itemList/busRouteId", xmlValue)
buskm <- xpathSApply(doc, "//itemList/length", xmlValue)
busStart <- xpathSApply(doc, "//itemList/stStationNm", xmlValue)
busEnd <- xpathSApply(doc, "//itemList/edStationNm", xmlValue)
busterm <- xpathSApply(doc, "//itemList/term", xmlValue)
cat("[ 3315번 버스 정보 ]" , "\n", "노선ID :", busID, "\n", "노선길이 :", buskm, "\n",
    "기점 :", busStart, "\n", "종점 :", busEnd, "\n", "배차간격 :", busterm)

# [ OPEN API 실습 3 ] 
# 네이버의 뉴스에서 “빅데이터” 라는 단어가 들어간 뉴스글들을 검색하여 100개까지 추출한 다음 뉴스 제목을 추출하여 
# navernews.txt 파일로 저장하시오.
# 단, JSON 형식의 요청을 처리한다.
# 제거해야 하는 문자들 : <b>, </b>, &quot;, &gt; &amp;, &lt; 등 &xxx; 들 모두 제거

searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
jsondoc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
json.data <- content(jsondoc, type = 'text', encoding = "UTF-8")
json.obj <- fromJSON(json.data)
json.df <- data.frame(json.obj)
json.newsdf <- json.df["items.title"]
json.newsdf <- gsub("</?b>|c\\(", "", json.newsdf)
json.newsdf <- gsub("&[a-z]+;", "", json.newsdf)
write(json.newsdf, "output/navernews.txt")
