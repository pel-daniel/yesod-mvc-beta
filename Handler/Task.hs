module Handler.Task where

import Import

getTaskR :: TaskId -> Handler Html
getTaskR taskId =
    do
        task <- runDB $ get404 taskId
        defaultLayout $(widgetFile "task")
