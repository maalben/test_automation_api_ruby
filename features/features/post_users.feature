Feature: Validacion del servicio POST

  Background:
    Given Yo cargo la informacion para la prueba
      | name      | job                 |
      | Test User | Automation Engineer |
    When Yo consumo el servicio post

  @CP01001
  Scenario: Validar el código de respuesta al guardar un registro
    Then Yo deberia recibir un codigo de respuesta 201

  @CP01002
  Scenario: Validar persistencia de datos
    And Yo recupero el usuario con el ID devuelto
    Then Yo valido el response code de la consulta del usuario con el ID guardado sea 200
    And Yo deberia ver los datos persistidos

  @CP01003
  Scenario: Validar contrato del servicio
    Then Yo valido el contrato del response del servicio con respecto al archivo "post_users_schema.json"

  @CP01004
  Scenario: Validar cantidad de campos en el response
    Then El response deberia tener 4 campos

  @CP01005
  Scenario: Validar tiempo de respuesta del servicio
    Then Yo valido el tiempo de respuesta sea menor a 1 segundo

  @CP01006
  Scenario: Validar la presencia de campos en el response body
    Then El response deberia contener los campos:
      | createdAt |
      | name      |
      | job       |
      | id        |