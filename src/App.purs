module App (mkApp) where

import Prelude

import React.Basic.Hooks as React
import React.Basic.DOM as R
import Componentes.Loco (mkLoco)

mkApp :: React.Component {}
mkApp = do
    loco <- mkLoco
    React.component "App" \_ -> React.do
        pure $ R.div_ [ R.text "Hola" ]