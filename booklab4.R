blood <- c("A형", "B형", "B형", "AB형", "O형", "A형", "O형", "A형", "B형", "A형")
blood_count <- table(blood)
barplot(blood_count, 
        main = "blood distribution",
        xlab = "frequency",
        ylab = "type",
        col = "purple",
        names = c("AB", "A", "B", "O"),
        horiz = T)

ha <- c(54659, 61028, 53307, 46161, 54180)
he <- c(31215, 29863, 32098, 39684, 29707)
mc <- c(15107, 16133, 15222, 13208, 9986)
vs <- c(13470, 14231, 13401, 13552, 13193)
bs <- c(16513, 14947, 15112, 14392, 17091)

division <- rbind(ha, he, mc, vs, bs)
colnames(division) <- c("19년1Q", "19년2Q", "19년3Q", "19년4Q", "20년1Q")
png("output/division_sales.png", width = 700, height = 500)
par(mfrow = c(1, 1), mar = c(5, 5, 5, 5))
barplot(division, 
        main = "사업부문별 매출액", cex.main = 2,
        col = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600"),
        horiz = T,
        las = 1,
        xlab = "억 원",
        beside = T)
legend(x = "topright", rownames(division), fill = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600"))
dev.off()

install.packages("Stat2Data")
data("Diamonds")
diamondsprice <- Diamonds$PricePerCt
color <- rep("#1d3557", 9); color[3] <- "#a8dadc"
which(table(diamondsprice) == 7)
png("output/diamonds_Price.png", width = 700, height = 500)
hist(diamondsprice,
     main = "캐럿당 가격 분포", cex.main = 2, col.main = "blue",
     family = "dog",
     breaks = 9,
     # breaks = c(0, 3000, 5000, 7000, 9000, 11000, 13000, 15000, 17000), #왜 안될까???
     xlab = "캐럿당 가격($)",
     ylab = "빈도수",
     las = 1,
     border = "#457b9d",
     col = color)
dev.off()

install.packages("carData")
library(carData)
ds <- Chile
par(mfrow = c(2, 3))
barplot(table(ds$region), main = "지역별 분포", col = rainbow(5))
barplot(table(ds$sex, main = "성별 분포", col = rainbow(6)))
barplot(table(ds$education, main = "교육수준별 분포", col = rainbow(6)))

hist(ds$age, main = "연령", xlab = "age", col = rainbow(6))
hist(ds$income, main = "수입", breaks = 6, xlab = "income", col = rainbow(4))
hist(ds$statusquo, main = "정책 지지도", xlab = "support", col = rainbow(5))

par(mfrow = c(1,1))


