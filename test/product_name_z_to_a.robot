*** Settings ***
Documentation   A test suite with a single test for Sort Product Name Z to A
...             
...             
...             This test follows the example using keywords from the Selenium library
Library    SeleniumLibrary
Library    Collections


*** Variables ***
@{TEMP LIST}
  ...  Test.allTheThings() T-Shirt (Red)
  ...  Sauce Labs Onesie
  ...  Sauce Labs Fleece Jacket
  ...  Sauce Labs Bolt T-Shirt
  ...  Sauce Labs Bike Light
  ...  Sauce Labs Backpack
  
*** Test Cases *** 

Sort Product Name Z to A

    #open browser 
    Open Browser    https://www.saucedemo.com/  chrome

    #set window size
    Maximize Browser Window

    #check if in login page
    Page Should Contain Element     login-button

    #input username
    Input Text      user-name   standard_user

    #input password 
    Input Password      password    secret_sauce

    #click log in button
    Click Button    login-button

    #should open in product page
    Element Text Should Be      class:title     PRODUCTS

    # SELECT za
    Select From List By Value  class:product_sort_container  za

    #move to list 
    ${i}=  Set Variable  0

    #compare
    ${i}=  Set Variable  0
    ${weblist}=  Get WebElements  class:inventory_item_name
    FOR  ${element}  IN  @{weblist}
      ${cur}=  Get From List   ${TEMP LIST}   ${i}
      Should Be Equal   ${element.text}   ${cur}
      ${i}=   Evaluate   ${i}+1
    END
    
    #close 
    [Teardown]      Close Browser