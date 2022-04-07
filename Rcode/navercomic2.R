site<- "https://comic.naver.com/genre/bestChallenge?&page="
comic.name <- NULL; comic.summary <- NULL; comic.grade <- NULL
naver.webtoon <- NULL; navercomic <- NULL

for (n in 1:50) {
  url <- paste(site, n, sep="")
  print(url)
  naver.webtoon <- read_html(url)
  nametag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo > h6 > a")
  summarytag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo .summary")
  gradetag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo strong")
  comic.name <- html_text(nametag, trim = T)  
  comic.summary <- html_text(summarytag)
  comic.grade <- html_text(gradetag)
  naverwebtoon.page <- data.frame(comic.name, comic.summary, comic.grade)
  navercomic <- rbind(navercomic, naverwebtoon.page)
}
View(navercomic)
write.csv(navercomic, "output/navercomic.csv", fileEncoding = "UTF-8")