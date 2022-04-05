# [ 문제 1 ]
# 1부터 26사이의 값들 중에서 10개를 추출하여 v라는 변수에 저장한다.
# 추출된 숫자에 해당하는 알파벳 대문자를 원소값으로 구성된 벡터를 생성하여 리턴하는 코드를 작성하시오.
# 단, 숫자 벡터를  알파벳 대문자로 구성된 벡터를 리턴하는 기능을 반드시 sapply() 함수로 해결해야 한다.

(v <- sample(1:26, 10))
sapply(v, function(x) LETTERS[x])

# [ 문제 2 ]
# 제시된 memo.txt 파일을 행 단위로 읽어서 벡터를 리턴한다.
# 벡터를 구성하고 있는 각 원소들의 내용을 확인한 후에 아래에 제시된 결과로 변경되도록 문자 또는 문자열 변경을 시도한다. 
# (gsub() 사용) 원소마다 변경해야 하는 룰이 다르므로 원소마다 처리한다.
# 처리된 결과를 memo_new.txt 파일에 저장한다. (write() 함수 사용)
# 생성된 memo_new.txt 파일과 함께 제출한다.

read.memo <- readLines("data/memo.txt",encoding="UTF-8"); read.memo
read.memo <- gsub("[[:punct:][:digit:]]", "", read.memo)
read.memo[2] <- gsub("[[:lower:]]", "E", read.memo[2])
read.memo[4] <- gsub("[A-Z|a-z]", "", read.memo[4])
read.memo[4] <- gsub("  ", " ", read.memo[4])
read.memo[6] <- gsub(" ", "", read.memo[6])
read.memo[7] <- gsub("YOU", "you", read.memo[7])
read.memo[7] <- gsub("OK", "ok?", read.memo[7])
write(read.memo, "./data/memo_new.txt")

# 당신의 믿음은 곧 당신의 생각이 되고, 당신의 생각은 곧 당신이 내뱉는 말이 되고, 당신이 내뱉는 말은 곧 당신의 행동이 되고, 
# 당신의 행동은 곧 당신의 습관이 되고, 당신의 습관은 곧 당신의 가치관이 되고, 당신의 가치관은 곧 당신의 운명이 된다.
# 중요한 일을 절대 E메일로 보내지 마라!
# 가장 훌륭한 일은 모험과 도전정신으로 이루어진다.
# 남들이 나와 같지 않다는 점을 인정하라.
# 매일 아침 삶의 목표를 생각하며 일어나라.
# 위대한일을하는유일한방법은바로당신이하는일을사랑하는것입니다.
# you 타협(정착)하지 마세요. 왜냐하면, 당신의 마음이 하는 모든 것이 그렇듯이, 그 일을 찾게 되면 당신은 마음으로 알게 될 겁니다. ok?

# [ 문제 3 ]
# R 의 날짜 관련 API 를 이용해서 내가 태어난 요일을 출력해 본다. 출력형식은 자율…

my.birthday <- as.POSIXlt(("1984-07-01"))
format(my.birthday, "내가 태어난 요일은 %Y년 %m월 %d일 %A입니다")

fwrite