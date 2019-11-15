{-# LANGUAGE RecordWildCards #-}
module Main where

import Lib
import Hoogle
import Control.Monad (forM_)

main :: IO ()
main = do
  fp <- defaultDatabaseLocation
  withDatabase fp $ \db -> do
    let targets = searchDatabase db "a -> a"
    forM_ targets $ \Target {..} -> do
      print targetURL
      print targetPackage
      print targetModule
      print targetType
      print targetItem
      print targetDocs
