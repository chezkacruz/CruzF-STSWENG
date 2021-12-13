*** Settings ***
Documentation   A test suite with a single test for invalid username and password login.
...             
...             
...             This test follows the example using keywords from the Selenium library
Library    SeleniumLibrary

*** Test Cases *** 

Wrong Password Login
 #open browser 
    Open Browser    https://www.saucedemo.com/  chrome

    #set window size
    Maximize Browser Window

    #check if in login page
    Page Should Contain Element     login-button

    #input username
    Input Text      user-name   standard_user

    #input password 
    Input Password      password    meow

    #click log in button
    Click Button    login-button

    #should show error message
    Element Text Should Be      xpath: //*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Username and password do not match any user in this service

     #close 
    [Teardown]      Close Browser