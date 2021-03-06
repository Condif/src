module Main exposing (..)
import Browser
import Html exposing (Html, button, div, text, input)
import String exposing (fromInt)
import Html.Events exposing (onClick)

-- Elm arkitektur.
-- Vänta på user input med exempelvis onClick
-- Skicka ett Msg (meddelande) till update
-- Producera en ny model
-- Kalla view för att få en ny HTML
-- Visa nya HTML i domen
-- Återupprepa


-- MAIN, Visar det i domen genom...
-- Init som initiera applikationen
-- View som visar allt i domen
-- User inputs skickar till update funktionen
main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL Data modeling. Alla detaljer i applikationen som data
-- Sätter model till int och initierar model med numret 0.
type alias Model = Int

init : Model
init =
   0




-- VIEW, Skriver ut i domen.
-- Funktion som tar in Model som argument (data-detaljer, int i det här fallet)
-- Output är i HTML för att skriva ut i domen
-- view: Model -> Html Msg innebär att vi skickar view model = till update som msg typ alltså user-input typ


view : Model -> Html Msg
view model =
  div []
    [ div[] [text "Hej, fyll i ditt namn och lek med + och - samt reset!"]
    , div [] []
    , div [] [ input [] [] 
    , button [] [] ]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    , div [] []
    , button [ onClick Reset ] [ text "Reset" ]
    ]

-- UPDATE, beskriver hur vår model förändras beroende på vilka meddelanden den får.
-- update: Msg -> Model -> Model ->, Tar msg och uppdaterar model och visar ny model i domen

type Msg
  = Increment
  | Decrement
  | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Reset ->
       0



