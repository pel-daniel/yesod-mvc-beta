module Handler.Task where

import Import

import Database.Persist.Sql as Sql


getTaskR :: TaskId -> Handler Html
getTaskR taskId =
    defaultLayout $(widgetFile "task")
