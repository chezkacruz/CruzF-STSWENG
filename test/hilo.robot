*** Settings ***
Documentation   A test suite with a single test for Sort Product Price High to Low
...             
...             
...             This test follows the example using keywords from the Selenium library
Library    SeleniumLibrary
Library    Collections


*** Variables ***
@{TEMP LIST}
  ...  $49.99
  ...  $29.99
  ...  $15.99
  ...  $15.99
  ...  $9.99
  ...  $7.99
  
*** Test Cases *** 

Sort Product Price High to Low

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

    # SELECT lohi
    Select From List By Value  class:product_sort_container  hilo

    ${i}=  Set Variable  0
    ${my_list}=  Get WebElements  class:inventory_item_price
    FOR  ${element}  IN  @{my_list}
        ${temp}=  Get From List   ${TEMP LIST}   ${i}
        Should Be Equal   ${element.text}   ${temp}
        ${i}=   Evaluate   ${i}+1
    END

    #close 
    [Teardown]      Close Browser