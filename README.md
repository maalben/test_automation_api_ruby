# test_automation_api_ruby

Ejercicio de automatización desarrollado en el lenguaje Ruby on Rails con estructura un poco parecida a POM (Page Object Model)

### Característcas

- Realizado en Ruby on Rails.
- Estructura de proyecto similar a Screenplay pattern design.
- Se utilizan las siguientes librerías para su ejecución:

		spec
		cucumber
		capybara
		site_prism
		selenium-webdriver
		report_builder

Esta ya se encuentran en el archivo Gemfile.


### Aplicaciones y versiones usadas

Se ha probado con las siguientes aplicaciones y en sus respectivas versiones:

- ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-darwin22]
- rbenv 1.3.0
- Bundler version 2.5.18


### Cómo ejecutar la automatización

Para ejecutar la automatización, por consola o terminal, debe ubicarse en la raiz del proyecto, a continuación use alguno de los siguientes comandos según su necesidad:

Por si quiere ver una especie de verbose mientras se está ejecutando:

		cucumber --backtrace


Por si solo quiere ejecutar sin ver mucha información, intenta con el siguiente comando:

		cucumber


Pero si quieres ver la ejecución y luego que te genere el reporte, hazlo con el siguiente comando:

		cucumber -p json_report


En la siguiente ruta se creará un archivo html con la fecha actual en la que se ejecute la automatización:

		RAIZ_DE_PROYECTO/features/reports/


Eso es todo !! 