#' @title Calculate factorial
#'
#' @description \code{fact} ...
#'
#' @param x upper number
#' @param n lower number
#'
#'
#' @return Factorial
#'
fact <- function(x,n){factorial(n)/(factorial(x)*factorial(n-x))}
