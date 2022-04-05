# CASE 1
library(dplyr)

emp <- read.csv("data/emp.csv")
emp %>% head

### 문제1
emp %>% filter(job=="MANAGER")
# select * from emp where job = 'MANAGER'
### 문제2
emp %>% select(empno, ename, sal)
# select empno, ename, sal from emp

### 문제3
emp %>% select(-empno)

### 문제4
emp %>% select(ename, sal)

### 문제5
emp %>% 
  group_by(job) %>% 
  summarise(num=n())
emp %>% 
  group_by(job) %>% 
  tally()
emp %>% 
  count(job) 


### 문제6
emp %>%
  filter(1000<=sal & sal<=3000) %>% 
  select(ename, sal, deptno)

### 문제7
emp %>%
  filter(job!="ANALYST") %>% 
  select(ename, job, sal)

### 문제8
emp %>%
  filter(job=="SALESMAN" | job=="ANALYST") %>% 
  select(ename, job)

### 문제9
emp %>% 
  group_by(deptno) %>% 
  summarise(sal_sum=sum(sal))

# select deptno, sum(sal)  from emp group by deptno

### 문제10
emp %>% arrange(sal)
  
### 문제11
emp %>%
  arrange(desc(sal)) %>% 
  head(1)

### 문제12
empnew <- emp %>% rename(salary="sal", commrate="comm")
empnew %>% str
empnew %>% head
### 문제13
emp %>%
  group_by(deptno) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(1)

emp %>%
  count(deptno) %>% 
  arrange(desc(n)) %>% 
  head(1)

### 문제14
emp %>%
  mutate(enamelength=nchar(ename)) %>% 
  arrange(enamelength) %>% 
  select(ename, enamelength)

### 문제15
emp %>%
  filter(!is.na(comm)) %>% 
  count()

### 문제16
mpg <- as.data.frame(ggplot2::mpg)
# 1.
mpg %>% str
# 2.
mpg %>% dim
# 3.
mpg %>% head(10)
# 4.
mpg %>% tail(10)
# 5.
mpg %>% View
# 6.
mpg %>% summary
# 7.
mpg %>% 
  group_by(manufacturer) %>% 
  count()
mpg %>% 
  group_by(manufacturer) %>% 
  tally()
mpg %>% 
  count(manufacturer) 
  
# 8.
mpg %>% 
  group_by(manufacturer, model) %>% 
  count()
mpg %>% 
  count(manufacturer, model)

### 문제17
# 1.
mpg_copy <- mpg %>% rename(city="cty", highway="hwy")
mpg_copy %>% str
# 2.
mpg_copy %>% head

### 문제18
# 1.
mpg %>%
  filter(displ<=4) %>% 
  summarise(displ_under_4=mean(hwy))
mpg %>%
  filter(displ>=5) %>% 
  summarise(displ_over_5=mean(hwy))
# 2.
mpg %>% 
  filter(manufacturer=="audi" | manufacturer=="toyota") %>% 
  group_by(manufacturer) %>% 
  summarise(cty_by_manufact=mean(cty))
# 3.
mpg %>% 
  filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>%
  summarise(cty_by_manufact=mean(hwy))
  
### 문제19
# 1.
mpg3 <- mpg %>% select(class, cty)
mpg3 %>% head
# 2.
mpg3 %>% 
  filter(class=="suv" | class=="compact") %>% 
  group_by(class) %>% 
  summarise(cty_by_class=mean(cty))

### 문제20
mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

# CASE 2

emp <- read.csv('data/emp.csv')

library(dplyr)
# 문제 1
emp %>% filter(job == 'MANAGER')
# 문제 2
emp %>% select(empno, ename, sal)
# 문제 3
emp %>% select(-empno)
# 문제 4
emp %>% select(ename, sal)
# 문제 5
emp %>% 
  group_by(job) %>% 
  count

emp %>% 
  group_by(job) %>% 
  tally

emp %>% 
  count(job) 

# 문제 6
emp %>% 
  filter(sal >= 1000 & sal <= 3000) %>%
  select(ename, sal, deptno)
# 문제 7
emp %>%
  filter(job != 'ANALYST') %>% 
  select(ename, job, sal)
# 문제 8
emp %>% 
  filter(job == 'SALESMAN' | job == 'ANALYST') %>% 
  select(ename, job)
# 문제 9
emp %>% 
  group_by(deptno) %>% 
  summarise(sum = sum(sal))
# 문제 10
emp %>% arrange(sal)
# 문제 11
emp %>% arrange(desc(sal)) %>% 
  head(1)
# 문제 12
emp %>% rename(salary = sal, 
               commrate = comm) -> empnew
str(empnew)
# 문제 13
emp %>% 
  count(deptno) %>% 
  arrange(desc(n)) %>% 
  select(deptno) %>% 
  head(1)

# 문제 14
emp %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength) %>% 
  select(ename, enamelength)

# 문제 15
emp %>% 
  filter(!is.na(comm)) %>% 
  count

# 문제 16
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
# 1
mpg %>% str
# 2
mpg %>% dim
# 3
mpg %>% head(10)
# 4
mpg %>% tail(10)
# 5
mpg %>% View
# 6
mpg %>% summary
# 7
mpg %>% 
  group_by(manufacturer) %>% 
  count
# 8
mpg %>% 
  group_by(manufacturer, model) %>% 
  count

mpg %>% 
  count(manufacturer, model)

# 문제 17
# 1
mpg %>% rename(city=cty,
               highway=hwy) -> mpg.rename
# 2
mpg.rename %>% head

# 문제 18
# 1
mpg %>% 
  filter(displ <= 4 | mpg$displ >= 5) %>%
  mutate(displ.group = ifelse(displ <= 4, '배기량 4이하', '배기량 5이상')) %>% 
  group_by(displ.group) %>% 
  summarise(hwy.mean = mean(hwy))


displ4 <- mpg %>% filter(displ <= 4)
displ5 <- mpg %>% filter(displ >= 5)
if(mean(displ4$hwy) > mean(displ5$hwy)){
  cat("배기량이 4 이하인 자동차의 hwy가 평균적으로 더 높다\n")
}else{
  cat("배기량이 5 이상인 자동차의 hwy가 평균적으로 더 높다\n")
}


# 2
mpg %>% 
  filter(manufacturer %in% c('audi', 'toyota')) %>% 
  group_by(manufacturer) %>% 
  summarise(cty.mean = mean(cty))

audi <- mpg %>% filter(manufacturer == "audi") 
toyota <- mpg %>% filter(manufacturer == "toyota") 
if(mean(audi$cty) > mean(toyota$cty)){
  cat("아우디의 cty가 평균적으로 더 높다\n")
}else{
  cat("도요타의 cty가 평균적으로 더 높다\n")
}

# 3
mpg %>% 
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>% 
  summarise(hwy.mean = mean(hwy))

# 문제 19
# 1
mpg %>% select(class, cty) -> mpg3
head(mpg3)
# 2
mpg3 %>% 
  filter(class %in% c('suv', 'compact')) %>% 
  group_by(class) %>% 
  summarise(cty.mean = mean(cty))

suv <- mpg3 %>% filter(class == "suv")
compact <- mpg3 %>% filter(class == "compact")
if(mean(suv$cty) > mean(compact$cty)){
  cat("suv class의 cty가 평균적으로 더 높다")
}else{
  cat("compact class의 cty가 평균적으로 더 높다")
}


# 문제 20
mpg %>% 
  filter(manufacturer == 'audi') %>% 
  arrange(desc(hwy)) %>% 
  head(5)
