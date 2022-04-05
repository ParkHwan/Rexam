comic.name <- NULL; comic.summary <- NULL; comic.grade <- NULL 

url <- "https://comic.naver.com/genre/bestChallenge.nhn"
naver.webtoon <- read_html(url)

nametag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo > h6 > a")
summarytag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo .summary")
gradetag <- html_nodes(naver.webtoon, "div.weekchallengeBox div.challengeInfo strong")

comic.name <- html_text(nametag, trim = T)  
comic.summary <- html_text(summarytag)
comic.grade <- html_text(gradetag)
naverwebtoon.page <- data.frame(comic.name, comic.summary, comic.grade)
View(naverwebtoon.page)
