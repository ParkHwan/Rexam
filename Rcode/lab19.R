library(leaflet)
library(dplyr)

# [ 문제1 ]
# leaflet을 이용해서 다음과 같이 우리집 지도를 그리고 서클을 클릭하면 xxx의 집이 팝업윈도우로 출력한다.
# 결과를 lab19.html 로 저장하여 함께 제출한다.(xxx 는 본인의 이름이나 별명을 사용한다.)

my_home_addr <- "서울특별시 송파구 오금로 34길 12- 18"

my_home_lonlot <- geocode(enc2utf8(my_home_addr))
content <- "나의 집"
my_home_map <- leaflet(height = 700,
                       padding = 10) %>% 
                setView(lng = my_home_lonlot$lon,
                        lat = my_home_lonlot$lat,
                        zoom = 18) %>% 
                addTiles() %>% 
                addCircleMarkers(lng = my_home_lonlot$lon,
                                 lat = my_home_lonlot$lat,
                                 color ="blue",
                                 weight = 2,
                                 opacity = 1,
                                 radius = 6,
                                 fillColor = "lime",
                                 fillOpacity = 1,
                                 popup = content)

my_home_map

htmltools::save_html(my_home_map, "output/lab19_1.html")

# [ 문제 2 ]
# 수업시간에 만들어진 seoupmap 과 seoulpop 을 이용해서 구현한다.

# (1) seoulpop 을 myseoulpop 으로 복사한다.

myseoulpop <- seoulpop
myseoulmap <- seoulmap

# (2) “외국인_계_명” 이라는 변수명 “외국인수” 으로 변경한다.

myseoulpop <- rename(myseoulpop,
                     "외국인수" = "외국인_계_명")
myseoulpop$name <- iconv(myseoulpop$name, "UTF-8", "CP949")

# (3) “외국인수” 변수의 타입을 숫자형으로 변경한다.

str(myseoulpop)
myseoulpop$외국인수 <- as.numeric(myseoulpop$외국인수)
is.numeric(myseoulpop$외국인수)

# (4) 다음과 같이 서울에서 거주하고 있는 각 구별 외국인수에 대한 단계구분도(interactive = T)
# 를 그려보고 lab19_2.html 로 저장하여 제출한다. 칼라는 원하는대로 한다.

ggChoropleth(data = myseoulpop,
             aes(fill = 외국인수, 
                 map_id = code,    
                 tooltip = name),  
             map = myseoulmap,      
             palette = "BuPu",
             reverse = T,
             title = "각 구별 외국인 수",
             interactive = T) -> seoulmap_result

htmltools::save_html(seoulmap_result, "output/lab19_2.html")
