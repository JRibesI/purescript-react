module Componentes.Loco where
import Prelude
import React.Basic.Hooks as React
import React.Basic.DOM as R


mkLoco :: React.Component {}
mkLoco = React.component "Componente" \_ -> React.do
  pure $ R.div_ [ R.text "Hola desde el componente loco" ]
