from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.service import Service


class OpenBrowser:
    def __init__(self):
        self.chrome_driver_path = 'D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe'
        self.firefox_driver_path = 'D:/source/PythonProject/RobotFramework/drivers/geckodriver.exe'
        # self.driver_path = driver_path
        self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')

    def open_page(self, url, browser_name):
        if browser_name.lower() == 'chrome':
            service = Service(executable_path=self.chrome_driver_path)
        elif browser_name.lower() == 'firefox':
            service = Service(executable_path=self.firefox_driver_path)
        else:
            raise ValueError(f"Unsupported browser: {browser_name}")

        self.selLib.create_webdriver(browser_name, service=service)
        self.selLib.go_to(url)

    def close_the_browser(self):
        self.selLib.close_browser()


