# BAMX: Servitum

App desarrollada para el Banco de Alimentos de Guadalajara con el fin de facilitar el manejo de voluntarios de lso distintos eventos de la  organización. Empleando el framework Flutter cpara el desarrollo de la aplicación, Firebase realtime database para el almacenamiento de datos y autenticación de usuarios mediante firebase.

Equipo de desarrollo:

- [Ruy Guzmán Camacho](https://github.com/Ruy-GC)
- [Santiago González de Cosío Romero](https://github.com/sant-gdc)
- [Adrián Becerra Meza](https://github.com/AdrianBecerra411)
- [Diego Sú Gómez](https://github.com/DiegoSuG29)
- [Santiago Ortiz Pérez ](https://github.com/SantiagOrtiz8)

# Aplicación
La aplicación se compone de las siguientes páginas
- Inicio de sesión
- Registro
- Eventos
- Programas
- Calendario
- Perfil


# Acciones y tipos de usuarios
## Usuario Regular:
- Registrarse e iniciar sesión
- Ver lista de eventos información de los eventos (Detalles, horarios, fechas, cupo, etc.)
- Registarse en eventos
- Ver los eventos relacionados dentro de la pestaña de programas
- Ver eventos en los que se registró dentro de su calendario
- Ver información y editar su perfil

## Usuario de Administrador:
- Registrarse e iniciar sesión
- Ver lista de eventos información de los eventos (Detalles, horarios, fechas, cupo, etc.)
- Eliminar y añadir nuevos eventos
- Ver lista de voluntarios registrados en cada evento individual
- Ver los eventos relacionados dentro de la pestaña de programas
- Eliminar y añadir nuevos programas para agrupar eventos
- Ver información y editar su perfil

# Instalación e inicio de la aplicación
``` bash
cd .\bamx_app\ 
flutter packages get
flutter run

# In vs code, you're able to run the app by clicking run -> run without debuging. You'll be able to perform hot reloads and restarts easily

# Install both flutter and dart extensions
```

# Endpoints

## Ejemplo para obtener la información de eventos

``` dart
Future<List<Event>> getEvents() async {
  List<Event> result = [];
  final snapshot = await eventsRef.get();
  if (snapshot.exists) {
    for (var element in snapshot.children) {
      result.add(
        Event(
          id: element.key as String,
          title: element.child('title').value as String,
          type: element.child('type').value as String,
          img: element.child('img').value as String,
          details: element.child('details').value as String,
          location: element.child('location').value as String,
          date: DateTime.parse(element.child('date').value as String),
          points: element.child('points').value as int,
          volunteers: element.child('volunteers').value as int,
          enrolled: element.child('enrolled').value as int,
          users: element.child('users').exists
              ? element.child('users').value as List<Object>
              : [],
        ),
      );
    }
  }

  return result;
}
```

## Ejemplo para subir y borrar eventos

``` dart
void addEvent(Event newEvent) async {
  await eventsRef.push().set(
    {
      "title": newEvent.title,
      "type": newEvent.type,
      "img": newEvent.img,
      "details": newEvent.details,
      "location": newEvent.location,
      "date": newEvent.date.toString(),
      "points": newEvent.points,
      "volunteers": newEvent.volunteers,
      "enrolled": newEvent.enrolled,
      "users": [],
    },
  );
}

void deleteEvents(String id) async {
  await eventsRef.child(id).remove();
}

```
