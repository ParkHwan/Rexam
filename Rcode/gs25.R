library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)
Sys.sleep(1)
twoToOnenode <- remDr$findElement(using = "css selector", "#TWO_TO_ONE")
twoToOnenode$clickElement()
Sys.sleep(1)
total_goodsname <- NULL; total_goodsprice <- NULL; curr_PageOldNum <- 0
endFlag <- TRUE

while (endFlag) {
  curr_PageElem <- remDr$findElement(using = "css selector", "div:nth-child(5) > div > span > a.on")
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  cat(paste("이전:",curr_PageOldNum, "page 현재:", curr_PageNewNum, "page\n"))
  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("마지막페이지입니다. \n종료\n")
    endFlag <- FALSE
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum
  goodsname.dom <- remDr$findElements(using = "css selector", "div:nth-child(5) > ul > li > div > p.tit")
  goodsname.list <- sapply(goodsname.dom, function(x) {x$getElementText()})
  goodsname <- unlist(goodsname.list)
  total_goodsname <- c(total_goodsname, goodsname)
  
  goodsprice.dom <- remDr$findElements(using = "css selector", "div:nth-child(5) > ul > li > div > p.price > span")
  goodsprice.list <- sapply(goodsprice.dom, function(x) {x$getElementText()})
  goodsprice <- gsub(",|원", "", goodsprice.list)
  total_goodsprice <- c(total_goodsprice, goodsprice)
  
  try(pageNext <- remDr$findElement(using = "css selector", "div:nth-child(5) > div > a.next"))
  pageNext$clickElement()
  Sys.sleep(1.5)
}

gs25_TwotoOne.df <- data.frame(total_goodsname, total_goodsprice)
View(gs25_TwotoOne.df)
write.csv(gs25_TwotoOne.df, "output/gs25_twotoone.csv", fileEncoding = "UTF-8")