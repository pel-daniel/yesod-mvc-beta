module Handler.Task where

import Import

getTaskR :: Handler Html
getTaskR =
    defaultLayout $(widgetFile "task")
