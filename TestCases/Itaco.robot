*** Settings ***
Documentation     Toda la documentacion de los keywords esta aqui  https://robotframework.org/Selenium2Library/Selenium2Library.html
Library     Selenium2Library
Library     Dialogs


*** Variable ***
#Datos para la configuracion de robotframework
${ScreenshotFile}       ../Screenshot/Itaco
${url}      http://45.173.197.126/Itaco/web/#/login
${browser}      chrome

#Datos De la primera prueba de registro exitoso ///////// CAMBIAR AUMENTAR EL ULTIMO NUMERO DE LOS DATOS GUARDADOS EN LAS VARIABLES VALORES CADA VEZ QUE SE CORRA LA PRUEBA//////
${RUTEmpresa}       32112321-01
${RazonSocial/empresa}      Empresa demo 01
${DireccionEmpresa}     Direccion Demo 01
${emailEmpresa}        Empresa@mail.com01
${NombreRepresentanteLegal}     Encargado01
${RUTRepresentante}      22215421301
${NombreFantasiaRepresentante}      Fantasia Name01
${TelefonoEmpresa}      02431254620
${NumeroCuentaBanco}      01081230000654120
${NombreResponsableRegistro}        Responsable01
${RutResponsableRegistro}       78031200021
${EmailResponsableRegistro}     correoresponsable@mail.com01
${TlfResponsableRegistro}       041256412301

#Datos para la segunda prueba de guardar sin completar y posteriormente seguir el registro///////// CAMBIAR AUMENTAR EL ULTIMO NUMERO DE LOS DATOS GUARDADOS EN LAS VARIABLES VALORES CADA VEZ QUE SE CORRA LA PRUEBA//////
${RUTEmpresa02}       32112321-03
${RazonSocial/empresa02}      Empresa demo 03
${DireccionEmpresa02}     Direccion Demo 03
${emailEmpresa02}        Empresa@mail.com03
${NombreRepresentanteLegal02}     Encargado03
${RUTRepresentante02}      22215421303
${NombreFantasiaRepresentante02}      Fantasia Name03
${TelefonoEmpresa02}      02431254623
${NumeroCuentaBanco02}      01081230000654123
${NombreResponsableRegistro02}        Responsable03
${RutResponsableRegistro02}       78031200021
${EmailResponsableRegistro02}     correoresponsable@mail.com03
${TlfResponsableRegistro02}       041256412303

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
##### Pantalla login, acceder a registro e ingresar un rut que no estuvo previamente registrado #####
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa}
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER

##### acceso a la pantalla de datos generales #########
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=3s
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       ${RazonSocial/empresa}
    Input Text      name=address     ${DireccionEmpresa}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${emailEmpresa}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${NombreRepresentanteLegal}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       ${RUTRepresentante}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[8]/div/input       ${NombreFantasiaRepresentante}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[9]/div/input       ${TelefonoEmpresa}
#########Se ingresara un Keyword para determinar la cantidad de opciones en el select de banco; Nombres, Values y cantidad de items

    ${nombresBancos}       Get List Items      name=bank_id
    ${ValuesBancos}     Get List Items      name=bank_id        values=True
    ${CantidadBancos}       Get Element Count        name=bank_id
    Log To Console      ${nombresBancos},${ValuesBancos},${CantidadBancos}

###### Listado obtenido del log del select############
    #Banco Bice // Value= 7
    #Banco Bilbao Vizcaya Argentaria, Chile // Value= 18
    #Banco Consorcio // Value= 15
    #Banco de Chile // Value= 2
    #Banco de Cr??dito e Inversiones // Value= 5
    #Banco Falabella // Value= 11
    #Banco Internacional // Value= 3
    #Banco Ita?? Chile // Value= 9
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

#### Seccion de carga de documentos, en este punto el QA debera registrar todas los archivos de los campos ###################
    Execute Manual Step     Has Click fuera de esta alerta e Ingresa los archivos de cada campo solicitado de forma manual, Ingresar varios formatos (WORD, EXCEL, PDF e IMAGENES) una vez culmano pulsa el boton PASS para continuar

###### Clickear check de terminos y condiciones primero confirmando que se escuentra activo y no esta seleccionado con anterioridad, al igual que verificar si redirecciona bien a la pantalla de terminos y condiciones ########
    Select Checkbox       xpath=//*[@id="checkbox-checkboxundefined"]
    Click Link      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[2]/div/label/a
    Wait Until Element is visible       xpath=//*[@id="terms"]/div/button       timeout=3s
    Double Click Element        xpath=//*[@id="terms"]/div/button
    Wait Until Element is Not Visible       xpath=/html/body/div[3]/div/div/div[2]
    Sleep       2s
    Click Button        xpath=/html/body/div/div/div/div[2]/form/div[2]/div[3]/button
    Sleep       3s

####### PAntalla de Revision de documentos donde se envio satisfactoriamente la informacion y luego pulsar aceptar para salir #########
    Wait Until Element is Visible       xpath=//*[@id="register"]/div/div[2]/form/div/div/div[1]/img        timeout=3s
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div/div/div[1]/p   Sus datos est??n en revisi??n. Recibir?? un correo al momento de ser aprobados        ignore_case=true
    Assign Id To Element        xpath=//*[@id="register"]/div/div[2]        RegistroExitoso
    Capture Element Screenshot      RegistroExitoso     filename=RegistroExitoso-Prueba{index}.png
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div/div/div[2]/button

