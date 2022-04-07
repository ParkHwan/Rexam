# 데이터프레임을 생성하고 열이름을 별도로 지정할때는 ()가 정확하게 표시 됨

burger <- data.frame(c(514, 533, 566),
                 c(917, 853, 888),
                 c(11, 13, 10),
                 c("새우", "불고기", "치킨"),
                 row.names = (c("M", "L", "B")))
colnames(burger) <- c("열량(kcal)", "나트륨(na)", "포화지방(fat)", "메뉴명")
burger
burger["나트륨(na)"]
burger$나트륨(na) # ()가 식별자로 인식해서 함수로 판단
burger$나트륨
burger$"나트륨(na)"

# 열이름을 지정해서 데이터프레임을 생성할때는 ()가 .으로 표시 됨
# 왜 그렇게 되는건가요??? 이유 -> R 식별자 규칙(명칭만들때) ()는 일반문자로써 식별자로 사용 불가

burger1 <- data.frame("열량(kcal)" = c(514, 533, 566),
                     "나트륨(na)" = c(917, 853, 888),
                     "포화지방(fat)" = c(11, 13, 10),
                     "메뉴명" = c("새우", "불고기", "치킨"),
                     row.names = (c("M", "L", "B")))
burger1
burger1$나트륨.na.
burger1["나트륨.na."]

burger["M", "나트륨.na."]
burger["M", ]
burger[, "열량.kcal."]
burger[c("M", "B"), "메뉴명"]

cafe <- list(espresso = c(4, 5, 3, 6, 5, 4, 7),
             americano = c(63, 68, 64, 68, 72, 89, 94),
             cafelatte = c(61, 70, 59, 71, 71, 92, 88),
             price = c(2.0, 2.5, 3.0),
             menu = c("espresso", "americano", "cafelatte")); cafe
cafe$menu <- factor(cafe$menu)
names(cafe$price) <- cafe$menu
sale.espresso <- cafe$espresso * cafe$price["espresso"]
sale.americano <- cafe$americano * cafe$price["americano"]
sale.cafelatte <- cafe$cafelatte * cafe$price["cafelatte"]
sale.day <- sale.espresso + sale.americano + sale.cafelatte
names(sale.day) <- c("월", "화", "수",
                      "목", "금", "토", "일")
sale.sum <- sum(sale.day)
sale.mean <- mean(sale.day)
cafe.sale <- data.frame(sale.espresso, sale.cafelatte, sale.americano, sale.day)
subset(cafe.sale, sale.day > sale.mean, sale.day)
