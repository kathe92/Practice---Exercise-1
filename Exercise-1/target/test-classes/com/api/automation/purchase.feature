Feature: Purchase Flow
  I want to buy some items in https://www.saucedemo.com/
  
  Background:
    * configure driver = { type: 'chrome' }

  Scenario: I want to buy some items in the webpage
    Given driver 'https://www.saucedemo.com/'
    #Adding the username and password
    And input("//input[@name='user-name']", 'standard_user')
    And input("//input[@name='password']", 'secret_sauce')
    #Click to login session
    And click('input[name=login-button]')
    #Search the elements for adding in the cart
    And click('button[name=add-to-cart-sauce-labs-onesie]')
    And click("//button[@data-test='add-to-cart-test.allthethings()-t-shirt-(red)']")
    #Click in the cart for checkout
    When click("//a[@class='shopping_cart_link']")
    And click("//button[@id='checkout']")
    #Add the information of the checkout
    And input("//input[@data-test='firstName']", 'Katherine')
    And input("//input[@data-test='lastName']", 'Perez')
    And input("//input[@data-test='postalCode']", '505')
    And click("//input[@id='continue']")
    Then waitFor('.summary_info_label')
    #Finishing the checkout
    And click("//button[@id='finish']")
    #Validate that checkout is ok
    And waitFor("//h2[contains(text(),'THANK YOU FOR YOUR ORDER')]")
    
    