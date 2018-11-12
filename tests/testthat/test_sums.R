context("Test various sums")
library(largeRem)
library(dplyr)
library(purrrlyr)

a <- c(20,60,20)
b <- c(20.5,60.3,19.2)
c <- c(33.3,33.3,33.3)
d <- c(20.1,30.8,50.2)

test_that("Simple sum of integers already equal to 100 don't change", {
  expect_equal(largeRem(a), c(20,60,20))
})

test_that("Add and remove one in same vector", {
  expect_equal(largeRem(b), c(21,60,19))
})

test_that("Sum not equal to 100 breaks", {
  expect_error(largeRem(d), "The sum of the items in your column isn't equal to 100")
})
