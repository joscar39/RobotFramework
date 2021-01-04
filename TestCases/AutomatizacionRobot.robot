*** Settings ***
Documentation       https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library     SeleniumLibrary

*** Variables ***
${CarpetasDeCaptura}        ../Screenshot/Demo


*** Keywords ***
Abrir Navegador
    Open Browser        http://winstoncastillo.com/ejercicios/atoc.html     chrome

Configurar Directorio
    Set Screenshot Directory        ${CarpetasDeCaptura}

Cerrar Navegador
    Close Browser

Espera
    Wait Until Element Is Visible       xpath=//*[@id='hero']        timeout=15s

*** Test Cases ***

Precondiciones
    [Tags]      Exploratoria        Funcional       Caso007
    Configurar Directorio
    Abrir Navegador
    ${VelocidadSelenium}=       Get Selenium Speed
    Log To Console       ${VelocidadSelenium}
    Set Selenium Speed      1s
    ${NuevaVelocidad}=      Get Selenium Speed
    Log To Console      ${NuevaVelocidad}

001 Manejar Alertas
    [Tags]      Funcional       Caso001
    Wait Until Element Is Visible       xpath=//*[@id='hero']        timeout=15s
    Click Button        xpath=/html/body/div/section[3]/p[1]/button
    Alert Should Be Present     text=Ejemplo de Alerta
    Alert Should Not Be Present

002 Asignar identificadores y hacer capturas de pantalla
    [Tags]      Exploratoria        Caso002
    Assign Id To Element        xpath=/html/body/div/section[3]        ContenedorCompleto
    Wait Until Element Is Visible       xpath=/html/body/div/section[3]        timeout=15s
    Capture Element Screenshot      ContenedorCompleto     filename=ContenedorCompleto-{index}.png
    Assign Id To Element        xpath=//*[@id="caso002A"]        RecuadroCasoDos
    Wait Until Element Is Visible       xpath=//*[@id="caso002A"]        timeout=15s
    Capture Element Screenshot      RecuadroCasoDos     filename=RecuadroCasoDos-{index}.png

003 Hacer clicks sobre diferentes elementos de la pagina
    [Tags]      Funcional       Caso003
    Checkbox Should Be Selected     xpath=/html/body/div/section[3]/p[3]/label[1]/input
    Checkbox Should Not Be Selected     xpath=/html/body/div/section[3]/p[3]/label[2]/input
    Choose File     xpath=/html/body/div/section[3]/p[3]/input[1]     C://Users/Owner/Desktop/Imagenes de Prueba/Objetos/2000359278431_2.jpg
    Input Text      xpath=/html/body/div/section[3]/p[3]/input[2]     Texto de prueba
    Clear Element Text      xpath=/html/body/div/section[3]/p[3]/input[2]
    Click Button        xpath=/html/body/div/section[3]/p[3]/input[3]
    Click Link      xpath=/html/body/div/section[3]/p[3]/a
    Switch Window       url=http://winstoncastillo.com/
    Close Window
    Switch Window       url=http://winstoncastillo.com/ejercicios/atoc.html
    Wait Until Element Is Visible       xpath=/html/body/div/section[1]     timeout=15s

004 HAcer Doble click en ventana Popup
    [Tags]      Funcional       Caso004
    Double Click Element        xpath=/html/body/div/section[4]/p[1]/button
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[4]/div/div/div/div[1]/h5        timeout=3s
    Element Attribute Value Should Be       xpath=/html/body/div[1]/section[4]/div/div/div/div[3]/button        type        button
    Set Focus To Element        xpath=/html/body/div[1]/section[4]/div/div/div/div[1]/button/span
    Double Click Element       xpath=/html/body/div[1]/section[4]/div/div/div/div[1]/button/span
    Wait Until Element is Not Visible       xpath=/html/body/div[1]/section[4]/div/div/div/div[1]/button/span

005 Verificar elementos dentor del UI
    [Tags]      Exploratoria        Caso005
    Set Focus To Element       xpath=/html/body/div/section[4]/p[3]/button[1]
    Element Should Be Disabled      id=elementoInactivo
    Click Element       id=elementoInactivo
    Element Should Be Enabled       id=elementoActivo
    Set Focus To Element        id=elementoActivo
    Element Should Be Focused       id=elementoActivo
    Element Should Be Visible       xpath=/html/body/div/section[4]/p[3]/i
    Click Button        xpath=//*[@id="anotherBtn"]
    Element Should Not Be Visible       xpath=/html/body/div/section[4]/p[3]/i
    Click Button        //*[@id="btn"]
    Element Should Be Visible       xpath=/html/body/div/section[4]/p[3]/i

006 Verificar Textos en el UI
    [Tags]      Exploratoria        Caso006
    Set Focus To Element       id=elementoCorrecto
    Element Should Contain      xpath=/html/body/div/section[4]/p[4]        uiero verificar
    Element Should Not Contain      xpath=/html/body/div/section[4]/p[4]        Texto no exacto
    Element Should Contain      xpath=/html/body/div/section[4]/p[4]        Texto Exacto        ignore_case=true
    Element Text Should Be      xpath=/html/body/div/section[4]/p[4]/span[2]        Texto EXACTO que quiero verificar en el elemento
    Element Text Should Not Be      xpath=/html/body/div/section[4]/p[4]/span[2]              CASO 006 Verificar textos en el UI

007 Inspeccionar todos los componentes de una seccion o pagina y contarlos u obtener la cantidad
    [Tags]  Exploratoria        Caso007
    Set Focus To Element        xpath=/html/body/div/section[5]/p[1]/span[1]
    ${TotalLink}=        Get All Links
    ${atributoElemento}=        Get Element Attribute       xpath=//*[@id="testCasesGtoI"]/p[1]/span[2]/button[1]       class
    ${numeroElementos}=     Get Element Count       class=cuenta
    ${ancho}    ${largo}=   Get Element Size        xpath=/html/body/div/section[5]/p[1]
    ${valoresVisiblesLista}=        Get List Items      xpath=//*[@id="testCasesGtoI"]/p[1]/span[2]/select
    ${valoresAsignadosLista}=       Get List Items     xpath=//*[@id="testCasesGtoI"]/p[1]/span[2]/select       values=True
    Select From List By Value       xpath=/html/body/div/section[5]/p[1]/span[2]/select        4
    ${TextoSeleccionadoLista}=      Get Selected List Label     xpath=//*[@id="testCasesGtoI"]/p[1]/span[2]/select
    ${ValorSeleccionadoLista}=      Get Selected List Value     xpath=//*[@id="testCasesGtoI"]/p[1]/span[2]/select
    Log to Console      ${TotalLink},${atributoElemento},${numeroElementos},${ancho},${largo},${valoresVisiblesLista},${valoresAsignadosLista},${TextoSeleccionadoLista},${ValorSeleccionadoLista}

008 Reconocer la velocidad de inspeccion de elementos
    [Tags]      Exploratoria        Caso008

Cerrar Script
    [Tags]      Exploratoria        Funcional       Caso007
    cerrar navegador