#' @title Calculate factorial
#'
#' @description \code{fact} ...
#'
#' @param x upper numebr
#' @param n lower number
#' Quaksi
#'
#' @return Factorial
#'
fact <- function(x,n){factorial(n)/(factorial(x)*factorial(n-x))}
