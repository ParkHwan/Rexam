# [ 문제1 ]
# 다음 사양의 함수 countEvenOdd() 을 생성한다.
# 매개변수 : 1 개
# 리턴값 : 리스트
# 기능 : 숫자벡터를 아규먼트로 받아 짝수의 갯수와 홀수의 갯수를 카운팅하여 
# 리스트(각 변수명 : even, odd)로 리턴한다.
# 전달된 데이터가 숫자 백터가 아니면 NULL 을 리턴한다

countEvenOdd <- function(num.vec) {
  if (!is.numeric(num.vec)) {
    return()
  } else {
    even <- 0
    odd <- 0
    for (data in num.vec) {
      if (data %% 2 == 0) {
        even = even + 1
      }
      else {
        odd = odd + 1
      }
    }
    return(list(Even = even, Odd = odd))
  }
}

countEvenOdd(c(1, 2, 3, 4, 5, 6, 7))
countEvenOdd(c(1, 2, 3, 4, 5, "6", 7))
countEvenOdd(c(1, 2, 3, 4, 5, "6", 7, F))

# [ 문제2 ]
# 다음 사양의 함수 vmSum() 을 생성한다.
# 매개변수 : 1 개
# 리턴 값 : 숫자벡터	
# 기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.
# 벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 리턴한다.
# 벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 
# 메시지를 출력하고 0 을 리턴한다.
# 전달된 숫자 벡터의 모든 값을 더하여 리턴한다.

vmSum <- function(num1.vec) {
  if (!is.vector(num1.vec) | is.list(num1.vec)) {
    return("벡터만 전달하숑!")
  }
  else if (!is.numeric(num1.vec)) {
    print("숫자 벡터를 전달하숑!")
    return(0)
  }
  else {
    return(sum(num1.vec))
  }
}

vmSum(1:100)
vmSum(martrix(1:20))
vmSum(c(10, 20, 30, "40"))
vmSum(list(10, 20, 30, 40))
vmSum(df <- data.frame(10, 20, 30, 40))

# [ 문제3 ]
# 다음 사양의 함수 vmSum2() 을 생성한다.
# 
# 매개변수 : 1 개
# 리턴 값 : 숫자벡터
# 기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.
# 벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 가지고 error 를 발생시킨다.
# 벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 
# 메시지를 가지고 warning 을 발생시키고 0 을 리턴한다.
# 전달된 숫자 벡터의 모든 값을 더하여 리턴한다.

vmSum2 <- function(num2.vec) {
  if (!is.vector(num2.vec) | is.list(num2.vec)) {
    stop("벡터만 전달하숑!")
  }
  else if (!is.numeric(num2.vec)) {
    warning("숫자 벡터를 전달하숑!")
    return(0)
  }
  else {
    return(sum(num2.vec))
  }
}
vmSum2(10)
vmSum2(c(10, 20, 30, 40))
vmSum2(c(10, 20, 30, "40"))
vmSum2(list(10, 20, 30, 40))
vmSum2(df <- data.frame(10, 20, 30, 40))

# [ 문제4 ]
# 다음의 기능을 지원하는 함수 mySum()을 생성한다.
# 아규먼트 : 벡터 한 개
# 리턴값 : 리스트 한 개 또는 NULL
# (1) 전달된 벡터에서 짝수번째 데이터들의 합과 홀수번째 데이터들의 합을 구하여 
# list 객체로 리턴하는데 각각 oddSum과 evenSum 이라고 변수명을 설정한다.
# (2) 벡터가 온 경우에만 기능을 수행하며 벡터가 오지 않은 경우에는 "벡터만 처리 가능!!"이라는
# 메시지로 에러를 발생시킨다.
# (3) 전달된 벡터에 NA 값이 하나라도 존재하는 경우에는 "NA를 최저값으로 변경하여 처리함!!" 이라는 
# 메시지를 경고를 발생시킨다. 그리고 NA 는 최저값으로 설정하여 기능을 수행한 후에 결과를 리턴한다.
# (4) NULL이 온 경우에는 NULL을 리턴한다.

