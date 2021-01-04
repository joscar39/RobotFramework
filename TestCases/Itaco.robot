*** Settings ***
Documentation     Toda la documentacion de los keywords esta aqui  https://robotframework.org/Selenium2Library/Selenium2Library.html
Library     Selenium2Library


*** Variable ***
${ScreenshotFile}       ../Screenshot/Itaco
${url}      http://45.173.197.126/Itaco/web/#/login
${browser}      chrome
${RUTEmpresa}       32112321-00
${RazonSocial/empresa}      Empresa demo 01
${DireccionEmpresa}     Direccion Demo 01
${emailEmpresa}        Empresa@mail.com01
${NombreRepresentanteLegar}     Encargado01
${RUTRepresentante}      22215421301
${NombreFantasiaRepresentante}      Fantasia Name01
${TelefonoEmpresa}      02431254620
${NumeroCuentaBanco}      01081230000654120
${NombreResponsableRegistro}        Responsable01
${RutResponsableRegistro}       78031200021
${EmailResponsableRegistro}     correoresponsable@mail.com01
${TlfResponsableRegistro}       041256412301


*** Keywords ***

Abrir Navegador
    Open Browser        ${url}     ${browser}

Configurar Directorio
    Set Screenshot Directory        ${ScreenshotFile}

Cerrar Navegador
    Close Browser

*** Test Cases ***
Precondition
    [Tags]      Funcional       Exploratoria
    Abrir Navegador
    Configurar Directorio

#Casos de prueba Modulo Registro PSG-M-01 Validar DAtos de Entrada y salida

PSG-M-01-C1 Registro Exitoso
    [Tags]    Funcional     Caso001     Parte001
    #Pantalla login, acceder a registro e ingresar un rut que no estuvo previamente registrado
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa}
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER

    #acceso a la pantalla de datos generales
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=9s
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       ${RazonSocial/empresa}
    Input Text      name=address     ${DireccionEmpresa}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${emailEmpresa}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${NombreRepresentanteLegar}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       ${RUTRepresentante}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[8]/div/input       ${NombreFantasiaRepresentante}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[9]/div/input       ${TelefonoEmpresa}
    #Se ingresara un Keyword para determinar la cantidad de opciones en el select de banco; Nombres, Values y cantidad de items

    ${nombresBancos}       Get List Items      name=bank_id
    ${ValuesBancos}     Get List Items      name=bank_id        values=True
    ${CantidadBancos}       Get Element Count        name=bank_id
    Log To Console      ${nombresBancos},${ValuesBancos},${CantidadBancos}
    #Listado obtenido del log del select
    #Banco Bice // Value= 7
    #Banco Bilbao Vizcaya Argentaria, Chile // Value= 18
    #Banco Consorcio // Value= 15
    #Banco de Chile // Value= 2
    #Banco de Crédito e Inversiones // Value= 5
    #Banco Falabella // Value= 11
    #Banco Internacional // Value= 3
    #Banco Itaú Chile // Value= 9
    #Banco Paris // Value= 17
    #Banco Penta // Value= 16
    #Banco Ripley // Value= 13
    #Banco Santander-Chile // Value= 1
    #Banco Security // Value= 10
    #Corpbanca // Value= 6
    #Deutsche Bank (Chile) // Value= 12
    #HSBC Bank (Chile) // Value= 8
    #Rabobank Chile // Value=
    #Scotiabank Chile


    Select From List By Value       bank_id     10
    Assign Id To Element        class=container-form        Contenedor-Form
    Capture Element Screenshot     Contenedor-Form     filename=Contenedor-Form-{index}.png
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[12]/div/input      ${NumeroCuentaBanco}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[14]/div/input      ${NombreResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[15]/div/input      ${RutResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[16]/div/input      ${EmailResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[17]/div/input      ${TlfResponsableRegistro}
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div[2]/div[3]/button
    Sleep       3s
    Choose File     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[1]/div[1]/div/div/button       C:\\Users\Owner\Desktop\Imagenes de Prueba\Documentos de indentidad\cedula-beirut-2.jpg

PSG-M-01-C1 Llenar formulario a medias, pulsar boton guardar y luego retomarlo para continuar y procesarlo
    Cerrar Navegador
