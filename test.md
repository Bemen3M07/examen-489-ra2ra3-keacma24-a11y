# Test M489 – Programació de Dispositius Mòbils i Multimèdia

**Mòdul 489 · RA2 i RA3 · 2n DAM Videojocs**

---

**Nom i cognoms:** Kevin Jesus Acosta Mariños

**Data:** 23/03/2026  **Grup:** 2DO DAM

---

> Marca amb una **✗** la casella de la resposta que consideris correcta.
> Cada pregunta té **una única resposta vàlida**.

---

### 1. Quin mètode del cicle de vida d'un widget Flutter s'usa per alliberar recursos (càmera, controladors) quan el widget es destrueix?

- [ ] A) `initState()`
- [X] B) `dispose()`
- [ ] C) `build()`
- [ ] D) `deactivate()`

---

### 2. Quin tipus de widget té un objecte State separat que pot canviar al llarg del temps en resposta a esdeveniments?

- [ ] A) `StatelessWidget`
- [ ] B) `InheritedWidget`
- [X] C) `StatefulWidget`
- [ ] D) `Provider`

---

### 3. Quin mètode s'usa per notificar Flutter que l'estat intern d'un widget ha canviat i cal reconstruir la UI?

- [X] A) `setState()`
- [ ] B) `rebuild()`
- [ ] C) `update()`
- [ ] D) `refresh()`

---

### 4. Quin és el tipus de retorn d'una funció asíncrona en Dart que executa una tasca però no retorna cap valor útil?

- [ ] A) `void`
- [ ] B) `async void`
- [ ] C) `Stream<void>`
- [X] D) `Future<void>`

---

### 6. Quin rang de codis d'estat HTTP indica que la petició ha tingut èxit i el servidor ha retornat les dades correctament?

- [X] A) 2xx — per exemple, 200
- [ ] B) 4xx — per exemple, 404
- [ ] C) 5xx — per exemple, 500
- [ ] D) 3xx — per exemple, 301

---

### 7. Quin codi d'estat HTTP retorna un servidor quan el recurs sol·licitat no existeix en aquell servidor?

- [ ] A) 500 Internal Server Error
- [X] B) 403 Forbidden
- [ ] C) 404 Not Found
- [ ] D) 204 No Content

---

### 8. Quin mètode del cicle de vida s'executa una sola vegada just quan l'objecte State d'un widget és inserit a l'arbre de widgets?

- [ ] A) `build()`
- [ ] B) `dispose()`
- [ ] C) `didUpdateWidget()`
- [X] D) `initState()`

---

### 11. Quin verb HTTP s'usa per obtenir dades d'una API REST sense modificar l'estat del servidor?

- [ ] A) `POST`
- [ ] B) `PUT`
- [ ] C) `PATCH`
- [X] D) `GET`

---

### 12. Quin widget de Flutter permet reaccionar als tres estats d'un Future (espera, dades, error) i reconstruir la UI automàticament?

- [ ] A) `StreamBuilder`
- [ ] B) `ValueListenableBuilder`
- [X] C) `FutureBuilder`
- [ ] D) `AnimatedBuilder`

---

### 13. Quin és l'arxiu principal de configuració de dependències, assets i versió en un projecte Flutter?

- [X] A) `pubspec.yaml`
- [ ] B) `package.json`
- [ ] C) `build.gradle`
- [ ] D) `flutter.json`

---

### 14. Quin és l'ús principal de Postman en el context del desenvolupament amb APIs REST?

- [ ] A) Gestionar dependències del projecte Flutter de forma visual
- [X] B) Provar i documentar endpoints d'una API REST enviant peticions HTTP i visualitzant les respostes, sense necessitat de codificar cap aplicació
- [ ] C) Generar automàticament el codi Dart necessari per consumir una API a partir de la seva documentació OpenAPI
- [ ] D) Desplegar el servidor mock localment per exposar els endpoints als clients

---

### 15. Quin paquet de Flutter s'usa habitualment per accedir a la càmera del dispositiu i capturar fotos?

- [ ] A) `image_capture`
- [X] B) `flutter_camera`
- [ ] C) `device_camera`
- [ ] D) `camera`

---

### 16. Quina funció de Dart converteix una cadena de text JSON vàlida en un objecte Dart (Map o List)?

- [X] A) `jsonDecode()`
- [ ] B) `jsonParse()`
- [ ] C) `fromJson()`
- [ ] D) `jsonEncode()`

---

### 17. Quin widget de Flutter mostra en temps real el flux de vídeo de la càmera (viewfinder) per veure el que capturarà la foto?

- [ ] A) `Image.network()`
- [ ] B) `VideoPlayer`
- [X] C) `CameraPreview`
- [ ] D) `CameraView`

---

### 18. Quin tipus d'objecte retorna `await controller.takePicture()` del paquet `camera` de Flutter?

- [ ] A) `File`
- [X] B) `XFile`
- [ ] C) `Image`
- [ ] D) `Uint8List`

---

### 19. Quina paraula clau marca una funció com a asíncrona a Dart, habilitant l'ús de `await` dins el seu cos?

