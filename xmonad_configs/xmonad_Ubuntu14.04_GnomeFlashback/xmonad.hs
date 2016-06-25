import XMonad
import XMonad.ManageHook
import XMonad.Config.Gnome

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

import XMonad.Util.EZConfig
import qualified XMonad.StackSet as S
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Combo
import XMonad.Layout.Grid
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowNavigation
import XMonad.Util.WindowProperties
import Control.Monad
import Data.Ratio



import qualified Data.Map as M

import XMonad.Layout.IM
import Data.Ratio ((%))

import XMonad.Util.EZConfig
import qualified XMonad.StackSet as S
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Combo
import XMonad.Layout.Grid
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowNavigation
import XMonad.Util.WindowProperties
import Control.Monad
import Data.Ratio
import qualified Data.Map as M

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import qualified XMonad.StackSet as W

-- For resolving bug with taking focus
import XMonad.Hooks.ICCCMFocus

-- import XMonad
-- import XMonad.Config.Gnome

 
myManageHook = composeAll [ 
  manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Do" --> doFloat
  ]

 
main = xmonad $ gnomeConfig 
  { 
    borderWidth = borderWidth',
    manageHook = myManageHook,
    -- 'startupHook gnomeConfig >> XXX' is needed to fix the time when Xmonad is starting with Gnome 3 gnome-session
    startupHook = startupHook gnomeConfig >> setWMName "LG3D",
    layoutHook = avoidStruts $ 
                 smartBorders $ 
                 mkToggle(single FULL) $
                 myLayouts,
    logHook    = takeTopFocus >> setWMName "LG3D"
  } `additionalKeys`
    [ 
      -- Alt+~ -- Maximize/unmaximize current window
      ((mod1Mask, xK_grave), sendMessage $ Toggle FULL)
--      ((mod1Mask, xK_Print), takeTopFocus >> setWMName "LG3D")

    ]



myLayouts =  tiled ||| Mirror tiled ||| fullWithIM ||| gridWithIM
  where
     tiled   = withIM (1%8) rosters (Tall nmaster delta ratio)
     fullWithIM = withIM (1%8) rosters Full
     gridWithIM = withIM (1%8) rosters Grid
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100
     --rosters = ( ( (ClassName "Pidgin") `And` (Role "buddy_list") ) `Or` (  (ClassName "Skype") `And` (Role "MainWindow")  )  )
     --rosters = ( ( (ClassName "Pidgin") `And` (Role "buddy_list") ) `Or` (  (ClassName "Skype") `And` (Role "MainWindow")  )  )
     rosters = ( ( (ClassName "Pidgin") `And` (Role "buddy_list") ) `Or` ( ClassName "Skype")  )
     -- rosters = (ClassName "Skype")

-- borders
borderWidth' :: Dimension
borderWidth' = 2



