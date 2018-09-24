#' Largest remainder method to round percentages
#'
#' This function helps rounding up our down a list of percentages
#' (that add up to 100) into a list of integers that still add up to 100
#' @param pcVec: a vector
#' @examples
#' b <- c(20.5,60.3,19.2)
#' largeRem(b)
#' [1] 21 60 19

#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

largeRem <- function(pcVec) {

  # Convert the list passed to the function into a data frame,
  df_tmp <- data.frame(pcVec)

  try(if(sum(df_tmp$pcVec) != 100) stop("The sum of the items in your column isn't equal to 100"))

  # Isolate the integers and the decimal points into separate columns
  df_tmp <- df_tmp %>%
    mutate(integers = round(pcVec)) %>%
    mutate(decimalPoints =
             as.numeric(unlist(lapply(strsplit(sprintf("%.2f", pcVec), '.', fixed = TRUE),"[[",2))))

  # If the sum of our rounds() is 99, we need to add one;
  # if greater than 100, we need to substract one
  # In case of equality (eg c(33.33, 33.33, 33.33)) we pick one at random with sample()
  diffTo100 <- 100 - sum(df_tmp$integers)
  if (diffTo100 == 1) {
    index <- as.numeric(sample(row.names(df_tmp %>% filter(decimalPoints == max(decimalPoints))),1))
    df_tmp[index,"integers"] <- df_tmp[index,"integers"] + 1

  } else if (diffTo100 == -1)  {
    index <- as.numeric(sample(row.names(df_tmp %>% filter(decimalPoints == min(decimalPoints))),1))
    df_tmp[index,"integers"] <- df_tmp[index,"integers"] - 1
  }
  return(df_tmp$integers)
}
