module HW2 where

-- | Binary trees with nodes labeled by values of an arbitrary type.
data Tree a
   = Node a (Tree a) (Tree a)
   | End
  deriving (Eq,Show)

-- | One step in a path, indicating whether to follow the left subtree (L)
--   or the right subtree (R).
data Step = L | R
  deriving (Eq,Show)

-- | A path is a sequence of steps. Each node in a binary tree can be
--   identified by a path, indicating how to move down the tree starting
--   from the root.
type Path = [Step]

-- | Create a leaf node.
leaf :: a -> Tree a
leaf x = Node x End End

-- | An example tree.
ex :: Tree Int
ex = Node 4 (Node 3 (leaf 2) End)
            (Node 7 (Node 5 End (leaf 6))
                    (leaf 8))


-- | Map a function over a tree. Applies the given function to every label
--   in the tree, preserving the tree's structure.
--
--   >>> mapTree odd End
--   End
--
--   >>> mapTree even (Node 5 (leaf 2) End)
--   Node False (Node True End End) End
--
--   >>> (mapTree not . mapTree even) (Node 5 End (leaf 2))
--   Node True End (Node False End End)
--
--   >>> mapTree (+10) ex
--   Node 14 (Node 13 (Node 12 End End) End) (Node 17 (Node 15 End (Node 16 End End)) (Node 18 End End))
--
--   >>> ex == (mapTree (subtract 27) . mapTree (+27)) ex
--   True
--



mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f (End) = undefined


-- ::Tree a -> Maybe a
--mapTree (Tree a) = leaf 3
--mapTree (a) =
--mapTree (Node x) | Node xodd (Node x)  | otherwise = False


-- | Get the value at the node specified by a path. Returns 'Nothing' if
--   the given path is invalid.
--
--   >>> valueAt [] ex
--   Just 4
--
--   >>> valueAt [L,L] ex
--   Just 2
--
--   >>> valueAt [L,R] ex
--   Nothing
--
--   >>> valueAt [R,L,R] ex
--   Just 6
--
--   >>> valueAt [L,L,L] ex
--   Nothing
--



valueAt :: [Step] -> Tree a -> Int
valueAt [] (Node x _ _) = "Just 2" -- get x convert to int
-- valueAt if [l] (Node _ left  _) = valueAt [l++] left
  --           if [R] (Node _ _  Right) = valueAt [l++] Right
--   How to check Nothing

-- | Find a path to a node that contains the given value.
--
--   >>> pathTo 3 (leaf 5)
--   Nothing
--
--   >>> pathTo 5 ex
--   Just [R,L]
--
--   >>> pathTo 6 ex
--   Just [R,L,R]
--
--   >>> pathTo 4 ex
--   Just []
--
--   >>> pathTo 10 ex
--   Nothing
--

--find :: Ord a => a -> BST a -> Maybe a
--find _ Empty = Nothing
--find z (Node x l r) | x == z = Just z
  --                  | x < z  = find z l
    --                | x > z  = find z r

pathTo :: Eq a => a -> Tree a -> Maybe Path
pathTo = undefined
--_ End = Nothing
--pathTo x (Node a left right) | a == x = undefined
  --                           | a < x = pathTo x left
    --                         | a > x = pathTo x right

--  else (fmap (L:) (inTree x (Node _ l _ )) <|> (fmap (R:) (inTree x (Node _ _ r))))

--pathTo x End = Nothing
--pathTo x (Node a left right) (Path path)
--	| x == a = []
--	| x < a = pathTo x left
--	| x > a = pathTo x right
