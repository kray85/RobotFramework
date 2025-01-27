import os
import argparse

from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options


class OpenBrowser:
    def __init__(self, env=None):
        base_dir = os.path.dirname(os.path.abspath(__file__))
        drivers_dir = os.path.join(base_dir, '../', 'drivers')
        self.chrome_driver_path = os.path.join(drivers_dir, 'chromedriver.exe')
        self.firefox_driver_path = os.path.join(drivers_dir, 'geckodriver.exe')
        self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')

    def open_page(self, url, browser_name, env):
        # Set the path to the ChromeDriver executable based on the environment
        if env == 'windows':
            chrome_driver_path = self.chrome_driver_path
            options = None
        else:
            chrome_driver_path = r"/usr/bin/chromedriver"
            options = Options()
            options.add_argument('--headless')
            options.add_argument('--disable-dev-shm-usage')
            options.add_argument('--disable-gpu')

        if browser_name.lower() == 'chrome':
            if options is None:
                options = Options()
            service = Service(executable_path=chrome_driver_path)
            self.selLib.create_webdriver(
                browser_name, service=service, options=options)

        elif browser_name.lower() == 'firefox':
            service = Service(executable_path=self.firefox_driver_path)
            self.selLib.create_webdriver(browser_name, service=service)
        else:
            raise ValueError(f"Unsupported browser: {browser_name}")

        self.selLib.go_to(url)

    def close_the_browser(self):
        self.selLib.close_browser()
