module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { input : String
    , memos : List String
    }


init : Model
init =
    { input = ""
    , memos = []
    }



-- UPDATE


type Msg
    = Input String
    | Submit
    | Done Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
            { model | input = input }

        Submit ->
            { model
                | input = ""
                , memos = model.input :: model.memos
            }

        Done done ->
            { model
                | memos = List.take done model.memos ++ List.drop (done + 1) model.memos
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Submit ]
            [ input [ value model.input, onInput Input ] []
            , button
                [ disabled (String.length model.input < 1) ]
                [ text "Add ToDo" ]
            ]
        , ul [] (viewMemo model.memos)
        ]


htmlFunc : Int -> String -> Html Msg
htmlFunc i memo =
    li [ onClick (Done i) ] [ text memo ]


viewMemo : List String -> List (Html Msg)
viewMemo =
    List.indexedMap htmlFunc