library(ggplot2)
library(treemap)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# [문제1]
# mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 한다. 
# 오른쪽에 제시된 그래프를 참조하여 x축은 cty, y축은 hwy로 된 산점도를 그린다.

ggplot(mpg, aes(x= cty, y = hwy)) + geom_point(size = 3, color = "blue")
ggsave("output/result1.png", dpi = 72) 
# [문제2]
# 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 한다. 
# 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 본다.

ggplot(mpg, aes(x = class, fill = drv)) + geom_bar()
ggsave("output/result2.png", dpi = 72)

# [문제3] 
# product_click.log 파일에서 클릭된 상품의 수를 적용한 바 그래프를 출력한다.

product_click <- read.table("data/product_click.log", col.names = c("Date", "Product")); str(product_click)

ggplot(product_click, aes(x = Product, fill = Product)) + geom_bar() +labs(x = "상품 ID",
                                                                           y = "클릭수",
                                                                           title = "제품당 클릭수",
                                                                           subtitle = "제품당 클릭수를 바 그래프로 표현") + theme_bw()
ggsave("output/result3.png", dpi = 72)

# [ 문제4 ]
# 다음과 같이 출력되는 treepmap을 그려본다. 데이터는 GNI2014 데이터셋을 사용한다. 
# data(GNI2014) 명령을 실행시켜서 GNI2014 데이터셋을 로드한다.
# 영역을 나누는 우선 순위 : 대륙, 나라코드
# 영역의 크기를 결정하는 값 : 인구수 
# treemap() 함수의 도큐먼트를 읽어보고 제목폰트의 사이즈를 20으로 하고 보더의 칼라를 green 으로 한다.	
# 그려진 그래프는 result4.png 로 저장한다.(기본 그래프의 저장 방법을 사용해야 한다.)

data(GNI2014)
GNI2014 %>% str
View(GNI2014)
png("output/result4.png", width = 700, height = 500)

treemap(GNI2014, 
        index = c("continent", "iso3"), 
        vSize = "population",
        title = "전세계 인구 정보",
        fontfamily.title = "dog",
        fontsize.title = 20,
        fontsize.labels = 15,
        border.col = "green",
        fontfamily.labels = "dog")

dev.off()

