package main

import (
  "fmt"
  "strconv"
)

func main() {
  i := 6
  for true {
    s := strconv.Itoa(i)
    last := s[len(s)-1:]
    j, _ := strconv.Atoi(last + s[0:len(s)-1])
    if( last == "6" && j == 4 * i) {
      fmt.Println(s)
      break
    }
    i += 10
	}
}