PSG-M-01-C1 Llenar formulario a medias, pulsar boton guardar y luego retomarlo para continuar y procesarlo
    [Tags]      Funcional       Caso001     Parte002
######  Ingresar a registro de usuario e ingresar un RUT INEXISTENTE EN LA BD ##########
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa02}
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER

#### Seleccion de datos generales, se llenan varios campos posterior se procedera a guardar para salir del proceso y luego nuevamente entrar, se repetira el procedimiento 3 veces en el trascurso del llenao del formulario####
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=3s
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       ${RazonSocial/empresa02}
    Input Text      name=address     ${DireccionEmpresa02}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${emailEmpresa02}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${NombreRepresentanteLegal02}
    Sleep       3s
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div[2]/div[2]/button
    Wait Until Element Is Visible       xpath=/html/body/div[2]/div/div[1]/div[3]       timeout=2s
    Double Click Element        xpath=/html/body/div[2]/div/div[3]/button[1]
    Wait Until Element Is Visible       xpath=/html/body/div[2]/div/div[1]/div[5]/div[2]        timeout=3s
    Capture Element Screenshot      xpath=/html/body/div[2]     Filename=aceptar_guardar_datos_Generales-Prueba{index}
    Double Click Element        xpath=/html/body/div[2]/div/div[3]/button[1]
    Sleep       4s
    Go Back

#### Volver a ingresar con los datos del usaurio con la informacion guardada #####
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa02}
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=5s
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       ${RazonSocial/empresa02}
    Element Should Contain      name=address     ${DireccionEmpresa02}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${emailEmpresa02}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${NombreRepresentanteLegal02}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       ${RUTRepresentante02}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[8]/div/input       ${NombreFantasiaRepresentante02}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[9]/div/input       ${TelefonoEmpresa02}
    Select From List By Value       bank_id     10
    Assign Id To Element        class=container-form        Contenedor-Form
    Capture Element Screenshot     Contenedor-Form     filename=Contenedor-Form-{index}.png
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[12]/div/input      ${NumeroCuentaBanco}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[14]/div/input      ${NombreResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[15]/div/input      ${RutResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[16]/div/input      ${EmailResponsableRegistro}
    Input Text      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[17]/div/input      ${TlfResponsableRegistro}
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div[2]/div[3]/button
    Execute Manual Step     Has Click fuera de esta alerta e Ingresa los archivos de cada campo solicitado de forma manual, Ingresar varios formatos (WORD, EXCEL, PDF e IMAGENES) una vez culmano pulsa el boton PASS para continuar
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div[2]/div[2]/button
    Wait Until Element Is Visible       xpath=/html/body/div[2]/div/div[1]/div[3]       timeout=3s
    Capture Element Screenshot      xpath=/html/body/div[2]     Filename=aceptar_guardar_Documentos/archivos-Prueba{index}
    Double Click Element        xpath=/html/body/div[2]/div/div[3]/button[1]
    Go to

###### VOLVER A INGRESAR LOS DATOS POR TERCERA VEZ LUEGO DE GUARDAR #############
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div        timeout=5s
    Click Link      xpath=//*[@id="login"]/div/form/div[2]/div[5]/a
    Wait Until Element Is Visible       xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input        timeout=5s
    Input Text     xpath=/html/body/div/div/div/div[2]/form[1]/div/div[1]/div/input     ${RUTEmpresa02}
    Sleep       3s
    Press Keys       xpath=//*[@id="register"]/div/div[2]/form[1]/div/div[2]/div/div[2]/button        ENTER
    Wait Until Element Is Visible     xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input      timeout=5s
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[3]/div/input       ${RazonSocial/empresa02}
    Element Should Contain      name=address     ${DireccionEmpresa02}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[5]/div/input       ${emailEmpresa02}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[6]/div/input       ${NombreRepresentanteLegal02}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[7]/div/input       ${RUTRepresentante02}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[8]/div/input       ${NombreFantasiaRepresentante02}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[9]/div/input       ${TelefonoEmpresa02}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[12]/div/input      ${NumeroCuentaBanco}
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[14]/div/input      ${NombreResponsableRegistro}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[15]/div/input      ${RutResponsableRegistro}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[16]/div/input      ${EmailResponsableRegistro}
    Element Should Contain       xpath=//*[@id="register"]/div/div[2]/form/div[1]/div[17]/div/input      ${TlfResponsableRegistro}
    Element Should Contain        xpath=//*[@id="register"]/div/div[2]/form/div[2]/div[3]/button
    Checkbox Should Not Be Selected     xpath=/html/body/div/div/div/div[2]/form/div[1]/div[2]/div/input
    Select Checkbox       xpath=//*[@id="checkbox-checkboxundefined"]
    Sleep       2s
    Click Button        xpath=/html/body/div/div/div/div[2]/form/div[2]/div[3]/button
    Wait Until Element is Visible       xpath=//*[@id="register"]/div/div[2]/form/div/div/div[1]/img        timeout=3s
    Element Should Contain      xpath=//*[@id="register"]/div/div[2]/form/div/div/div[1]/p   Sus datos est??n en revisi??n. Recibir?? un correo al momento de ser aprobados        ignore_case=true
    Assign Id To Element        xpath=//*[@id="register"]/div/div[2]        RegistroRecuperadoExitoso
    Capture Element Screenshot      RegistroRecuperadoExitoso     filename=RegistroRecuperadoExitoso-Prueba{index}.png
    Click Button        xpath=//*[@id="register"]/div/div[2]/form/div/div/div[2]/button
    
    Cerrar Navegador
