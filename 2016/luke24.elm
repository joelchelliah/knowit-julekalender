import Html exposing (..)
import Html.Attributes exposing (..)
import Array

main : Html msg
main = h1 [christmasStyle] [text (title 90101894)]

title : Int -> String
title n = case n of
  0 -> ""
  _ -> title (n // 26) ++ letterFor n

letterFor : Int -> String
letterFor n =
  let letters = Array.fromList (String.split "" "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  in  Array.get (rem n 26 - 1) letters |> Maybe.withDefault ""

christmasStyle : Attribute msg
christmasStyle =
  style [ ("color", "red")
        , ("backgroundColor", "lightgreen")
        , ("text-align", "center")
        , ("font-size", "99px")
        ]
