#' Examples Data from Matlab-IMOMBOX
#'
#' This dataset contains (fictional?) data from DAX put and call options.
#'
#'
#' @format List containing 7 variables
#' \describe{
#'   \item{XC}{(numeric) - Strike prices of call options}
#'   \item{C}{(numeric) - Prices (premium) of call options}
#'   \item{XP}{(numeric) - Strike prices of put options}
#'   \item{P}{(numeric) - Prices (premium) of put options}
#'   \item{date}{(string) - Observation date}
#'   \item{maturity}{(string) - Maturity date for put and call options}
#'   \item{daysToMaturity}{(numeric) - Days to maturity for put and call options.}
#'  }
#' @details 32 call and 28 put options
#' @source Matthias Held Matlab IMOMBOX
#' @examples
#'
#' DAX
#' str(DAX)
#'
#' # plot call premia against call strikes
#' plot(DAX$XC,DAX$C)
#'
#'
"DAX"
