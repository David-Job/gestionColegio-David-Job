Gestión de Colegio (PPF UF2217)
===

El alumnado debe desarrollar un sistema de presentación y explotación de un repositorio de datos XML perteneciente a un centro educativo. Para ello, creará los siguientes archivos:
- `colegio.xml`: contiene la estructura de **datos** del repositorio del centro educativo, con *alumnos*, *profesores* y *asignaturas*.
- `colegio.xsd`: describe la estructura y restricciones del documento XML para **validación**.
- `colegio.xsl`: transforma los datos del repositorio a una interfaz HTML interactiva utilizando. **Bootstrap** y **DataTables**.

La solución deberá cumplir los siguientes requisitos:
- La transformación **XSL** mostrará *tablas interactivas* con datos de alumnos, profesores y asignaturas.
- Se validará el **XML** con el esquema **XSD**.
- El documento **HTML** resultante integrará **Bootstrap** y **DataTables** para la publicación estructurada.
- Las tablas permitirán *búsqueda*, *ordenación* y *paginación*.
- Se *enlazarán* correctamente los recursos entre sí (por ejemplo, `codAsignatura` con nombre de asignatura).
