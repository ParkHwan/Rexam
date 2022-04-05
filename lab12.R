library(RSelenium)
moviepoint <- NULL; movierecommend <- NULL; moviereview <- NULL
func_recommend <- function(x) {
  text <- x$getElementText()
  if (text == "스토리배우") {
    text <- "스토리/배우"
  } else {
    text <- text
  }
}
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
movie.url <- "https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700"
remDr$navigate(movie.url)
Sys.sleep(1)
moviepoint.dom <- remDr$findElements(using = "css selector", "div.story-point > span")
movierecommend.dom <- remDr$findElements(using = "css selector", "div.story-recommend")
moviereview.dom <- remDr$findElements(using = "css selector", "div.story-txt")
moviepoint.list <- sapply(moviepoint.dom, function(x){x$getElementText()})
movierecommend.list <- sapply(movierecommend.dom, func_recommend)
moviereview.list <- sapply(moviereview.dom, function(x){x$getElementText()})
moviepoint <- c(moviepoint, paste0(unlist(moviepoint.list), "점"))
movierecommend <- c(movierecommend, unlist(movierecommend.list))
moviereview <- c(moviereview, unlist(moviereview.list))

for (n in 2:10) {
  nextpageCss <- paste0("nav.pagination a:nth-child(", n, ")")
  nextpage <- remDr$findElement(using = "css selector", nextpageCss)
  nextpage$clickElement()
  Sys.sleep(1)
  moviepoint.dom <- remDr$findElements(using = "css selector", "div.story-point > span")
  movierecommend.dom <- remDr$findElements(using = "css selector", "div.story-recommend")
  moviereview.dom <- remDr$findElements(using = "css selector", "div.story-txt")
  moviepoint.list <- sapply(moviepoint.dom, function(x){x$getElementText()})
  movierecommend.list <- sapply(movierecommend.dom, func_recommend)
  moviereview.list <- sapply(moviereview.dom, function(x){x$getElementText()})
  moviepoint <- c(moviepoint, paste0(unlist(moviepoint.list), "점"))
  movierecommend <- c(movierecommend, unlist(movierecommend.list))
  moviereview <- c(moviereview, unlist(moviereview.list))
}
movie.df <- data.frame(moviepoint, movierecommend, moviereview)
View(movie.df)
write.csv(movie.df, "output/movie1.csv", fileEncoding = "UTF-8")