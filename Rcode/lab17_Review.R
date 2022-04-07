library(ggplot2)
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


### 문제1
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)

ggplot(mpg, aes(cty, hwy)) + geom_point(col="blue") + theme(text=element_text(size=15))

ggsave("output/result1.png", dpi=100)

### 문제2
ggplot(mpg, aes(class)) + geom_bar(aes(fill=drv))
ggplot(mpg, aes(class,fill=drv)) + geom_bar()
ggsave("output/result2.png", dpi=100)

### 문제3
product_click <- read.csv("data/product_click.log", header=F, sep=" ")
colnames(product_click) <- c("시간", "상품ID")
ggplot(product_click, aes(x=상품ID, fill=상품ID)) + 
  geom_bar() + 
  labs(title="제품당 클릭수",
       subtitle="제품당 클릭수를 바그래프로 표현",
       y="클릭수") + 
  theme_bw()

ggsave("output/result3.png", dpi=100)

### 문제4
library(treemap)

data(GNI2014)
head(GNI2014)

png("output/result4.png", width=960, height=540)

treemap(GNI2014,
        vSize="population",
        index=c("continent", "iso3"),
        title="전세계 인구 정보",
        fontfamily.title="maple",
        fontsize.title=20,
        border.col="green")

dev.off()
