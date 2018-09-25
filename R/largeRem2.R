#' Largest remainder method to round percentages (refactored)
#'
#' This function helps rounding up our down a list of percentages
#' (that add up to 100) into a list of integers that still add up to 100
#' @param pcVec: a vector
#' @examples
#' b <- c(20.5,60.3,19.2)
#' largeRem2(b)
#' [1] 21 60 19

largeRem2 <- function(pcVec) {
  if(sum(pcVec) != 100) stop("The sum of the items in your column isn't equal to 100")

  diffTo100 <- 100 - sum(as.integer(pcVec))
 
  if(diffTo100 == 1) {
    index <- which.max(pcVec %% 1)
  } else if (diffTo100 == -1) {
    index <- which.min(pcVec %% 1)
  }
  
  # Catch the equality case - but can this ever actually happen?
  if(length(unique(pcVec %% 1)) == 1) {
    index <- sample(1:length(pcVec), 1)
  }
  
  pcVec[index] <- pcVec[index] + diffTo100
  return(as.integer(pcVec))
}
