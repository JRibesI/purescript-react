module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Web.HTML (window)
import Web.HTML.Window (document)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.DOM.NonElementParentNode (getElementById)
import React.Basic.DOM.Client (createRoot, renderRoot)
import Data.Maybe (Maybe(..))
import App (mkApp)



main :: Effect Unit
main = do
  maybeApp <- getElementById "app" =<< toNonElementParentNode <$> (document =<< window)
  case maybeApp of
    Nothing -> log "No element with id 'app' found."
    Just app -> do
      root <- createRoot app
      appComponent <- mkApp 
      renderRoot root (appComponent {})
      
  


