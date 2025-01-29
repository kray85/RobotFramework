import SeleniumLibrary
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class LoginPage():
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def get_input_values(self,radio_buttons_el):
        radio_buttons = self.selLib.get_webelements(
            radio_buttons_el)
       
        values = [element.get_attribute('value') for element in radio_buttons]
        return values

