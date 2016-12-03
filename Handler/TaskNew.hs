module Handler.TaskNew where

import Import
import Yesod.Form.Bootstrap3


taskForm :: AForm Handler Task
taskForm =
    Task
        <$> areq textField "Description: " Nothing
        <*> areq boolField "Complete: " (Just False)


getTaskNewR :: Handler Html
getTaskNewR =
    do
        (widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm taskForm
        defaultLayout $(widgetFile "tasks/new")


postTaskNewR :: Handler Html
postTaskNewR =
    do
        ((res, widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm taskForm
        case res of
            FormSuccess task ->
                do
                    taskId <- runDB $ insert task
                    redirect $ TaskR taskId

            _ ->
                defaultLayout $(widgetFile "tasks/new")