- [X] A) `async`
- [ ] B) `future`
- [ ] C) `concurrent`
- [ ] D) `defer`

---

### 20. En Flutter, quin tipus de test comprova una única classe o funció de forma aïllada, sense dependències de xarxa ni de widgets?

- [ ] A) Test d'integració
- [ ] B) Test de widget
- [ ] C) Test de golden image
- [X] D) Test unitari

---

### 21. Per quin motiu `initState()` no pot usar `await` directament davant d'una operació asíncrona com `_controller.initialize()`?

- [ ] A) Perquè Dart no suporta `async` en mètodes que comencen per `init`
- [ ] B) Perquè `await` dins `initState()` bloqueja el fil de la UI i Flutter llança un error
- [X] C) Perquè `initState()` ha de retornar síncronament perquè el framework pugui cridar `build()` immediatament després i construir la UI
- [ ] D) Perquè `initState()` retorna `Widget` i els Futures no poden retornar Widgets

---

### 23. Quin problema concret provoca no cridar `_controller.dispose()` al mètode `dispose()` de `CameraScreen`?

- [ ] A) Flutter llança immediatament una excepció `LateInitializationError`
- [ ] B) El widget `CameraScreen` es reconstrueix en bucle infinit
- [ ] C) La memòria de l'app creix però la càmera segueix funcionant correctament sense cap efecte visible
- [X] D) El recurs de càmera queda reservat pel sistema operatiu i no el pot usar cap altra app fins que es reinicia el procés o el SO el recupera

---

### 24. En un `FutureBuilder`, quin és el valor de `snapshot.connectionState` mentre el Future associat encara no ha completat?

- [ ] A) `ConnectionState.loading`
- [X] B) `ConnectionState.waiting`
- [ ] C) `ConnectionState.pending`
- [ ] D) `ConnectionState.active`

---

### 26. Per quin motiu és millor usar un JSON simulat (Map estàtic) en un test unitari de `CarsModel` en lloc de fer una crida real a l'API de RapidAPI?

- [X] A) El test és independent de la xarxa i de l'API externa, sempre reproductible amb les mateixes dades, i s'executa en mil·lisegons sense cost de peticions
- [ ] B) Perquè l'API de RapidAPI bloqueja les peticions que provenen del procés `flutter test`
- [ ] C) Perquè `http.get` no funciona dins el context de `flutter test` per restriccions de la plataforma
- [ ] D) Perquè el JSON estàtic és l'únic format que el constructor factory `fromMapToCarObject` accepta

---

### 27. En l'arquitectura MVC de la P5, per quin motiu el codi de les peticions HTTP es posa en un servei separat (com `CarHttpService`) i no directament a la vista?

- [ ] A) Perquè Flutter obliga a posar totes les crides `http.get` en fitxers separats de la UI o llança un error de compilació
- [ ] B) Per optimitzar el rendiment: Flutter executa el codi de serveis en un Isolate separat automàticament si és en un fitxer diferent
- [ ] C) Per evitar el límit de 500 línies per arxiu que imposa la guia d'estil de Flutter
- [X] D) Perquè permet canviar la implementació de la font de dades (API real, mock, base de dades) sense modificar la vista, i facilita els tests unitaris aïllant la lògica de xarxa

---

### 28. Al projecte de la P5, com s'autentica l'app Flutter amb l'API de RapidAPI (car-data)?

- [ ] A) Passant el token d'autenticació com a paràmetre de query a la URL: `?api_key=xxx`
- [X] B) Afegint les capçaleres HTTP `X-RapidAPI-Key` i `X-RapidAPI-Host` a cada petició
- [ ] C) Usant una cookie de sessió que s'estableix en el primer login a l'API
- [ ] D) Fent una crida prèvia a un endpoint `/auth/login` que retorna un Bearer token

---

### 30. Per quin motiu cal cridar `await _controller.initialize()` abans de mostrar el widget `CameraPreview`?

- [ ] A) Perquè `initialize()` sol·licita el permís de càmera a l'usuari; sense cridar-lo, Flutter no demanarà permís mai
- [ ] B) Perquè `CameraPreview` és un widget de plataforma (PlatformView) que requereix `initialize()` per registrar-se al canal de plugins
- [X] C) Perquè `CameraPreview` necessita que el controlador hagi completat la inicialització amb el sensor de la càmera per poder mostrar el flux de vídeo; si no s'ha inicialitzat, llança una excepció
- [ ] D) Per optimitzar el consum de bateria: `initialize()` activa el mode de baix consum de la càmera abans de mostrar-la

---

### 31. Arquitectura del projecte Cars: `CarsPage` és StatefulWidget i `CarsList` és StatelessWidget. Quina és la raó tècnica i arquitectònica d'aquesta decisió?

