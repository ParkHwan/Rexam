library(leaflet)
library(dplyr)
library(ggmap)
library(htmlwidgets)

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

### 문제1
register_google(key='AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4')

home <- geocode(enc2utf8("서울시 노원구 노원로16길 15"))
msg <- '<strong>개미네 집</strong><hr>👍'

home_map <- leaflet() %>%
              setView(lng = home$lon, lat = home$lat, zoom = 16) %>%
              addTiles() %>% 
              addCircles(lng=home$lon, lat=home$lat, color='green', opacity=0.7, weight=7, popup=msg )

saveWidget(widget=home_map, file="output/lab19_1.html")


### 문제2
# 1.
korpop2 <- rename(korpop2,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)
korpop2$name <- iconv(korpop2$name, "UTF-8","CP949")
seoulpop <- korpop2 %>% filter(startsWith(as.character(code), '11'))
# 2.
seoulpop <- seoulpop %>% rename(외국인수="외국인_계_명")
seoulpop %>% head
# 3.
seoulpop <- seoulpop %>% mutate_at("외국인수", as.numeric)
seoulpop %>% head
# 4.
seoulmap <- kormap2 %>% filter(startsWith(as.character(code), '11'))
foreigin_gu <- ggChoropleth(data = seoulpop,
                            aes(fill = 외국인수,
                                map_id = code,  
                                tooltip = name),
                            map = seoulmap,
                            palette="GnBu",
                            title="각 구별 외국인 수",
                            interactive = T)

saveWidget(widget=foreigin_gu, file="output/lab19_2.html")
