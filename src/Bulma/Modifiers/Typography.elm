
module Bulma.Modifiers.Typography exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO

# Transformations
@docs capitalize, uppercase, lowercase, italicize

# Size
@docs Display
@docs textSize, textSizeByDevice

# Weight
@docs TextWeight
@docs textWeight

# Colors
@docs TextColor
@docs textColor

# Alignment
@docs textLeft, textCentered, textRight, textJustified
@docs textAlignment, textAlignmentByDevice

-}

-- IMPORTS ---------------------------------------------------------------------

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( Devices, HorizontalAlignment(..) )

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )

import String exposing ( join )

-- TEXT TRANSFORMATIONS --------------------------------------------------------

{-| Transforms the first character to each word to uppercase.
-}
capitalize : Attribute msg
capitalize = class "is-capitalized"
-- KLUDGE: add to BulmaClasses

{-| Transforms all characters to lowercase.
-}
lowercase : Attribute msg
lowercase = class "is-lowercase"
-- KLUDGE: add to BulmaClasses

{-| Transforms all characters to uppercase.
-}
uppercase : Attribute msg
uppercase = class "is-uppercase"
-- KLUDGE: add to BulmaClasses

{-| Italicizes text.
-}
italicize : Attribute msg
italicize = class "is-italic"
-- KLUDGE: add to BulmaClasses


-- TEXT SIZE -------------------------------------------------------------------

{-| There are 7 font sizes to choose from:
- `textSize 1`: 3.00rem
- `textSize 2`: 2.50rem
- `textSize 3`: 2.00rem
- `textSize 4`: 1.50rem
- `textSize 5`: 1.25rem
- `textSize 6`: 1.00rem
- `textSize 7`: 0.75rem
-}
textSize : Int -> Attribute msg
textSize ts
  = class
    <| case clamp 1 7 ts of
        1 -> "is-size-1"
        2 -> "is-size-2"
        3 -> "is-size-3"
        4 -> "is-size-4"
        5 -> "is-size-5"
        6 -> "is-size-6"
        7 -> "is-size-7"
        _ -> ""
        -- KLUDGE: add to BulmaClasses

{-| You can choose a font specific size for each viewport width.
-}
textSizeByDevice : Devices Int -> Attribute msg
textSizeByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case clamp 1 7 mobile of
        1 -> "is-size-1-mobile"
        2 -> "is-size-2-mobile"
        3 -> "is-size-3-mobile"
        4 -> "is-size-4-mobile"
        5 -> "is-size-5-mobile"
        6 -> "is-size-6-mobile"
        7 -> "is-size-7-mobile"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 tablet of
        1 -> "is-size-1-tablet"
        2 -> "is-size-2-tablet"
        3 -> "is-size-3-tablet"
        4 -> "is-size-4-tablet"
        5 -> "is-size-5-tablet"
        6 -> "is-size-6-tablet"
        7 -> "is-size-7-tablet"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 desktop of
        1 -> "is-size-1-desktop"
        2 -> "is-size-2-desktop"
        3 -> "is-size-3-desktop"
        4 -> "is-size-4-desktop"
        5 -> "is-size-5-desktop"
        6 -> "is-size-6-desktop"
        7 -> "is-size-7-desktop"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 widescreen of
        1 -> "is-size-1-widescreen"
        2 -> "is-size-2-widescreen"
        3 -> "is-size-3-widescreen"
        4 -> "is-size-4-widescreen"
        5 -> "is-size-5-widescreen"
        6 -> "is-size-6-widescreen"
        7 -> "is-size-7-widescreen"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 fullHD of
        1 -> "is-size-1-fullhd"
        2 -> "is-size-2-fullhd"
        3 -> "is-size-3-fullhd"
        4 -> "is-size-4-fullhd"
        5 -> "is-size-5-fullhd"
        6 -> "is-size-6-fullhd"
        7 -> "is-size-7-fullhd"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    ]


-- TEXT ALIGNMENT --------------------------------------------------------------

{-| Aligns text to the left.
-}
textLeft : Attribute msg
textLeft = class bulma.properties.alignment.hasTextLeft

{-| Aligns text to the right.
-}
textCentered : Attribute msg
textCentered = class bulma.properties.alignment.hasTextCentered

{-| Centers text.
-}
textRight : Attribute msg
textRight = class bulma.properties.alignment.hasTextRight

{-| Justifies text.
-}
textJustified : Attribute msg
textJustified = class "has-text-justified"

{-| Aligns text.
-}
textAlignment : HorizontalAlignment -> Attribute msg
textAlignment alignment
  = case alignment of
        Left     -> textLeft
        Centered -> textCentered
        Right    -> textRight

{-| Aligns text based on a device's viewport width.
-}
textAlignmentByDevice : Devices HorizontalAlignment -> Attribute msg
textAlignmentByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case mobile of
        Left     -> "has-text-left-mobile"
        Centered -> "has-text-centered-mobile"
        Right    -> "has-text-right-mobile"
        -- KLUDGE: add to BulmaClasses
    , case tablet of
        Left     -> "has-text-left-tablet-only"
        Centered -> "has-text-centered-tablet-only"
        Right    -> "has-text-right-tablet-only"
        -- KLUDGE: add to BulmaClasses
    , case desktop of
        Left     -> "has-text-left-desktop-only"
        Centered -> "has-text-centered-desktop-only"
        Right    -> "has-text-right-desktop-only"
        -- KLUDGE: add to BulmaClasses
    , case widescreen of
        Left     -> "has-text-left-widescreen-only"
        Centered -> "has-text-centered-widescreen-only"
        Right    -> "has-text-right-widescreen-only"
        -- KLUDGE: add to BulmaClasses
    , case fullHD of
        Left     -> "has-text-left-fullHD"
        Centered -> "has-text-centered-fullHD"
        Right    -> "has-text-right-fullHD"
        -- KLUDGE: add to BulmaClasses
    ]


-- TEXT WEIGHT -----------------------------------------------------------------

{-| -}
type TextWeight
  = Light
  | Normal
  | Semibold
  | Bold

{-| You can set any text to one of four font-weights.
-}
textWeight : TextWeight -> Attribute msg
textWeight weight
  = class
  <| case weight of
      Light    -> "has-text-weight-light"
      Normal   -> "has-text-weight-normal"
      Semibold -> "has-text-weight-semibold"
      Bold     -> "has-text-weight-bold"


-- TEXT COLOR ------------------------------------------------------------------

{-| -}
type TextColor
  = Black
  | BlackLight
  | BlackLighter
  | GreyDarker
  | GreyDark
  | Grey
  | GreyLight
  | GreyLighter
  | WhiteDarker
  | WhiteDark
  | White
  | Primary
  | Info
  | Success
  | Warning
  | Danger

{-| You can set any text to one of the 5 colors or 11 shades of grey.
-}
textColor : TextColor -> Attribute msg
textColor color
  = class
  <| case color of
      Black        -> "has-text-black"
      BlackLight   -> "has-text-black-bis"
      BlackLighter -> "has-text-black-ter"
      GreyDarker   -> "has-text-grey-darker"
      GreyDark     -> "has-text-grey-dark"
      Grey         -> "has-text-grey"
      GreyLight    -> "has-text-grey-light"
      GreyLighter  -> "has-text-grey-lighter"
      WhiteDarker  -> "has-text-white-bis"
      WhiteDark    -> "has-text-white-ter"
      White        -> "has-text-white"
      Primary      -> "has-text-primary"
      Info         -> "has-text-info"
      Success      -> "has-text-success"
      Warning      -> "has-text-warning"
      Danger       -> "has-text-danger"