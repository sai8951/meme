import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser as Parser exposing ((</>), (<?>), Parser, int, map, oneOf, s, string, top)
import Page.Biography as Bio


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
  , page : Page
  }


type Page
  = Home
  | Gallery
  | Biography Bio.Model
  | Links
  | Contact
  | NotFound


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  stepUrl <| Model key url NotFound



-- UPDATE


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | BiographyMsg Bio.Msg


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
      stepUrl { model | url = url }
    
    BiographyMsg _ ->
      ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
  { title = "Sai's Portfolio"
    , body =
        [ viewNav model
        , div [ class "container" ] [ viewPage model ]
        ]
    }

viewNav : Model -> Html Msg
viewNav model =
    div [ class "row" ]
        [ nav []
            [ div [ class "nav-wrapper" ]
                [ div [ classList [ ( "col", True ), ( "s12", True ) ] ]
                    [ a [ href "#", attribute "data-target" "for-mobile",  class "sidenav-trigger" ] [ i [ class "material-icons" ] [ text "menu" ] ]
                      , ul
                          [ id "nav-mobile"
                          , classList
                              [ ( "right", True ), ( "hide-on-med-and-down", True ) ]
                          ] (showMenu model.page)
                    ]
                ]
            ]
            , ul
                [ class "sidenav", id "for-mobile" ] (showMenu model.page)
        ]


showMenu : Page -> List (Html msg)
showMenu page =
  [  li (if page == Home then [ class "active" ] else []) [ a [ href "/meme" ] [ text "Home" ] ]
    , li (if page == Gallery then [ class "active" ] else []) [ a [ href "/meme/gallery" ] [ text "Gallery" ] ]
    , li (case page of
            Biography _ -> [ class "active" ]
            _ -> []
          ) [ a [ href "/meme/biography" ] [ text "Biography" ] ]
    , li (if page == Links then [ class "active" ] else []) [ a [ href "/meme/links" ] [ text "Links" ] ]
    , li (if page == Contact then [ class "active" ] else []) [ a [ href "/meme/contact" ] [ text "Contact" ] ]
                ]

viewPage : Model -> Html Msg
viewPage { url, page } =
    case page of
        Home ->
            text "Home"

        Gallery ->
            text "Gallery."

        Biography model ->
            Html.map BiographyMsg (Bio.view model)
        
        Links ->
            text "Link."
        
        Contact ->
            text "Contact."

        NotFound ->
            text <| Url.toString url ++ " was not found. "


stepUrl : Model -> ( Model, Cmd Msg )
stepUrl model =
    let
        parser =
            oneOf
                [ map ( { model | page = Home }, Cmd.none ) top
                , map ( { model | page = Home }, Cmd.none ) (s "meme")
                , map ( { model | page = Gallery }, Cmd.none ) (s "meme" </> s "gallery")
                , map ( { model | page = Biography {} }, Cmd.none ) (s "meme" </> s "biography")
                , map ( { model | page = Links }, Cmd.none ) (s "meme" </> s "links")
                , map ( { model | page = Contact }, Cmd.none ) (s "meme" </> s "contact")
                ]
    in
    Parser.parse parser model.url
        |> Maybe.withDefault ( { model | page = NotFound }, Cmd.none )


viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]