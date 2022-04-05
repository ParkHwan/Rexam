url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
crawlingLab <- read_html(url); crawlingLab

# <h1> 태그의 컨텐츠

h1tag.text <- html_text(html_nodes(crawlingLab, "h1")); h1tag.text

# <a> 태그의 컨텐츠와 href 속성값

atag <- html_nodes(crawlingLab, "a"); atag
atag.text <- html_text(atag); atag.text
atag.attr <- html_attr(atag, "href"); atag.attr

# <img> 태그의 src 속성값

imgtag <- html_nodes(crawlingLab, "img"); imgtag
imgtag.attr <- html_attr(imgtag, "src"); imgtag.attr

# 첫 번째 <h2> 태그의 컨텐츠

html_text(html_node(crawlingLab, "h2:nth-child(9)"))
h2tag1.text <- html_text(html_node(crawlingLab, "h2:nth-of-type(1)")); h2tag1.text

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠

ulchildtag <- html_nodes(crawlingLab, "ul > [style$=green]"); ulchildtag
ulchildtag.text <- html_text(ulchildtag); ulchildtag.text

# 두 번째 <h2> 태그의 컨텐츠

h2tag2.text <- html_text(html_node(crawlingLab, "h2:nth-of-type(2)")); h2tag2.text

# <ol>태그의 모든 자식 태그들의 컨텐츠

olchildtag.text <- html_text(html_nodes(crawlingLab, "ol > li")); olchildtag.text

# <table> 태그의 모든 자손 태그들의 컨텐츠

tablechildtag.text <- html_text(html_nodes(crawlingLab, "table  *")); tablechildtag.text

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠

trtag.text <- html_text(html_nodes(crawlingLab, "tr.name")); trtag.text

# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠

tdtag.text <- html_text(html_nodes(crawlingLab, "td#target")); tdtag.text