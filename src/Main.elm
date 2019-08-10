import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url



-- MAIN


main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }



-- MODEL


type alias Model =
  { key : Nav.Key
  , url : Url.Url
  }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  ( Model key url, Cmd.none )



-- UPDATE


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChanged url ->
      ( { model | url = url }
      , Cmd.none
      )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
  { title = "ODK"
    , body =
        [ viewNav
        , div [ class "container" ] [ text "textt" ]
        ]
    }

viewNav : Html Msg
viewNav =
    div [ class "row" ]
        [ nav []
            [ div [ class "nav-wrapper" ]
                [ div [ classList [ ( "col", True ), ( "s12", True ) ] ]
                    [ a [ href "#", attribute "data-target" "for-mobile",  class "sidenav-trigger" ] [ i [ class "material-icons" ] [ text "menu" ] ]
                      , ul
                          [ id "nav-mobile"
                          , classList
                              [ ( "right", True ), ( "hide-on-med-and-down", True ) ]
                          ]
                          [ li [] [ a [ href "/", class "nav-link" ] [ text "Home" ] ]
                          , li [] [ a [ href "/gallery", class "nav-link-selected" ] [ text "Gallery" ] ]
                          , li [] [ a [ href "/biography", class "nav-link" ] [ text "Biography" ] ]
                          , li [] [ a [ href "/links", class "nav-link" ] [ text "Links" ] ]
                          , li [] [ a [ href "/contact", class "nav-link" ] [ text "Contact" ] ]
                          ]
                    ]
                ]
            ]
            , ul
                [ class "sidenav", id "for-mobile" ] 
                [  li [] [ a [ href "/", class "nav-link" ] [ text "Home" ] ]
                , li [] [ a [ href "/gallery", class "nav-link-selected" ] [ text "Gallery" ] ]
                , li [] [ a [ href "/biography", class "nav-link" ] [ text "Biography" ] ]
                , li [] [ a [ href "/links", class "nav-link" ] [ text "Links" ] ]
                , li [] [ a [ href "/contact", class "nav-link" ] [ text "Contact" ] ]

                ]
        ]


viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]