mySum <- function(num3.vec) {
  if (length(num3.vec) == 0) {
    return()
  }
  else if (!is.vector(num3.vec) | is.list(num3.vec)) {
    stop("벡터만 처리 가능!")
  }
  else if (any(is.na(num3.vec))) {
    warning("NA를 최저값으로 변경하여 처리함!!")
    num3.vec[is.na(num3.vec)] <- min(num3.vec, na.rm = T)
  }
  print(num3.vec)
  # evenSum <- sum(num3.vec[seq(from = 2, to = length(num3.vec), by = 2)])
  # oddSum <- sum(num3.vec[seq(from = 1, to = length(num3.vec), by = 2)])
  evenSum <- 0
  oddSum <- 0
  for (data in 1:length(num3.vec)) {
  #   # if (any(is.na(data))) {
  #   #   warning("NA를 최저값으로 변경하여 처리함!!")
  #   #   data <- min(num3.vec, na.rm = T)
  #   # }
    if (data %% 2 == 0) {
      evenSum <- num3.vec[data] + evenSum
    }
    else {
      oddSum <- num3.vec[data] + oddSum
    }
  }
  return(list("짝수값번째 데이터의 합" = evenSum, "홀수번째 데이터의 합" = oddSum))
}

mySum(1:10)
mySum(c(1:10, NA))
mySum(c(115, 23, NA, NA, NA, 13, NA, 120))
mySum(c())

# [ 문제5 ]
# 다음의 기능을 지원하는 함수 myExpr()을 생성한다.
# 아규먼트 : 함수 한 개
# 리턴값 : 한 개의 숫자값
# (1) 아규먼트로 함수를 전달받는다. 
# (2) 아규먼트가 함수가 아니면 "수행 안할꺼임!!" 이라는 메시지로 에러를 발생시킨다.
# (3) 1부터 45 사이의 난수 6개를 추출하여 아규먼트로 전달된 함수를 호출하고 그 결과를
# 리턴한다.

myExpr <- function(func) {
  if (!is.function(func)) {
    stop("수행 안할꺼임!!")
  }
  random <- sample(1:45, 6)
  return(func(random))
}
rm(sum)
myExpr(summary)
myExpr(sum)
myExpr(min)
myExpr(max)
myExpr(5)

# [ 문제6 ]
# 다음 사양의 함수 createVector1() 을 생성한다.
# 아규먼트 : 가변(숫자, 문자열, 논리형(데이터 타입의 제한이 없다.))
# 리턴 값 : 벡터
# (1) 전달된 아규먼트가 없으면 NULL을 리턴한다.
# (2) 전달된 아규먼트에 하나라도 NA 가 있으면 NA를 리턴한다.
# (3) 전달된 데이터들을 가지고 벡터를 생성하여 리턴한다.

createVector1 <- function(...) {
  data <- c(...)
  if (is.null(data)) {
    return(NULL)
  }
  if (any(is.na(data))) {
    return(NA)
  }
  else {
    return(data)
  }
}

createVector1(10, 20, 30, 40, 50)
createVector1(10, 20, 30, 40, "안녕")
createVector1(TRUE, FALSE)
createVector1(10, 20, 30, 40, TRUE)
createVector1()
createVector1(10, 20, 30, 40, NA)

# [ 문제7 ]
# 다음 사양의 함수 createVector2() 을 생성한다.
# 매개변수 : 가변(숫자, 문자열, 논리형(데이터 타입의 제한이 없다.))
# 리턴 값 : 리스트객체
# 기능 : 전달된 아규먼트가 없으면 NULL을 리턴한다.
# 전달된 데이터들을 각 타입에 알맞게 각각의 벡터들을 만들고 리스트에 담아서 리턴한다.

createVector2 <- function(...) {
  data <- list(...)
  if (length(data) == 0) {
    return()
  }
  else {
    char.vec <- c()
    number.vec <- c()
    bool.vec <- c()
    for (x in data) {
      if (is.character(x)) {
        char.vec <- c(char.vec, x)
      }
      else if (is.numeric(x)) {
        number.vec <- c(number.vec, x)
      }
      else if (is.logical(x)) {
        bool.vec <- c(bool.vec, x)
      }
    }
    return(list(char.vec, number.vec, bool.vec))
  }
}

createVector2()
createVector2("안녕", 1, TRUE, 2, 3, "끝", "end")
createVector2("안녕", 1, 2, 3, "끝", "end", F)
