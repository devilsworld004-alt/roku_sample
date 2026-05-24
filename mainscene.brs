sub init()
    m.top.backgroundUri = ""
    m.top.backgroundColor = "#000000"

    m.screenContainer = m.top.findNode("screenContainer")
    m.appBg = m.top.findNode("app_bg")
    m.toast = m.top.findNode("Toast")
    m.header = m.top.findNode("header")
    m.appLogo = m.top.findNode("appLogo")
    m.menu = m.top.findNode("menu")
    m.menu.observeField("selectedMenu", "onMenuSelected")
    m.global.addFields({ isMenuInFocus: false, isMoreOptionsInFocus: false})
    m.spinner = m.top.findNode("spinner")
    initBackStack()

    if checkInternetStatus()
        navigateToScreen("SplashScreen")
    else
        screenData = {
            content: "SplashScreen"
        }
        navigateToScreen("ErrorScreen", screenData)
    end if
end sub

sub makeConfigAPICall(msg as object)
    if msg.getData()
        clearBackStack()
        showSpinner()
        getAppConfig()
    end if
end sub
