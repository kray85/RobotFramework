import toml
import SeleniumLibrary
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class LoginPage():
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.config_path = "config.toml"

    @keyword
    def get_input_values(self,radio_buttons_el):
        radio_buttons = self.selLib.get_webelements(
            radio_buttons_el)
       
        values = [element.get_attribute('value') for element in radio_buttons]
        return values

    @keyword(name="Get User From Config")
    def get_user_from_config(self, section, key):
        # Load the TOML file
        with open(self.config_path, "r") as file:
            config = toml.load(file)

        # Get the value from the specified section and key
        value = config[section][key]
        return value
    