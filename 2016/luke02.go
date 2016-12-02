package main

import ("fmt")

func fibSum(a int, b int) int {
  if b >= 4000000000 {
    return 0
  } else if b % 2 == 0 {
    return b + fibSum(b, a + b)
  } else {
    return fibSum(b, a + b)
  }
}

func main() {
  fmt.Println(fibSum(1, 2))
}
