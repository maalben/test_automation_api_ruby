# frozen_string_literal: true

class JSONSchemaValidator
  def initialize(schema_path)
    @schema = JSON.parse(File.read(schema_path))
  end

  def validate(response_body)
    user_response = JSON.parse(response_body)
    validation_errors = JSON::Validator.fully_validate(@schema, user_response)
    [validation_errors, validation_errors.empty?]
  end
end