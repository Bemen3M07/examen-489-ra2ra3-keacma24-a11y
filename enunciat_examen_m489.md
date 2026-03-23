# EXAMEN · MÒDUL 489

## Programació de Dispositius Mòbils i Multimèdia

**Unitats Formatives:** RA2 i RA3
**Curs:** 2n DAM · Videojocs
**Data:** 23/03/2026
**Durada:** 2 hores

**Alumne/a:** Kevin Jesus Acosta Mariños
**Grup:** 2DO Desenvolupament d'Aplicacions Multiplataforma

---

## Posada en marxa de l'entorn

Consulta el fitxer **`README.md`** del projecte per a les instruccions completes d'instal·lació i arrencada (Node.js, servidor mock i Flutter).

---

> **Instruccions generals**
>
> - Respon cada pregunta en l'espai indicat (substitueix el text `[Escriu la teva resposta aquí]`).
> - Per a la part de codi, escriu directament en bloc `dart`. No és necessari que el codi compili, però ha de reflectir coneixement real de Flutter/Dart.
> - Tens el codi dels projectes **Cars** i **Phone** com a referència en el teu ordinador. **No pots accedir a internet** durant l'examen.
> - Desa el fitxer i lliura'l amb el nom: `EXAMEN_M489_[el_teu_nom].md`
> - Fes commit i push del .md modificat i de tots els arxius que hagis modificat

---

## BLOC 1 · ARQUITECTURA I CICLE DE VIDA *(RA 2)*

### Pregunta 1.1 – Comunicació entre Widgets *(12 punts)*

Al projecte **Cars**, el widget `CarsPage` gestiona el número de pàgina actual (`_currentPage`) i el passa a `CarsList1`. El widget `ButtonPanel` conté els botons "Anterior" i "Següent".

**a)** A `cars_page.dart`, el widget utilitza el mètode `setState` per gestionar la paginació. Explica:

- Quina és la funció de `setState` i per què cridar-lo fa que la UI es torni a dibuixar.
- Per quin motiu `_loadPage()` fa servir dos crides a `setState` separades (una a l'inici i una al final) en lloc d'una sola.

**Resposta:**

```
Funcion de setState: Notifica al FrameWork que el estado interno del widget ha cambiado. Al llamarlo, flutter marca el widget como "sucio" y lo añade a la lista de widgets que deben reconstruirse, ejecutando de nuevo el método build para que la pantalla refleje los nuevos datos.

Dos llamadas a setState en _loadPage(): Se usan para gestionar el feedback visual del usuario. La primera llamada pone una variable (tipo _isLoading = true) para mostrar un spinner de carga. La segunda se hace tras recibir los datos de la API (asíncrona) para actualizar la lista de coches y quitar el spinner (isLoading = false). Sin la primera, el usuario no sabría si la app está trabajando o se ha colgado.
```

---

### Pregunta 1.2 – Cicle de vida d'un widget amb recursos *(13 punts)*

Al projecte **Camera**, el widget `CameraScreen` utilitza un `CameraController` per gestionar la càmera del dispositiu. Aquest controlador ocupa recursos del sistema (càmera, memòria) i cal alliberar-los correctament.

**a)** Quin mètode del cicle de vida de `State` s'usa a `CameraScreen` per alliberar el `CameraController` quan el widget és destruït? Escriu com es fa i explica per quina raó és imprescindible cridar-lo.

**Resposta:**

```
Se usa el método dispose()

@override
void dispose() {
  _controller.dispose(); // Cerramos el controlador de la cámara
  super.dispose();
}

Es imprescindible porque el CameraController reserva recursos de hardware y memoria del sistema operativo. Si no lo liberamos, podemos provocar fugas de memoria y, lo más grave, dejar el sensor de la cámara "bloqueado", impidiendo que otras aplicaciones (o nuestra propia app si intenta volver a entrar) puedan usarla.
```

---

**b)** El `CameraController` s'inicialitza de forma asíncrona a `initState()` i el resultat es guarda a `_initializeControllerFuture`. Respon les preguntes següents:

