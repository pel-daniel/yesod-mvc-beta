module Handler.Home where

import Import

getHomeR :: Handler Html
getHomeR =
    do
        tasks <- runDB $ selectList [] [Asc TaskId]
        defaultLayout $(widgetFile "homepage")