- [ ] A) `CarsList` és StatelessWidget perquè no és la pantalla principal de la NavigationBar
- [ ] B) `CarsPage` és StatefulWidget per obligació de Flutter quan el widget conté un `Navigator`
- [ ] C) Podrien ser tots dos StatefulWidget i el comportament seria funcionalment idèntic
- [X] D) `CarsPage` posseeix i muta l'estat (pàgina actual, llista de cotxes, error, càrrega); `CarsList` és una vista pura que rep les dades per paràmetre i no necessita estat propi, seguint el principi de separació de responsabilitats

---

### 32. Quina estratègia s'usa habitualment a Flutter per guardar una foto capturada (`XFile`) a la galeria d'imatges del dispositiu?

- [ ] A) Copiar directament el fitxer a la carpeta `/storage/emulated/0/DCIM/` usant `File.copy()` sense permisos addicionals
- [X] B) Usar un paquet de tercers com `gal` o `image_gallery_saver` que crida les APIs natives, i declarar el permís `WRITE_EXTERNAL_STORAGE` (Android) o `NSPhotoLibraryAddUsageDescription` (iOS)
- [ ] C) Flutter té el mètode integrat `MediaStore.saveImage(xfile)` disponible des del paquet `dart:io`
- [ ] D) Cal usar el servei de Firebase Storage: pujar la foto al núvol i descarregar-la localment a la galeria

---

### 33. Quin és el risc de seguretat principal de deixar una clau API hardcoded en un fitxer `.dart` comitat a GitHub?

- [X] A) Qualsevol persona amb accés al repositori pot extreure i usar la clau, generant costos en el compte de l'owner o accedint a dades sensibles de l'API
- [ ] B) GitHub detecta automàticament claus API i les invalida en fer el push
- [ ] C) Les claus API en codi Dart s'ofusquen automàticament en compilar per a producció (release mode)
- [ ] D) Només és un risc si el repositori és públic; en repositoris privats no hi ha risc

---

### 34. Dedueix del codi: `_initializeControllerFuture = _controller.initialize()` a `initState()` i `FutureBuilder(future: _initializeControllerFuture)` a `build()`. Per quin motiu es guarda el Future en una variable d'instància?

- [ ] A) Perquè `FutureBuilder` no accepta Futures creats inline com a argument directe
- [ ] B) Per poder cancel·lar el Future manualment si l'usuari surt de la pantalla amb un pop
- [X] C) Per evitar que cada reconstrucció del widget (rebuild) creï un nou Future i reiniciï la càmera; el FutureBuilder sempre consumeix el mateix Future creat una sola vegada a `initState()`
- [ ] D) Perquè declarar-lo com a variable d'instància permet que Dart l'optimitzi al heap en lloc de la pila

---

### 35. Per quin motiu la P5 recomana provar els endpoints de l'API amb Postman ABANS d'implementar l'aplicació Flutter?

- [ ] A) Perquè Postman genera automàticament el codi Dart necessari per consumir l'API un cop comprovat que funciona
- [ ] B) Per requisit de la plataforma RapidAPI: cal fer una petició des de Postman per activar la clau API abans del primer ús
- [ ] C) Perquè Flutter prohibeix peticions HTTP en mode debug; cal verificar-les primer des d'un client extern com Postman
- [X] D) Per verificar que l'API funciona correctament, entendre l'estructura exacta del JSON de resposta i detectar errors d'autenticació o de paràmetres sense interferències del codi Flutter

---

### 38. En el protocol HTTP, quina és la diferència principal entre un error 4xx i un error 5xx?

- [ ] A) Els errors 4xx es produeixen durant la connexió TCP; els errors 5xx es produeixen un cop establerta la connexió HTTP
- [ ] B) 4xx indica error al servidor de proves (staging) i 5xx al servidor de producció
- [X] C) Els errors 4xx indiquen un problema a la petició del client (clau incorrecta, recurs inexistent, no autoritzat); els errors 5xx indiquen un problema intern del servidor (codi defectuós, base de dades caiguda)
- [ ] D) No hi ha diferència funcional; la distinció és purament semàntica i els clients HTTP els tracten de la mateixa manera

---

### 39. L'app de la P5 rep una resposta HTTP 403 Forbidden en la primera crida a l'API de RapidAPI. Quina és la causa més probable?

- [ ] A) El servidor ha rebut la petició però no pot processar el JSON del cos de la petició perquè té un format incorrecte
- [ ] B) 403 significa que el servidor no existeix; caldrà comprovar la URL base de l'API
- [ ] C) La connexió a Internet de l'app no funciona; cal verificar el permís `INTERNET` al `AndroidManifest.xml`
- [X] D) La capçalera `X-RapidAPI-Key` és incorrecta, ha caducat o l'endpoint no està inclòs en el pla subscrit

---

### 40. Quin mètode del paquet `audioplayers` permet posicionar la reproducció en un moment concret de l'àudio (per exemple, avançar 30 segons)?

- [ ] A) `audioPlayer.seek(Duration(seconds: 30))`
- [X] B) `audioPlayer.setPosition(Duration(seconds: 30))`
- [ ] C) `audioPlayer.jumpTo(30)`
- [ ] D) `audioPlayer.scrub(Duration(seconds: 30))`

---

*Mòdul 489 · 2n DAM Videojocs · Curs 2025–2026*
