*** Settings ***
Documentation   A test suite with a single test for locked out login.
...             
...             
...             This test follows the example using keywords from the Selenium library
Library    SeleniumLibrary

*** Test Cases *** 

Locked Out Login
 #open browser 
    Open Browser    https://www.saucedemo.com/  chrome

    #set window size
    Maximize Browser Window

    #check if in login page
    Page Should Contain Element     login-button

    #input username
    Input Text      user-name   locked_out_user

    #input password 
    Input Password      password    secret_sauce

    #click log in button
    Click Button    login-button

    #should show error message
    Element Text Should Be      xpath: //*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Sorry, this user has been locked out.

     #close 
    [Teardown]      Close Browser