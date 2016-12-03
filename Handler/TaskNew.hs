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