- Per quin motiu no es pot fer `await` directament a `initState()`?
- Quina millora aporta a l'usuari usar `FutureBuilder` en lloc de bloquejar el fil?
- Com treballen junts `_initializeControllerFuture` i `FutureBuilder`?

**Resposta:**

```
No await en initState: Porque initState es un método síncrono. Flutter necesita que termine inmediatamente para seguir con el ciclo de vida y pintar el primer build. Si lo hiciéramos asíncrono, bloquearíamos el arranque del widget.

Mejora del FutureBuilder: Permite que la interfaz sea reactiva. En lugar de congelar la app mientras la cámara se inicializa, el FutureBuilder nos deja mostrar un CircularProgressIndicator hasta que el hardware esté listo.

Trabajo conjunto: Guardamos la "promesa" de inicialización en la variable _initializeControllerFuture dentro del initState. Luego, el FutureBuilder se suscribe a esa variable y redibuja la UI automáticamente cuando la cámara pasa de estado "esperando" a "completado".
```

---

## BLOC 2 · COMUNICACIÓ, PERSISTÈNCIA I PROVES *(RA 2 — 35 punts)*

### Pregunta 2.1 – Consum d'API i robustesa *(18 punts)*

Analitza el mètode `getCarsPage(int page, int limit)` de `car_http_service.dart`.

Què passaria si el servidor de l'API trigués 60 segons a respondre? L'aplicació quedaria bloquejada per a l'usuari? Per què? Escriu com implementaries un *timeout* de 10 segons a la petició HTTP.

**Resposta:**
Si el servidor tarda 60 segundos, el await se quedaría esperando indefinidamente. El usuario vería un spinner eterno y la experiencia sería nefasta. Implementaría un timeout para dar un error controlado tras 10 segundos:
```dart
// Escriu la modificació al getCarsPage aquí:

  Future<List<CarsModel>> getCarsPage(int page, int limit) async {
    final offset = (page - 1) * limit;
    final uri = _buildUri('/v1/cars', {'limit': '$limit', 'offset': '$offset'});

  try {
      final response = await http
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return CarsModel.listFromJsonString(response.body);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
      } catch (e) {
      throw Exception('Error en la petición: $e');
    }
  }
```

---

### Pregunta 2.2 – Models de dades  *(17 punts)*

Analitza el constructor `factory CarsModel.fromMapToCarObject(Map<String, dynamic> json)` de `car_model.dart`.

**a)** Imagina que l'API retorna per error el camp `year` com a `String` en lloc d'`int` (per exemple, `"2021"` en lloc de `2021`). El codi actual fallaria. Escriu com resoldries el problema.

**Resposta:**

```
Para que el modelo sea robusto y no haga "crash" si el año viene como String, usaría un casting defensivo con int.tryParse

year: json['year'] is int
    ? json['year']
    : int.tryParse(json['year'].toString()) ?? 0,

Con esto, si viene "2021", lo convierte a 2021. Si viene algo raro o nulo, pone 0 por defecto y la app no explota.
```

---

**b)** Al fitxer `class_model_test.dart`, el test utilitza un `const jsonString` amb un JSON escrit a mà en lloc de fer una petició real a l'API de RapidAPI. Explica per quin motiu és millor simular el JSON en un test unitari.

**Resposta:**
```
Es mejor simular el JSON por tres motivos:

Aislamiento: El test solo prueba mi código, no si el servidor de RapidAPI está caído.
Repetibilidad: Me aseguro de que los datos del test son siempre los mismos.
Velocidad: El test se ejecuta en milisegundos porque no tiene que hacer peticiones reales por red.
```

---

## BLOC 3 · IMPLEMENTACIÓ PRÀCTICA *(RA 3 — 30 punts)*

### Exercici – Widget de detall amb dades remotes

Imagina que volem crear una pantalla de detall per a cada cotxe del projecte Cars. Implementa el mètode `build` d'un widget `StatelessWidget` anomenat `CarDetailPage` que compleixi els requisits següents:

