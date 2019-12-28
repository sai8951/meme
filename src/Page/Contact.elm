module Page.Contact exposing (view, Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {
  }


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div [] [ h5 [] [ text "Contact" ]
           , ul [] [ viewContactList "My name :" "斎藤さい (SAITOU Sai)"]
           , ul [] [ viewContactList "Gmail :" "sai.e8951@gmail.com"]
           ]


viewContactList : String -> String -> Html Msg
viewContactList service address =
    li [] [ div [ class "row underline" ] [ div [ class "col s4 m2 l2" ] [ text service ] 
                                , div [ class "col s7 m6 l6" ] [text address ]
                                ]
            ]