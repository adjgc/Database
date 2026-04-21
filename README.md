# 📚 Prácticas de Bases de Datos - [ADJGC](https://www.linkedin.com/in/adjgc/)

Este repositorio contiene una colección de ejercicios y prácticas sobre modelado de bases de datos, diseño de **Diagramas Entidad-Relación (DER)** y sentencias **SQL**.

El objetivo es documentar mi proceso de aprendizaje y mantener una referencia técnica de los ejercicios realizados durante el desarrollo de mi portafolio.

---

## 🛠️ Tecnologías y Herramientas
* **Modelado:** [PlantUML](https://plantuml.com/)
* **Motor de DB:** SQL (MySQL)
* **Entorno:** DataGrip (JetBrains)

---

## 📖 Contenido

* **Relaciones Uno a Uno:** Implementación de tablas simples.
* **Relaciones Uno a Muchos:** Implementación de tablas básicas.
* **Relaciones Muchos a Muchos:** Implementación de tablas intermedias.
* **Consultas Básicas:** Uso de `SELECT`, `FROM`, `WHERE` para consultas y filtros.
* **Agrupación y ordenamiento:** Agrupación, conteo y ordenamiento de elementos con cláusulas `GROUP BY` y `ORDER BY`.
* **Consultas Avanzadas:** Uso intensivo de `JOINs` y Subconsultas.
* **Lógica en BD:** Procedimientos almacenados (`Stored Procedures`) y `Triggers`.

---

## ⚒️ Ejercicios Realizados

### 1. Sistema de Gestión de Club (`📂 club_de_deportes`)
Modelado de un club deportivo donde se gestiona la inscripción de socios en diferentes disciplinas.

#### ✅ Actividades
- [x] Agregar al menos 10 socios.
- [x] Agregar al menos 3 deportes.
- [ ] Listar a todos los socios.
- [ ] Listar a todos los deportes.
- [ ] Listar a todos los socios que practiquen Tenis.
- [ ] Contar a todos los socios que practiquen Fútbol.

### 2. Tienda de Informática (`📂 tienda_informatica`)
Diseño de una base de datos para una tienda de hardware, gestionando la relación entre productos y sus fabricantes.

#### ✅ Actividades
- [x] Agregar al menos 10 productos.
- [x] Agregar al menos 3 fábricas.
- [ ] Listar productos ordenados por precio (ASC).
- [ ] Listar fábricas por nombre (ASC).
- [ ] Filtrar productos con precio > 300.
- [ ] Identificar el producto con el menor precio.

### 3. Sistema de Veterinaria (`📂 veterinaria`)
Gestión de historial clínico, enfocada en la relación entre pacientes (mascotas) y sus tratamientos médicos.

#### ✅ Actividades
- [x] Agregar al menos 5 pacientes.
- [x] Generar 30 registros de tratamientos.
- [ ] Consultar historial de tratamientos por paciente.
- [ ] Contar tratamientos de un paciente entre un rango de fechas.
- [ ] Identificar al paciente con mayor actividad clínica.

### 4. Gestor para torneo de tenis (`📂 torneo_de_tenis`)
Base de datos para gestionar a los participantes de un torneo de tenis, organizando por categorías

#### ✅ Actividades
- [x] Agregar al menos 30 participantes (uso sugerido de un procedimiento almacenado).
- [x] Agregar una inscripción por cada participante.
- [ ] Contar la cantidad total de participantes.
- [ ] Obtener la lista completa de todos los participantes.
- [ ] Obtener la lista completa de todas las categorías.
- [ ] Obtener la cantidad de participantes mujeres sin importar la categoría.
- [ ] Obtener el nombre y apellido de los participantes inscritos en la categoría "Caballeros B".
- [ ] Obtener los datos de los participantes que tengan entre 25 y 37 años.
- [ ] Obtener la lista completa de inscripciones, especificando el nombre y apellido de cada uno de los inscritos.

### 5. Sistema para gestionar los alumnos inscritos a una escuela de música (`📂 escuela_musica`)
Diseño de una base de datos para el control de inscripciones de alumnos a diferentes cursos dentro de una escuela de música.

#### ✅ Actividades
- [x] Agregar al menos 30 alumnos (uso sugerido de un procedimiento almacenado).
- [x] Agregar inscripciones de alumnos, pudiendo estar en más de un curso, o bien, no estar en ningún curso.
- [ ] Listar todos los alumnos inscritos en el curso de "Guitarra Intermedio".
- [ ] Mosrar todas las inscripciones realizadas después del 1 de marzo del 2026.
- [ ] Contar la cantidad de alumnos que han abandonado la inscripción.
- [ ] Listar los cursos disponibles para alumnos avanzados.
- [ ] Listar los nombres y apellidos de los alumnos junto con los nombres de los cursos a los que están inscritos.
- [ ] Mostrar el nombre del curso y la cantidad de alumnos inscritos en cada curso.
- [ ] Listar el nombre y apellido de los alumnos que no han pagado su inscripcion, sin importar el curso.
- [ ] Obtener el nombre de los cursos que tienen al menos un alumno menor a 10 años inscrito.
- [ ] Listar el nombre y apellido de los alumnos junto con los nombres de los cursos que están inscritos, pero solo para aquellos que se inscribieron en febrero del 2026

---

### 5. Sistema para gestionar los alumnos inscritos a una escuela de música (`📂 escuela_musica`)
Diseño de una base de datos para el control de inscripciones de alumnos a diferentes cursos dentro de una escuela de música.

#### ✅ Actividades
- [x] Obtener el nombre de todos los socios ordenados de la Z a la A.
- [x] ¿Cuántas clases ofrece el gimnasio en total?
- [x] Obtener el nombre de todas las clases que se imparten antes de las 09:00:00.
- [ ] Obtener el nombre del socio, el nombre de la o las clases en las que está inscrito y la fecha que se inscribió.
- [ ] Listar el nombre de todos los socios que estén inscritos exclusivamente en Cardio Avanzado
- [ ] Tomar un ID de socio al azar, mostrar su nombre, el nombre de la clase y el horario de las clases en las que está inscrito.
- [ ] Obtener el nombre de cada clase y cuántos socios tiene inscritos, ordenar de la más llena a la más vacía.
- [ ] Encuentra el nombre de todos los socios que se han inscrito en más de 2 clases.
- [ ] Contar el número de socios inscrítos en todas las clases de nivel 'Avanzado'.
- [ ] Encontrar a los socios (si existen) que estén inscritos en el gimnasio pero no se hayan registrado a ninguna clase.

---

## 🚀 Próximamente 🚀

> [!NOTE]
> Este repositorio está en constante actualización. Próximamente se integrarán secciones de:

* **Lógica en BD:** `Triggers`.

---

**Desarrollado por:** [ADJGC](https://www.linkedin.com/in/adjgc/)