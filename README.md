# largeRem

This package implements a largest remainder method to solve the rounding of integers and the summing to 100.

# Installing

`install_github('largeRem', 'basilesimon')`

# Examples

```
a <- c(20,60,20)  # sums to 100 and made of integers, no problem
```

```
b <- c(20.5,60.3,19.2)

round(b)
# [1] 20 60 19, which sum is 99

largeRem(b)
# [1] 21 60 19
# in this case, 20.5 is rounded up, the others are rounded down
```

```
d <- c(20.1,30.8,50.2)

round(d)
# [1] 20 31 50

largeRem(d)
# [1] 19 31 50
# in this case, 20.1 loses a whole 1.1 since it is the closest to the next smallest integer

```

# Usage in practice

```
df %>% group_by(obvs) %>%
  mutate(n = n(),
         answers = sum(n),
         share = n / answers * 100,
         share_rounded = largeRem(share)) 
```
