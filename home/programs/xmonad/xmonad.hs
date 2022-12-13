import XMonad
import XMonad.Config.Xfce
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiColumns
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig (additionalKeysP)

myTerminal = "xfce4-terminal"

mySpacing = spacingRaw False (Border 0 28 0 0) True (Border 3 3 3 3) True
tall =  mySpacing $ ResizableTall 1 (3/100) (1/2) []
multiColumn = mySpacing $ multiCol [1] 1 0.01 (-0.5)

myLayouts = tall ||| Full

myKeys = [ ("M-a", sendMessage MirrorExpand)
         , ("M-z", sendMessage MirrorShrink)
         , ("M-p", spawn "xfce4-appfinder")
         , ("M-<Page_Up>", prevWS)
         , ("M-<Page_Down>", nextWS)
         ]

main = xmonad $ xfceConfig
  { terminal = myTerminal
  , modMask = mod4Mask
  , layoutHook = myLayouts
  } `additionalKeysP` myKeys

  