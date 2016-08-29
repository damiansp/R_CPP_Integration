/* introToRcpp.cpp */
/**
 * Seamless R and C++ Integration s with Rcpp
 */
#include <iostream>
using namespace std;

/* 1. A Gentle Introduction to Rcpp */
/* 1.2 A First Example */
/* 1.2.3 A First C++ Solution */
int fibonacci(const int x) {
  if (x == 0) { return 0; }
  if (x == 1) { return 1; }
  return (fibonacci(x - 2) + fibonacci(x - 1));
}


int main(int argc, char* argv[]) {
  for (int i = 0; i < 10; i++) {
    cout << i << "\t" << fibonacci(i) << endl;
  }

  return 0;
}


extern "C" SEXP fibWrapper(SEXP xs) {
  int x = Rcpp::as<int>(xs),
    fib = fibonacci(x);

  return (Rcpp::wrap(fib));
}
