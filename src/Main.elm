import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser as Parser exposing ((</>), (<?>), Parser, int, map, oneOf, s, string, top)
import Page.Home as Home
import Page.Gallery as Gallery
import Page.Biography as Bio
import Page.Links as Links
import Page.Contact as Contact


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
  = Home Home.Model
  | Gallery Gallery.Model
  | Biography Bio.Model
  | Links Links.Model
  | Contact Contact.Model
  | NotFound


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  stepUrl <| Model key url NotFound



-- UPDATE


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | HomeMsg Home.Msg
  | GalleryMsg Gallery.Msg
  | BiographyMsg Bio.Msg
  | LinksMsg Links.Msg
  | ContactMsg Contact.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          if String.endsWith "#" (Url.toString url) then
            ( model, Cmd.none )
          else
            ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChanged url ->
      stepUrl { model | url = url }
    
    HomeMsg _ ->
      ( model, Cmd.none)

    GalleryMsg _ ->
      ( model, Cmd.none)

    BiographyMsg _ ->
      ( model, Cmd.none )
    
    LinksMsg _ ->
      ( model, Cmd.none)
    
    ContactMsg _ ->
      ( model, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
  { title = "Sai's Portfolio"
    , body =
        [ Html.main_ [] [ viewNav model
                        , div [ class "container" ] [ viewPage model ]
        ]
        , viewFooter
        ]
    }

viewNav : Model -> Html Msg
viewNav model =
    div [ class "row" ]
        [ nav []
            [ div [ class "nav-wrapper" ]
                [ div [ classList [ ( "col", True ), ( "s12", True ) ] ]
                    [ a [ href "/meme", class "brand-logo" ] [ text "Sai's Portfolio" ]
                      , a [ href "#", attribute "data-target" "for-mobile",  class "sidenav-trigger" ] [ i [ class "material-icons" ] [ text "menu" ] ]
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
    [ li (case page of
            Home _ -> [ class "active" ]
            _ -> []
          ) [ a [ class "sidenav-close", href "/meme" ] [ text "Home" ] ]
    , li (case page of
            Gallery _ -> [ class "active" ]
            _ -> []
          ) [ a [ class "sidenav-close", href "/meme/gallery" ] [ text "Gallery" ] ]
    , li (case page of
            Biography _ -> [ class "active" ]
            _ -> []
          ) [ a [ class "sidenav-close", href "/meme/biography" ] [ text "Biography" ] ]
    , li (case page of
            Links _ -> [ class "active" ]
            _ -> []
          ) [ a [ class "sidenav-close", href "/meme/links" ] [ text "Links" ] ]
    , li (case page of
            Contact _ -> [ class "active" ]
            _ -> []
          ) [ a [ class "sidenav-close", href "/meme/contact" ] [ text "Contact" ] ]
                ]

viewPage : Model -> Html Msg
viewPage { url, page } =
    case page of
        Home model ->
            Html.map HomeMsg (Home.view model)

        Gallery model ->
            Html.map GalleryMsg (Gallery.view model)

        Biography model ->
            Html.map BiographyMsg (Bio.view model)
        
        Links model ->
            Html.map LinksMsg (Links.view model)
        
        Contact model ->
            Html.map ContactMsg (Contact.view model)

        NotFound ->
            text <| Url.toString url ++ " was not found. "


viewFooter : Html Msg
viewFooter =
    footer [ class "page-footer" ] [
          div [ class "footer-copyright" ] [
              div [ class "container" ] [ span [ class "right" ] [ text "© Saitou Sai" ] ]
          ]
    ]

stepUrl : Model -> ( Model, Cmd Msg )
stepUrl model =
    let
        parser =
            oneOf
                [ map ( { model | page = Home {} }, Cmd.none ) top
                , map ( { model | page = Home {} }, Cmd.none ) (s "meme")
                , map ( { model | page = Gallery {} }, Cmd.none ) (s "meme" </> s "gallery")
                , map ( { model | page = Biography {} }, Cmd.none ) (s "meme" </> s "biography")
                , map ( { model | page = Links {} }, Cmd.none ) (s "meme" </> s "links")
                , map ( { model | page = Contact {} }, Cmd.none ) (s "meme" </> s "contact")
                ]
    in
    Parser.parse parser model.url
        |> Maybe.withDefault ( { model | page = NotFound }, Cmd.none )


viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]
