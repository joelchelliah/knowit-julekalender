package main

import (
  "fmt"
  "strings"
  "io/ioutil"
)

func main() {
  data, _ := ioutil.ReadFile("luke05_data.txt")
  content := strings.Split(string(data)[1:len(data)-2], ", ")
  letters := []string{}
  
  for i := 0; i < len(content)/2; i++ {
    dec1 := toDec(content[i])
    dec2 := toDec(content[len(content) - 1 - i])
    letters = append(letters, toEng(dec1 + dec2))
  }
  fmt.Println(strings.Join(letters, ""))
}

func toDec(n string) int {
  return map[string] int {
    "0": 0, "I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7,
    "VIII": 8, "IX": 9, "X": 10, "XI": 11, "XII": 12, "XIII": 13,
  }[n]
}

func toEng(n int) string {
  return []string {
    "a","b","c","d","e","f","g","h","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z",
  }[n - 1]
}
