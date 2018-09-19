#' @title Compute implied standardized moments from calls and puts
#'
#' @description \code{Option2stat} returns first N standardized moments of an asset's risk neutral log
#' return distribution from traded put and call options traded on that
#' asset, with equal time to maturity. Note that, as there only a discrete
#' number of options employed in this approximation, the accuracy of the
#' result will quickly decrease with N.
#'
#' @param XC vector of call strikes
#' @param C vector of call prices
#' @param XP vector of put strikes
#' @param P vector of put prices
#' @param S0 optional, if not given will be approximated along the way
#' @param df optional, if not given, will be approximated along the way
#' @param N optional, will return the N (4) first standardized moments.
#' Note that, as there only a discrete number of options employed in this
#' approximation, the accuracy of the result will quickly decrease with N.
#'
#' @return Vector of N (4) first standardized moments
#'
#' @examples
#' Option2stat(DAX$XC,DAX$C,DAX$XP,DAX$P)
#'
#' @importFrom methods hasArg
#' @importFrom stats lm na.omit
#'
#'@export
Option2stat <- function(XC,C,XP,P,S0,df,N){
  if(!hasArg(N)){N<-4}
  if(!hasArg(df)|!hasArg(S0)){
    h <- intersect(XC,XP)
    if(length(h)==0){stop("to calculate S0 and df we need overlapping strikes for puts and calls to use put-call-parity")}
    idxP <- na.omit(match(h,XP))
    idxC <- na.omit(match(h,XC))
    YY <- C[idxC]-P[idxP]
    regcoef<-coef(lm(YY~XC[idxC]))
    S0 <- regcoef[1]
    df <- -regcoef[2]
  }

  M <- Option2price(XC,C,XP,P,S0,df,N)*1/df

  out <- rep(NA,N)
  for(n in seq(N)){
    out[n]<-sum(fact(0:n,n)*(-1)^(0:n)*c(M[n-(0:(n-1))], 1)*M[1]^(0:n))
  }
  out[1]<-M[1]
  if(N>2){out[3:N]<-out[3:N]/out[2]^(0.5*(3:N))}
  return(out)
}
