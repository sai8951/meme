module Page.Biography exposing (view, Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {
  }


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div [] [ h5 [] [ text "Biography" ]
           , ul [] [ viewBioList "28.Jun.-02.Jul.2019" "ワインと楽しむアート展 at Gallery IYN, Osaka"
                    , viewBioList "18-23.Dec.2015" "+P Tokyo2 at Design Festa Gallery, Tokyo"
                    , viewBioList "31.Jul.-02.Aug.2015" "PosCo 10 at Design Festa Gallery, Tokyo"
                    , viewBioList "15.Jun.-11.Jul.2015" "Pop Japan vol.5 at Me and Art Gallery, Sydney"
                    , viewBioList "23.Mar.2015" "Ph.D. in lifescience, Kyoto University"
                   ]
           ]


viewBioList : String -> String -> Html Msg
viewBioList date exhibition =
    li [] [ div [ class "row underline" ] [ div [ class "col s3 m3 l3" ] [ text date ] 
                                , div [ class "col s8 offset-s1 m6 l6" ] [ text exhibition ]
                                ]
            ]