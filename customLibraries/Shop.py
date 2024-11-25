from re import search

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop():

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    # Method converted to keyword
    @keyword
    def hello_world(self):
        print("Hello World")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        """
        Add passed items to the cart
        :param productsList:
        :return: selected items
        """
        # Get WebElements
        i = 1
        productsTitles = self.selLib.get_webelements("css:.card-title")

        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1
        self.selLib.click_link("css:li.active a")

    @keyword
    def validate_items_in_checkout_page_and_checkout(self, cartItemsList):
        """
           Validate items in the checkout page and proceed to checkout
           :param cartItemsList: List of items to validate
           """
        country_name = "ind"
        input_text_locator = "css:#country"
        web_elements_locator = "css:h4 a"
        button_locator = "css:.btn-success"
        search_name = "India"
        search_box_locator = f"//a[text()='{search_name}']"
        checkbox_locator = "css:.checkbox label"
        submit_button_locator = "//input[@type='submit']"
        success_message_locator = "Success!"

        # Wait for elements to be visible
        self.selLib.wait_until_element_is_visible(web_elements_locator)

        # Get WebElements
        cartItemTitles = self.selLib.get_webelements(web_elements_locator)

        # Print the elements to verify
        print("Found elements:", [element.text for element in cartItemTitles])

        for cartItemTitle in cartItemTitles:
            if cartItemTitle.text in cartItemsList:
                self.selLib.element_text_should_be(cartItemTitle, cartItemTitle.text)
                print(cartItemTitle.text + " is present in the cart")

        # Click on the button
        self.selLib.click_element(button_locator)
        # Input country name
        self.selLib.input_text(input_text_locator,  country_name)

        # Wait until the element is visible
        self.selLib.wait_until_element_is_visible(search_box_locator, timeout=10)

        # Click on the search item
        self.selLib.click_element(search_box_locator)

        # Click on the purchase button
        self.selLib.click_element(submit_button_locator)

        # Click on the checkbox
        self.selLib.wait_until_element_is_visible(checkbox_locator)

        # Verify success message
        self.selLib.page_should_contain(success_message_locator)

        print("Checkout successful!")
