import XMonad
import XMonad.Config.Xfce
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiColumns
import XMonad.Layout.Maximize
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

myTerminal = "xfce4-terminal"

mySpacing = smartSpacingWithEdge 5
tall =  mySpacing $ ResizableTall 1 (3/100) (1/2) []
multiColumn = mySpacing $ multiCol [1] 1 0.01 (-0.5)

myLayouts = avoidStruts $ maximizeWithPadding 0 $ tall ||| multiColumn

myKeys = [ ("M-a", sendMessage MirrorExpand)
         , ("M-z", sendMessage MirrorShrink)
         , ("M-p", spawn "xfce4-appfinder")
         , ("M-f", spawn "firefox")
         , ("M-<Page_Up>", prevWS)
         , ("M-<Page_Down>", nextWS)
         , ("M-\\", withFocused (sendMessage . maximizeRestore))
         ]

myManageHook = composeAll
  [ className =? "Xfce4-appfinder" --> doCenterFloat
  , className =? "Xfce4-panel" --> doIgnore
  , isDialog --> doCenterFloat
  ]

main = xmonad $ xfceConfig
  { terminal = myTerminal
  , modMask = mod4Mask
  , layoutHook = myLayouts
  , manageHook = myManageHook
  , borderWidth = 0
  } `additionalKeysP` myKeys