1. Rep un paràmetre `final CarsModel car` al constructor.
2. Mostra el **make** i el **model** del cotxe com a títol destacat (`Text` amb estil gran i negreta).
3. Mostra una **icona diferent** depenent del `type` del cotxe:
   - Si el `type` és `'SUV'`, mostra `Icons.directions_car`.
   - Per qualsevol altre tipus, mostra `Icons.car_rental`.
4. Afegeix un botó `ElevatedButton` que, quan es premi, mostri un `SnackBar` amb el text: `"Cotxe seleccionat: [make] [model]"`.

```dart
class CarDetailPage extends StatelessWidget {
  final CarsModel car;

  const CarDetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${car.make} Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${car.make} ${car.model}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Icon(
              car.type == 'SUV' ? Icons.directions_car : Icons.car_rental,
              size: 80,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Coche seleccionado: ${car.make} ${car.model}')),
                );
              },
              child: const Text('Seleccionar Coche'),
            ),
          ],
        ),
      ),
    );
  }
}

```

---

**Ampliació (nivell Expert):** Afegeix un `FutureBuilder` que cridi al mètode `CarHttpService().getCarsPage(1, 5)` i mentre espera les dades mostri un `CircularProgressIndicator`. Quan les dades estiguin llestes, mostra un `ListView.builder` amb el `make` de cada cotxe. Si hi hagués un error, mostra un `Text` en color vermell amb el missatge de l'error.

```dart
//Escriu la teva ampliació aquí:
```

---

## BLOC 4 · EXTENSIÓ DEL SERVEI HTTP *(RA 2 — 10 punts)*

### Exercici 4.1 – Mètode parametritzat a `CarHttpService` *(10 punts)*

El servidor mock local té disponible un  endpoint de cerca:

```
GET http://localhost:8080/v1/cars/search?make=Toyota&model=Corolla
```

- El paràmetre `make` filtra per marca (coincidència parcial, insensible a majúscules).
- El paràmetre `model` filtra per model (coincidència parcial, insensible a majúscules).
- Tots dos paràmetres són opcionals: si no s'envien, retorna tots els cotxes.

Exemples vàlids:

- `/v1/cars/search?make=Toyota` → tots els Toyota
- `/v1/cars/search?model=X5` → tots els cotxes amb "X5" al model
- `/v1/cars/search?make=BMW&model=X` → BMW amb "X" al model

**Implementa** el mètode `getCarsByFilter` a la classe `CarHttpService` existent, seguint el mateix patrons que `getCarsPage`:

```dart
// Afegeix aquest mètode a car_http_service.dart:
```

Requisits:

1. Utilitza el mètode privat `_buildUri(String path, Map<String, String> queryParams)` ja existent.
2. Només afegeix els paràmetres `make` i/o `model` al mapa si el valor no és `null` ni buit (`isEmpty`).
3. Gestiona errors i timeout amb el mateix mecanisme que `getCarsPage`.

**Resposta:**

```dart
Future<List<CarsModel>> getCarsByFilter(String? make, String? model) async {
  final Map<String, String> queryParams = {};

  // Solo añadimos los parámetros si no son nulos ni están vacíos
  if (make != null && make.isNotEmpty) {
    queryParams['make'] = make;
  }
  if (model != null && model.isNotEmpty) {
    queryParams['model'] = model;
  }

  final url = _buildUri('/v1/cars/search', queryParams);

  try {
    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CarsModel.fromMapToCarObject(json)).toList();
    } else {
      throw Exception('Error en la búsqueda: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error de conexión o timeout: $e');
  }
}

```

---
## Resum de l'examen

| Bloc | RA | Punts màxims |
|------|----|:------------:|
| Bloc 1 – Arquitectura i Cicle de vida | RA 2 | 25 |
| Bloc 2 – Comunicació, Persistència i Proves | RA 2  | 35 |
| Bloc 3 – `CarDetailPage` (base) | RA 3 | 20 |
| Bloc 3 – Ampliació `FutureBuilder`  | RA 3 | 10 |
| Bloc 4 – Extensió del servei HTTP | RA 2 | 10 |
| **TOTAL** | | **100** |

---
