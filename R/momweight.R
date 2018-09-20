#' @title Calculate weights for ...
#'
#' @description \code{momweight} In BKM03, any contract on $R^n=[ln(ST/S0)^N]$ can be replicated using bond,
#'  the underlying, puts and calls. The function MOMWEIGHT(K,S0,N) yields the
#'  required weights in the Put and Call options for any strike level X, spot
#'  asset price S0 and contract exponent N.
#'  BKM03 paper: arumgents in integral of V, W, X eq. (7)-(9)
#'  Open question: n=1 gives eq (39)?
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
