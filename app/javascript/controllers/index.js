// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import GlobalController from "./global_controller"
application.register("global", GlobalController)

import ClipboardCenterController from "./clipboard_center_controller"
application.register("clipboard-center", ClipboardCenterController)

import ReleaseDownloadController from "./release_download_controller"
application.register("release-download", ReleaseDownloadController)

import DisplayController from "./display_controller"
application.register("display", DisplayController)

import DestroyController from "./destroy_controller"
application.register("destroy", DestroyController)

import "./admin"
