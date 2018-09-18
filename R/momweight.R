#' @title Calculate weights for ...
#'
#' @description \code{momweight} ...
#'
#' @param X vector of strikes
#' @param S0 stock price
#' @param n power of the option contract
#' Note that, as there only a discrete number of options employed in this
#' approximation, the accuracy of the result will quickly decrease with N.
#'
#' @return Vector of N (4) first standardized moments
#'
momweight <- function(X,S0,n){
  return(1/X^2*n*((n-1)*log(X/S0)^(n-2)-log(X/S0)^(n-1)))
}
