*** Settings ***
Documentation    Ingresar a este link https://robotframework.org/Selenium2Library/Selenium2Library.html#Select%20From%20List%20By%20Value
Library     Selenium2Library

*** Variables ***

${DirectorioConfiguracionCapturas}      ../Screenshot/Reddit
${url}     https://www.reddit.com/
${browser}      gc

*** Keywords ***

Abrir Navegador
    Open Browser        ${url}     ${browser}

Configurar Directorio
    Set Screenshot Directory        ${DirectorioConfiguracionCapturas}

Cerrar Navegador
    Close Browser


*** Test Cases ***
Precondicion
    [Tags]      Exploratoria        Funcionalidad
    Configurar Directorio
    Abrir Navegador
    Sel


001 Verificar que la busqueda muestre resultados
    [Tags]    Exploratoria      Caso001
    Wait Until Element is visible     //*[@id="SHORTCUT_FOCUSABLE_DIV"]/div[1]/header/div/div[1]/a/svg[1]/g/circle      2s
    When action
    Then check expectations

    Cerrar Navegador