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
           , ul [] [ viewBioList "30.Jul.- 12.Aug.2024" "京都芸術大学通信教育課程 ゆうゆう会日本画展 at Sato Museum, Tokyo" 
                    , viewBioList "10- 17.Mar.2024" "京都芸術大学通信教育課程卒業・修了制作展 at Galerie Aube, Kyoto"
                    , viewBioList "16- 20.Feb.2021" "Illustration exhibition <2021.February> 冬のメルヘン・ファンタジー at Recto Verso Gallery, Tokyo"
                    , viewBioList "24- 30.Sep.2020" "個展: 北枕で夢を見る at Gallery IYN, Osaka"
                    , viewBioList "28.Jun.- 02.Jul.2019" "ワインと楽しむアート展 at Gallery IYN, Osaka"
                    , viewBioList "18- 23.Dec.2015" "+P Tokyo2 at Design Festa Gallery, Tokyo"
                    , viewBioList "31.Jul.- 02.Aug.2015" "PosCo 10 at Design Festa Gallery, Tokyo"
                    , viewBioList "15.Jun.- 11.Jul.2015" "Pop Japan vol.5 at Me and Art Gallery, Sydney"
                    , viewBioList "" ""
                    , viewBioList "16.Mar.2024" "Bachelor of Fine Art, Kyoto University of Arts"
                    , viewBioList "23.Mar.2015" "Ph.D. in Life Science, Kyoto University"
                   ]
           ]


viewBioList : String -> String -> Html Msg
viewBioList date exhibition =
    li [] [ div [ class "row underline" ] [ div [ class "col s3 m3 l3" ] [ text date ] 
                                , div [ class "col s8 offset-s1 m6 l6" ] [ text exhibition ]
                                ]
            ]