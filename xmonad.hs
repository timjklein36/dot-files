import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.Themes
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import System.IO

main = xmonad $ ewmh defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
	, layoutHook = myLayoutHook
	, manageHook = myManageHook
	, handleEventHook = handleEventHook def <+> XMonad.Hooks.EwmhDesktops.fullscreenEventHook
	, workspaces = myWorkspaces
    }
	`additionalKeysP`
	[ ("M-g", spawn "google-chrome-stable")
	, ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
	, ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
	, ("<XF86AudioMute>", spawn "amixer set Master toggle")
	, ("<XF86Sleep>", spawn "slock")
	, ("M-r", spawn "rofi -show run")
	--, (	,	)
	]

myTerminal = "urxvt"

myModMask = mod4Mask

myBorderWidth = 0

myLayoutHook = gaps [(U,35),(D,10),(L,10),(R,10)] $ spacing 10 $ Tall 1 (2/100) (1/2)
				||| Full

myManageHook = composeAll 
	[ isFullscreen				--> doFullFloat
	, className =? "Thunar"			--> doCenterFloat
	, className =? "Orage"			--> doFloat
	, className =? "feh"			--> doCenterFloat
	, className =? "gimp"			--> doFloat
	, manageDocks
	]

myWorkspaces = ["Code","Web","Game","Write"]
