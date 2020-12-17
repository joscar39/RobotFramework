*** Settings ***
Documentation       https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library     Selenium2Library

*** Variable ***
${ScreenshotFile}       ItacoScreenshots
${url}      http://45.173.197.126/Itaco/web/#/login
${browser}      chrome

*** Keywords ***

Abrir Navegador
    Open Browser        ${url}     ${browser}

Configurar Directorio
    Set Screenshot Directory        ${ScreenshotFile}


*** Test Cases ***
Precondition
    [Tags]      Funcional       Exploratoria
    Abrir Navegador
    Configurar Directorio

Caso 001 Registro de Contratista
    [Tags]    Funcional
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     38600302-4
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=9s
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       Empresa demo
    Input Text      name=address     Direccion Demo
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       avillamarin@teamlimonbyte.com
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       Albanis
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       22231546
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[8]/div/input       alba
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[9]/div/input       04125463122
    Select From List By Label       bank_id     Banco Santander-Chile
    Assign Id To Element        class=container-form        Contenedor-Form
    Capture Element Screenshot     Contenedor-Form     filename=Contenedor-Form-{index}.png
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[12]/div/input


Cerrar navegador
    Close Browser
