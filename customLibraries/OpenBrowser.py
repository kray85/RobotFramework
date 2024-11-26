from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.service import Service


class OpenBrowser:
    def __init__(self, driver_path='D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe'):
        self.driver_path = driver_path
        self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')

    def open_page(self, url):
        service = Service(executable_path=self.driver_path)
        self.selLib.open_browser(url, browser='chrome', service=service)


    def close_the_browser(self):
        self.selLib.close_browser()