<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />


    <xsl:template match="/">
        <html>
            <head>
                <title>Registro de Personal</title>
                <xsl:call-template name="estilos" />
                <xsl:call-template name="comportamiento" />
            </head>
            <body>
                <div class="container mt-5">
                    <h2 class="p-3">Gestión de Colegio</h2>
                    <xsl:call-template name="barra-navegacion" />
                    <xsl:call-template name="contenido" />
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="barra-navegacion">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="nav-alumnos-tab"
                    data-bs-toggle="tab"
                    data-bs-target="#nav-alumnos" type="button" role="tab"
                    aria-controls="nav-alumnos" aria-selected="true">
                    Alumnos
                </button>
                <button class="nav-link" id="nav-profesores-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-profesores" type="button" role="tab"
                    aria-controls="nav-profesores" aria-selected="false">
                    Profesores
                </button>
                <button class="nav-link" id="nav-asignaturas-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-asignaturas" type="button" role="tab"
                    aria-controls="nav-asignaturas" aria-selected="false">
                    Asignaturas
                </button>
            </div>
        </nav>
    </xsl:template>

    <xsl:template name="contenido">
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-alumnos"
                role="tabpanel"
                aria-labelledby="nav-alumnos-tab">
                <table id="tabla-alumnos" class="table">
                    <thead>
                        <xsl:call-template name="encabezados-alumnos" />
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="//alumnos/alumno" />
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="nav-profesores" role="tabpanel"
                aria-labelledby="nav-profesores-tab">
                <table id="tabla-profesores" class="table">
                    <thead>
                        <xsl:call-template name="encabezados-profesores" />
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="//profesores/profesor" />
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="nav-asignaturas" role="tabpanel"
                aria-labelledby="nav-asignaturas-tab">
                <table id="tabla-asignaturas" class="table ">
                    <thead>
                        <xsl:call-template name="encabezados-asignaturas" />
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="//asignaturas/asignatura" />
                    </tbody>
                </table>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="encabezados-alumnos">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Edad</th>
            <th>Género</th>
            <th>Nivel</th>
            <th>Asignatura</th>
            <th>Activo</th>
        </tr>
    </xsl:template>

    <xsl:template match="//alumnos/alumno">
        <tr>
            <td>
                <xsl:value-of select="@id" />
            </td>
            <td>
                <xsl:value-of select="nombre" />
            </td>
            <td>
                <xsl:value-of select="edad" />
            </td>
            <td>
                <xsl:value-of select="genero" />
            </td>
            <td>
                <xsl:value-of select="nivel" />
            </td>
            <td>
                <xsl:value-of select="//asignatura[@codigo=current()/asignatura/@codigo]/nombre" />
            </td>
            <td>
                <xsl:value-of select="activo" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="encabezados-profesores">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Experiencia</th>
            <th>Email</th>
            <th>Género</th>
            <th>Departamento</th>
            <th>Asignatura</th>
            <th>Activo</th>
        </tr>
    </xsl:template>

    <xsl:template match="//profesores/profesor">
        <tr>
            <td>
                <xsl:value-of select="@id" />
            </td>
            <td>
                <xsl:value-of select="nombre" />
            </td>
            <td>
                <xsl:value-of select="experiencia" />
            </td>
            <td>
                <xsl:value-of select="email" />
            </td>
            <td>
                <xsl:value-of select="genero" />
            </td>
            <td>
                <xsl:value-of select="departamento" />
            </td>
            <td>
                <xsl:value-of select="//asignatura[@codigo=current()/asignatura/@codigo]/nombre" />
            </td>
            <td>
                <xsl:value-of select="activo" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="encabezados-asignaturas">
        <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Horas Semanales</th>
            <th>Curso</th>
        </tr>
    </xsl:template>

    <xsl:template match="//asignaturas/asignatura">
        <tr>
            <td>
                <xsl:value-of select="@codigo" />
            </td>
            <td>
                <xsl:value-of select="nombre" />
            </td>
            <td>
                <xsl:value-of select="tipo" />
            </td>
            <td>
                <xsl:value-of select="descripcion" />
            </td>
            <td>
                <xsl:value-of select="horasSemanales" />
            </td>
            <td>
                <xsl:value-of select="curso" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="estilos">
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous" />

        <link
            href="https://cdn.datatables.net/v/bs5/jq-3.7.0/moment-2.29.4/jszip-3.10.1/dt-2.3.2/af-2.7.0/b-3.2.3/b-colvis-3.2.3/b-html5-3.2.3/b-print-3.2.3/cr-2.1.1/cc-1.0.6/date-1.5.5/fc-5.0.4/fh-4.0.3/kt-2.12.1/r-3.0.4/rg-1.5.1/rr-1.5.0/sc-2.4.3/sb-1.8.2/sp-2.3.3/sl-3.0.1/sr-1.4.1/datatables.min.css"
            rel="stylesheet"
            integrity="sha384-qHMX0AbT+t6yogRkUDJhxQKZ8pRnigy/0aLpQaQH5ZiVilorppH54ft+3CtBfOH1"
            crossorigin="anonymous" />
    </xsl:template>

    <xsl:template name="comportamiento">
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"
            integrity="sha384-VFQrHzqBh5qiJIU0uGU5CIW3+OWpdGGJM9LBnGbuIH2mkICcFZ7lPd/AAtI7SNf7"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"
            integrity="sha384-/RlQG9uf0M2vcTw3CX7fbqgbj/h8wKxw7C3zu9/GxcBPRKOEcESxaxufwRXqzq6n"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.datatables.net/v/bs5/jq-3.7.0/moment-2.29.4/jszip-3.10.1/dt-2.3.2/af-2.7.0/b-3.2.3/b-colvis-3.2.3/b-html5-3.2.3/b-print-3.2.3/cr-2.1.1/cc-1.0.6/date-1.5.5/fc-5.0.4/fh-4.0.3/kt-2.12.1/r-3.0.4/rg-1.5.1/rr-1.5.0/sc-2.4.3/sb-1.8.2/sp-2.3.3/sl-3.0.1/sr-1.4.1/datatables.min.js"
            integrity="sha384-Sqg+cHKT+pQM3ZHFvUUhR6FqmEZ3Zbw2Z+2xVmoZ5RvrvP4bxwXfHUCgbl7laBZP"
            crossorigin="anonymous"></script>
        <script src="controladores/datatables.js" />
    </xsl:template>
</xsl:stylesheet>

