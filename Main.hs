{-# LANGUAGE OverloadedStrings, MultiParamTypeClasses, TypeFamilies, TemplateHaskell, QuasiQuotes #-}
module Main (main) where
import Yesod
import Network.Wai.Handler.FastCGI (run)

data Fluxflex = Fluxflex

mkYesod "Fluxflex" [parseRoutes|
/ HomeR GET
|]

instance Yesod Fluxflex where
  approot _ = ""

type Handler = GHandler Fluxflex Fluxflex

getHomeR :: Handler RepHtml
getHomeR = defaultLayout [hamlet|Hello, Yesod!|]

main :: IO ()
main = toWaiApp Fluxflex >>= run
