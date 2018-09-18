#' @title Compute risk-neutral prices of a contract paying an asset's return or powers thereof from traded options.
#'
#' @description \code{Option2price} return the prices of contracts paying the first
#' N powers of the asset's future return $R^N=log(ST/S0)^N$.
#'
#' @param XC vector of call strikes
#' @param C vector of call prices
#' @param XP vector of put strikes
#' @param P vector of put prices
#' @param S0 if not given will be approximated along the way
#' @param df optional, if not given, will be approximated along the way
#' @param N optional, will return the N (4) first standardized moments.
#' Note that, as there only a discrete number of options employed in this
#' approximation, the accuracy of the result will quickly decrease with N.
#'
#' @return Vector of N (4) first standardized moments
#'
#' @examples
#' Option2price(DAX$XC,DAX$C,DAX$XP,DAX$P,1000,0.99)
#' Option2price(DAX$XC,DAX$C,DAX$XP,DAX$P,1000,0.99,6) # The first 6 contract prices
#'
#' @importFrom methods hasArg
#' @importFrom stats lm na.omit coef
#'
#'@export
Option2price <- function(XC,C,XP,P,S0,df,N){
  if(!hasArg(N)){N<-4}
  nPut <- which(XP<S0)
  XP <- XP[nPut]
  P <- P[nPut]
  nCall <- which(XC>S0)
  XC <- XC[nCall]
  C <- C[nCall]

  if (length(nPut>1)) {dXP <- c(XP[2]-XP[1],diff(XP))} else {dXP<-0}
  if (length(nCall>1)) {dXC <- c(XC[2]-XC[1],diff(XC))} else {dXC<-0}

  out<-rep(NA,N)

  for(k in seq(N)){
    out[k]<-sum(momweight(XP,S0,k)*P*dXP)+sum(momweight(XC,S0,k)*C*dXC)
    if(k==1){out[k]<-out[k]+1/df-1}
  }
  return(out)
}
