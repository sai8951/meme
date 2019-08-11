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
           , ul [] [ viewBioList "2019.6.28-7.2" "ワインと楽しむアート展 at Gallery IYN, Osaka"
                    , viewBioList "2015.12.18-23." "+P Tokyo2 at Design Festa Gallery, Tokyo"
                    , viewBioList "2015.07.31-08.02." "PosCo 10 at Design Festa Gallery, Tokyo"
                    , viewBioList "2015.06.15-07.11." "Pop Japan vol.5 at Me and Art Gallery, Sydney"
                    , viewBioList "2015.03.23." "Ph.D. in lifescience, Kyoto University"
                   ]
           ]


viewBioList : String -> String -> Html Msg
viewBioList date exhibition =
    li [] [ div [ class "row" ] [ div [ class "col s3" ] [ text date] 
                                , div [ class "col s6" ] [ text exhibition ]
                                ]
            ]