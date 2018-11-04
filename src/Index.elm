module Main exposing (main)

import Browser
import Html exposing (..)
import Json.Decode as Decode
import Json.Helpers as JsonHelpers


type alias Model =
    ()


type alias Msg =
    ()


type alias Foo =
    { foo : Maybe Int }


view _ =
    let
        jsonDecFoo : Decode.Decoder Foo
        jsonDecFoo =
            Decode.succeed (\pfoo -> { foo = pfoo })
                |> JsonHelpers.fnullable "foo" Decode.int

        decodeResult =
            Decode.decodeString jsonDecFoo "{\"foo\": null}"
    in
    case decodeResult of
        Ok val ->
            text "ok"

        Err err ->
            text ("not ok: " ++ Decode.errorToString err)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = ()
        , view = view
        , update = \x y -> y
        }
