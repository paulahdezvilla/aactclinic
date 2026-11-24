
# aactclinic

<!-- badges: start -->
<!-- badges: end -->

# aactclinic

Paquete de R para consultar y trabajar con datos de ensayos clínicos de AACT (Aggregate Analysis of ClinicalTrials.gov).

## Configuración de credenciales

Para conectarse a la base de datos AACT es necesario disponer de un usuario y una contraseña.

Las credenciales deben configurarse en el archivo `.Renviron`, que almacena variables de entorno de R.

Para editarlo, ejecutar:

```r
usethis::edit_r_environ()
```

Añadir las siguientes líneas, sustituyendo los valores por las credenciales personales:

```r
AACT_USER=tu_usuario
AACT_PASSWORD=tu_contraseña
```

Guardar el archivo y reiniciar la sesión de R para que las variables estén disponibles.

Se pueden comprobar mediante:

```r
Sys.getenv("AACT_USER")
Sys.getenv("AACT_PASSWORD")
```

**Importante:** No compartir ni subir el archivo `.Renviron` a GitHub, ya que contiene información confidencial.

## Tablas de AACT consultadas

El paquete utiliza la base de datos AACT, que contiene información sobre ensayos clínicos registrados en ClinicalTrials.gov.

Entre las tablas utilizadas se encuentran:

- `ctgov.studies`: información general de los ensayos clínicos, incluyendo fase y estado de reclutamiento.
- `ctgov.sponsors`: información sobre las organizaciones y patrocinadores que financian los ensayos.

Estas tablas se relacionan mediante el identificador `nct_id`.

## Instalación

Para instalar el paquete desde [GitHub](https://github.com/):

``` r
# install.packages("pak")
pak::pak("paulahdezvilla/aactclinic")
```

Para cargar el paquete:

```r
library(aactclinic)
```


