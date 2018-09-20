
<!-- README.md is generated from README.Rmd. Please edit that file -->
IMOMBOX
=======

This is an `R` implementation of the original Matlab code of Matthias Held ("<matthias.held@whu.edu>") to calculate Bakshi/Kapadia/Madan moments of option implied return distribution.

**CURRENTLY THIS PACKAGE IS UNDER HEAVY DEVELOPMENT AND NOT ALL THE FUNCTIONS HAVE YET BEEN IMPLEMENTED TO THEIR FULL EXTENT!**

Installation
------------

You can install IMOMBOX from github with:

``` r
# install.packages("devtools")
devtools::install_github("diffform/IMOMBOX")
```

Example
-------

The example data is provided in the originally matlab package and contains observations of call and put option prices from `2013-09-20` written on the German DAX index with a maturity of `2013-10-18` (28 days to maturity). Based on these options we calculate risk neutral prices for the first four moment contracts, i.e. the contracts that pay *R*<sup>1</sup>, *R*<sup>2</sup>, *R*<sup>3</sup> and *R*<sup>4</sup>.

``` r
require(IMOMBOX)
#> Loading required package: IMOMBOX
data(DAX)
# For the calculation of 
Option2price(DAX$XC,DAX$C,DAX$XP,DAX$P)
#> Estimated spot price S0: 8676.151  and estimated discount factor df: 0.9999221
#> [1] -0.0008807785  0.0019554410 -0.0001197590  0.0000228430
```

So, we find that an option that pays *R*<sup>2</sup> in 28 days from now commands a price of 0.002.
