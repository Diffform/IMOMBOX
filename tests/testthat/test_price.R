context("Option2price")

test_that("Option Contract prices for DAX data 3rd contract", {
  data(DAX)
  expect_equal(Option2price(DAX$XC,DAX$C,DAX$XP,DAX$P)[2], 0.002,  tolerance=1e-3)
})
