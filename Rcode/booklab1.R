10*5*(1/2)
10*10*pi
5 * 60 * 60 + 48 * 60 + 32
10000 - (1000 * 5 + 500 * 3)
(score <- max(c(63, 95, 84, 36, 48)))
ceiling(2.4)
Sys.Date()
(931 - 225) %% 100
(931 - 225) %/% 100
result <- c(931, 754, 1029, 1139, 1442)
m <- (result - 225) %/% 100
d <- (result - 225) %% 100
m; d
x <- "월"
y <- "일"
birth <- paste(m, x, d, y, sep = ""); birth

salt <- 50
water <- 100
result <- salt / (salt + water) * 100
cat("소금 =", salt, "물 =", water, "농도 =", result, "%")
salt <- 70
water <- 110
result <- salt / (salt + water) * 100
cat("소금 =", salt, "물 =", water, "농도 =", result, "%")

deposit <-  c(5000000, 4500000, 4000000, 5500000, 6000000)
names(deposit) <- c("kim", "lee", "park", "choi", "seo")
rate <- c(3.5, 3, 4, 5, 4.5)
period <- c(2, 2, 5, 7, 4)
(customer <- rbind(deposit, rate, period))
sum <- customer[1,] * (1 + rate / 100)^ period
sum
