import Html

fibs a b = if b < 4000000000
           then b :: fibs b (a + b)
           else []

main = fibs 1 2
    |> List.filter (\n -> n % 2 == 0)
    |> List.sum >> toString >> Html.text
