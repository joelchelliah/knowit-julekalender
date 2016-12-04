import Data.List

main :: IO ()
main = do content <- readFile "luke03_data.txt"
          let list = words <$> lines content
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
findCameleons friends enemies = find' friends enemies []
  where find' [] _ acc = acc
        find' ((x, ys):rest) enemies acc =
          let fx = find'' x (nub ys) enemies []
          in  find' rest enemies ((x, fx) : acc)
        find'' _ [] _ acc = acc
        find'' x (f:fs) enemies acc = case lookUp x enemies of
          Nothing -> acc
          Just (_, enemiesOfX) ->
            if f `notElem` enemiesOfX
            then find'' x fs enemies acc
            else case lookUp f enemies of
              Nothing -> find'' x fs enemies (f : acc)
              Just (_, enemiesOfF) ->
                if x `elem` enemiesOfF
                then find'' x fs enemies acc
                else find'' x fs enemies (f : acc)
        lookUp x = find (\(key,_) -> key == x)
