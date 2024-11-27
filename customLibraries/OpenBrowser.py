import os

from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.service import Service


class OpenBrowser:
    def __init__(self):
        base_dir = os.path.dirname(os.path.abspath(__file__))
        drivers_dir = os.path.join(base_dir, '..', 'drivers')
        self.chrome_driver_path = os.path.join(drivers_dir, 'chromedriver.exe')
        self.firefox_driver_path = os.path.join(drivers_dir, 'geckodriver.exe')
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


