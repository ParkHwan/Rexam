# data/emp.csv 의 내용을 읽어서 emp 변수를 생성한다.
# [문제1] 업무가 MANAGER 인 직원들의 정보를 출력한다.
library(dplyr)

emp <- read.csv("data/emp.csv")
emp %>% 
  filter(job == "MANAGER")

# [문제2] emp 에서 사번, 이름, 월급을 출력한다.

emp %>% 
  select(one_of("empno", "ename", "sal"))

# SQL 문법: select empno, ename, sal from emp

# [문제3] emp 에서 사번만 빼고 출력한다.

emp %>% 
  select(-empno)

# [문제4] emp 에서 ename 과 sal컬럼만 출력한다.

emp %>% 
  select(ename, sal)

# [문제5] 업무별 직원수를 출력한다.

emp %>% 
  group_by(job) %>% 
  tally()

# [문제6] 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.

emp %>% 
  filter(sal >= 1000 & sal <= 3000) %>% 
  select(ename, sal, deptno)

# [문제7] emp 에서 업무이 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.

emp %>%
  filter(job != "ANALYST") %>% 
  select(ename, job, sal)

# [문제8] emp 에서 업무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.

emp %>% 
  filter(job == "SALESMAN" | job == "ANALYST") %>% 
  select(one_of("ename", "job"))

# [문제9] 부서별 직원들 월급의 합을 출력한다.

emp %>% 
  group_by(deptno) %>% 
  summarise(sum_job = sum(sal))

# SQL 문법: select deptno, sum(sal) from emp group by deptno

# [문제10] 월급이 적은 순으로 모든 직원 정보를 출력한다.

emp %>% 
  arrange(sal)

# [문제11] 월급이 제일 많은 직원의 정보를 출력한다.

emp %>% 
  arrange(desc(sal)) %>% 
  head(1)

# [문제12] 직원들의 월급을 보관하고 있는 컬럼의 컬럼명을 sal에서 salary 로 변경하고
# 커미션 정보 저장한 컬럼의 컬럼명를 comm 에서 commrate 로 변경한 후
# empnew 라는 새로운 데이터셋을 생성한다.

empnew <- emp %>%
            rename(salary = sal, commrate = comm)
str(empnew)
  
# [문제13] 가장 많은 인원이 일하고 있는 부서 번호를 출력한다.

empnew %>%
  count(deptno) %>% 
  arrange(desc(deptno)) %>% 
  select(deptno) %>% 
  head(1)

# [문제14] 각 직원들 이름의 문자 길이를 저장하는 enamelength 라는 컬럼을 추가한 다음에
# 이름 길이가 짧은 순으로 직원의 이름을 출력한다.

empnew %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength) %>% 
  select(ename, enamelength)

# [문제15] 커미션이 정해진 직원들의 명수를 출력한다.

empnew %>% 
  filter(commrate != "NA") %>% 
  summarise(n = n())

# [문제16] ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다. 
# mpg <- as.data.frame(ggplot2::mpg) 를 실행시킨 후에 다음 명령들을 dplyr 패키지의 함수들을 이용해서 해결한다.
# 1. mpg의 구조를 확인한다.

mpg <- as.data.frame(ggplot2::mpg)
str(mpg)

# 2. mpg 의 행의 개수와 열의 개수를 출력한다.

mpg %>% 
  dim()

# 3. mpg의 데이터를 앞에서 10개 출력한다.

mpg %>% 
  head(10)

# 4. mpg의 데이터를 뒤에서 10개 출력한다.

mpg %>%
  tail(10)

# 5. mpg의 데이터를 spreadsheet-style data viewer 로 출력한다.

View(mpg)
  
# 6. mpg를 열 단위로 요약한다.

summary(mpg)

# 7. mpg 데이터셋에서 제조사별 차량의 수를 출력한다.

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(n= n())

# 8. mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.

mpg %>% 
  group_by(manufacturer, model) %>% 
  summarise(n = n())

mpg %>% 
  count(manufacturer, model)
# [문제17]  다음에 제시된 문제를 각각 1, 2 로 넘버링 하여 해결 코드를 R로 작성한다.
# 1.
mpg %>% 
  rename(city = cty, highway = hwy) %>% 
  str(mpg)

# 2.
mpg %>% 
  rename(city = cty, highway = hwy) %>% 
  head

# [문제18]  다음에 제시된 문제를 각각 1, 2, 3 으로 넘버링 하여 해결 코드를 R로 작성한다
# 1.

mpg %>% 
  filter(displ >= 5) %>%
  summarise("five_or_more" = n(), mean_hwy = mean(hwy))
mpg %>% 
  filter(displ <= 4) %>%
  summarise("four_or_less" = n(), mean_hwy = mean(hwy))

cat("배기량 4이하인 자동차가 hwy(고속도로 연비)가 평균적으로 더 좋다")

# 2.

mpg %>% 
  filter(manufacturer == "audi" | manufacturer == "toyota") %>%
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) 
  
cat("toyota 의 cty(도시연비)가 평균적으로 더 높다")

# 3.

mpg %>% 
  filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda") %>% 
  summarise(total_mean_hwy = mean(hwy))

mpg %>% 
  filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>% 
  summarise(total_mean_hwy = mean(hwy))

# 문제19]  다음에 제시된 문제를 각각 1, 2 으로 넘버링 하여 해결 코드를 R로 작성한다.
# 1.

mpg3 <- mpg %>% 
          select(class, cty)
head(mpg3)

# 2.

mpg3 %>% 
  filter(class == "suv" | class == "compact") %>% 
  group_by(class) %>% 
  summarise(high_cty = mean(cty))
  
cat("compact 인 자동차가 cty(도시연비)가 더 높다")

# 문제20]  다음에 제시된 문제에 대한 해결 코드를 R로 작성한다

mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)
  
