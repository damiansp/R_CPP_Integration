#==============================================#
#                                              #
#   Seamless R and C++ Integration with Rcpp   #
#                                              #
#==============================================#
rm(list = ls())
load('~/Classes/rcpp/rcpp.RData')

# 1. A Gentle Introduction to Rcpp

# 1.1 Background: From R to C++
xx <- faithful$eruptions
fit <- density(xx)
plot(fit)

fit2 <- replicate(10000, { x <- sample(xx, replace = T)
                           density(x, from = min(fit$x), to = max(fit$x))$y })

fit3 <- apply(fit2, 1, quantile, c(0.025, 0.975))
plot(fit, ylim = range(fit3))
polygon(
  c(fit$x, rev(fit$x)), c(fit3[1,], rev(fit3[2,])), col = 'grey', border = F)
lines(fit)



# 1.2 A First Example
  # 1.2.2 A First R Solution
  fibR <- function(n) {
    if (n == 0) { return (0) }
    if (n == 1) { return (1) }
    return (fibR(n - 2) + fibR(n - 1))
  }

  # 1.2.3 A First C++ Solution 
  # See ./introToRcpp.cpp  

save.image('~/Classes/rcpp/rcpp.RData')
