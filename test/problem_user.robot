*** Settings ***
Documentation   A test suite with a single test for problem user login.
...             
...             
...             This test follows the example using keywords from the Selenium library
Library    SeleniumLibrary

*** Test Cases *** 

Problem User Login
 #open browser 
    Open Browser    https://www.saucedemo.com/  chrome

    #set window size
    Maximize Browser Window

    #check if in login page
    Page Should Contain Element     login-button

    #input username
    Input Text      user-name   problem_user

    #input password 
    Input Password      password    secret_sauce

    #click log in button
    Click Button    login-button

    # should show mistake in product name 
    Page Should Contain     Products

    #click product 
    Click Element   item_4_title_link   

    #open new page 
    Element Text Should Not Be      xpath: //*[@id="inventory_item_container"]/div/div/div[2]/div[1]    Sauce Labs Backpack

      #close 
    [Teardown]      Close Browser