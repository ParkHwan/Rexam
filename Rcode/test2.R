# [ 문제7 ] 
# iotest2.txt 파일에 저장된 데이터들을 읽고 다음과 같은 형식으로 결과를 출력하는
# R 코드를 구현하고 test2.R 로 저장하여 제출한다.
# 
# “가장 많이 등장한 단어는 XX 입니다.”

test2 <- scan("data/iotest2.txt", what = "", encoding = "UTF-8")
cat("가장 많이 등장한 단어는", max(test2),"입니다.", "\n")
cat("가장 많이 등장한 단어는", names(which.max(table(test2))),"입니다.", "\n")
cat("가장 많이 등장한 단어는", names(which.max(summary(factor(test2)))),"입니다.")
