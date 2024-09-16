# frozen_string_literal: true

Given("Yo cargo la informacion para la prueba") do |table|
  @data_rows = table.raw
  rows = table.raw
  headers = rows.shift
  data = Hash[headers.zip(rows.first)]
  @name = data['name']
  @job = data['job']
end


When("Yo consumo el servicio post") do
  start_time = Time.now
  @create_user_task = CreateUserTask.new(name: @name, job: @job)
  @create_user_task.perform
  @created_user_id = @create_user_task.user_id
  @response_time = Time.now - start_time
end


Then("Yo valido el contrato del response del servicio con respecto al archivo {string}") do | schemaFile |
  validation_question = SchemaValidationQuestion.new(@create_user_task.response_body, schemaFile)
  result = validation_question.validate

  unless result[:valid]
    puts "Errores de validación de esquema: #{result[:errors].join(', ')}"
  end

  expect(result[:errors]).to be_empty
end


Then("Yo deberia recibir un codigo de respuesta {int}") do |expected_status_code|
  question = ResponseCodeQuestion.new(@create_user_task)
  result = question.check(expected_status_code)

  expect(result).to be_truthy, "Se esperaba el código de respuesta #{expected_status_code}, pero se recibió #{@create_user_task.response_code}."
end


When("Yo recupero el usuario con el ID devuelto") do
  retrieve_user_task = RetrieveUserTask.new(@created_user_id)
  @retrieved_user = retrieve_user_task.perform
end


Then("Yo valido el response code de la consulta del usuario con el ID guardado sea {int}") do |expected_status_code|
  expect(@retrieved_user.response_code).to eq(expected_status_code)
end


Then("Yo deberia ver los datos persistidos") do
  verify_user_data_task = VerifyUserDataTask.new(@retrieved_user.response_body, @name, @job)
  data_persisted = verify_user_data_task.perform
  expect(data_persisted).to be_truthy, "Los datos persistidos no coinciden con los datos enviados."
end


Then("El response deberia tener {int} campos") do |expected_field_count|
  response_hash = JSON.parse(@create_user_task.response_body)
  expect(response_hash.keys.size).to eq(expected_field_count)
end


Then("Yo valido el tiempo de respuesta sea menor a {int} segundo") do |max_seconds|
  expect(@response_time).to be < max_seconds
end


Then("El response deberia contener los campos:") do |table|
  expected_fields = table.raw.flatten
  response_hash = JSON.parse(@create_user_task.response_body)
  missing_fields = expected_fields - response_hash.keys
  expect(missing_fields).to be_empty, "Faltan los siguientes campos en la respuesta: #{missing_fields.join(', ')}"
end