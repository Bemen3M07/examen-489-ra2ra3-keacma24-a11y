[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/F3-6T9OG)
# m489_cars_camera · Examen Mòdul 489

Projecte Flutter de referència per a l'examen del Mòdul 489 (RA2 i RA3).
Conté dos projectes integrats: **Cars** (REST API paginada) i **Camera** (permisos i cicle de vida).

---

## Posada en marxa de l'entorn

### 1 · Instal·lar Node.js (Windows)

Obre el **PowerShell** o el **Símbol del sistema** com a administrador i executa:

```powershell
winget install OpenJS.NodeJS.LTS
```

> `winget` ve preinstal·lat a Windows 10 (21H1 o posterior) i Windows 11.  
> Un cop finalitzada la instal·lació, **tanca i torna a obrir el terminal** per refrescar el `PATH`.

Verifica que s'ha instal·lat correctament:

```powershell
node --version
npm --version
```

---

### 2 · Arrencar el servidor mock local

Els cotxes provenen d'un servidor local (Express / Node.js) que emula l'API real.

```powershell
# Des de la carpeta arrel del projecte:
cd mock_server
npm install        # només cal fer-ho el primer cop
node server.js     # el servidor queda escoltant a http://localhost:8080
```

> Deixa aquest terminal obert mentre fas l'examen.  
> Verifica que funciona obrint <http://localhost:8080/health> al navegador: ha de mostrar `{"status":"ok","total":40}`.

---

### 3 · Executar l'aplicació Flutter

Amb el servidor mock ja en marxa en un altre terminal:

**Opció A – VS Code:**

1. Obre la carpeta del projecte a VS Code.
2. A la barra inferior, selecciona **Chrome** com a dispositiu.
3. Prem **F5** (o `Run > Start Debugging`).

**Opció B – Terminal:**

```powershell
flutter run -d chrome
```

> L'aplicació s'obrirà a Chrome amb dues pestanyes: **Cars** (llista paginada de cotxes) i **Phone** (permisos i cicle de vida).
