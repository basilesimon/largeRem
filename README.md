# Largest remainder calculator

From an array of numbers with decimals that add to 100, returns an array of integers that still add to 100 while keeping the least worst roundings.

# Installing

```r
library(devtools)
install_github("basilesimon/largeRem")
```

# Examples


```r
a <- c(20,60,20)  # sums to 100 and made of integers, no problem
```

```r
b <- c(20.5,60.3,19.2)

round(b)
# [1] 20 60 19, which sum is 99

largeRem(b)
# [1] 21 60 19
# in this case, 20.5 is rounded up, the others are rounded down
```

The sum of the rounded integers being 99, we need to increment one of the array elements by one. We pick the item which is arithmetically closest to the next largest integers (ie which remainder is the largest).

```r
d <- c(20.1,30.8,50.2)

round(d)
# [1] 20 31 50

largeRem(d)
# [1] 19 31 50
# in this case, 20.1 loses a whole 1.1 since it is the closest to the next smallest integer
```

# Usage in practice

```r
df %>% group_by(obvs) %>%
  mutate(n = n(),
         answers = sum(n),
         share = n / answers * 100,
         share_rounded = largeRem(share)) 
```
