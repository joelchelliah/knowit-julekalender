import Html

main = List.range 4 250
    |> List.foldl (\_ acc -> (List.take 3 acc |> List.sum)::acc) [4,2,1]
    |> List.head >> toString  >> Html.text
