module Page.Home exposing (view, Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {
  }


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div []
        [ div [ class "row" ]
            [ div [ class "col s12 m8 l7" ]
                [ text "My first private exhibition will be held at Gallery IYN, Osaka during 14-20.Aug.2020." ]
            ]
        , div [ class "row center" ]
            [ a [ href "https://www.gallery-iyn.com/post/%E5%8C%97%E6%9E%95%E3%81%A7%E5%A4%A2%E3%82%92%E8%A6%8B%E3%82%8B-%E6%96%8E%E8%97%A4%E3%81%95%E3%81%84", target "_blank"]
                [ img [ class "home-image", src "pics/2020_private_exhibition/saitou_sai_DM_CMYK_final.jpg" ] [] ]
            ]
        ]
