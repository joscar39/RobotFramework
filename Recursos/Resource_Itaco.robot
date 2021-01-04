*** Settings ***
Library     Selenium2Library

*** Variables ***


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***


Ingresar Rut Empresa
    [Arguments]        ${RUTEmpresa}
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa}

Ingresar Email
    [Arguments]     ${email}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${email}

Ingresar nombre
    [Arguments]     ${name}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${name}

Ingresar Cedula
    [Arguments]     ${RUT}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       ${RUT}