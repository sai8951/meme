module Page.Shop exposing (view, Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {
  }


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div [] [ h5 [] [ text "Shop" ]
           , ul [] [ viewLinksList "suzuri :" "sai8951" "https://suzuri.jp/sai8951"
                   ]
           ]


viewLinksList : String -> String -> String -> Html Msg
viewLinksList shop name url =
    li [] [ div [ class "row underline" ] [ div [ class "col s6 m2 l2" ] [ text shop ] 
                                , div [ class "col s6 m6 l6 font-bold" ] [ a [ href url, target "_blank"] [text name ] ]
                                ]
            ]