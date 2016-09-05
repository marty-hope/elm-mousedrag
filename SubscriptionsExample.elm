module SubscriptionsExample exposing (..)

import Html exposing (Html, div, text)
import Html.App exposing (..)
import Mouse exposing (..)
import Keyboard exposing (..)


-- Model

type alias Model =
    Int

init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )

-- MESSAGES

type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (toString model) ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( position.x, Cmd.none )

        KeyMsg code ->
            ( code, Cmd.none )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.clicks MouseMsg
        , Keyboard.presses KeyMsg
        ]

-- MAIN

main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
         , subscriptions = subscriptions
        }
