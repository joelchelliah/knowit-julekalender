import Data.List

main :: IO ()
main = do stuff <- readFile "luke03_data.txt"
          let list = words <$> lines stuff
              (likes, hates) = partition (\e -> head e == "friends") list
              friends1 = build ((\[_, x, y] -> (x, y)) <$> likes) []
              friends2 = build ((\[_, x, y] -> (y, x)) <$> likes) friends1
              enemies  = build ((\[x, _, y] -> (x, y)) <$> hates) []
              frenemis = findCameleons (friends1 ++ friends2) enemies
          print . last . sortOn (length . snd) $ frenemis

build :: [(String, String)] -> [(String, [String])] -> [(String, [String])]
build [] acc = acc
build ((x, y):rest) acc = case find (\(key,_) -> key == x) acc of
  Just (_, ys) -> build rest ((x, y:ys) : remove x acc)
  Nothing -> build rest ((x, [y]) : acc)
  where remove key = filter ((/= key) . fst)

findCameleons :: [(String, [String])] -> [(String, [String])] -> [(String, [String])]
findCameleons friends enemies = build' friends enemies []
  where build' [] _ acc = acc
        build' ((x, ys):rest) enemies acc =
          let fx = build'' x (nub ys) enemies []
          in  build' rest enemies ((x, fx) : acc)
        build'' _ [] _ acc = acc
        build'' x (f:fs) enemies acc = case find (\(key,_) -> key == x) enemies of
          Nothing -> acc
          Just (_, enemiesOfX) ->
            if f `notElem` enemiesOfX
            then build'' x fs enemies acc
            else case find (\(key,_) -> key == f) enemies of
              Just (_, enemiesOfF) ->
                if x `elem` enemiesOfF
                then build'' x fs enemies acc
                else build'' x fs enemies (f : acc)
              Nothing -> build'' x fs enemies (f : acc)
