# frozen_string_literal: true

class SchemaValidationQuestion
  def initialize(response_body, schema_path)
    @response_body = response_body
    @schema_path = schema_path
  end

  def validate
    schema_file_path = File.join(File.dirname(__FILE__), '../schemas/' + @schema_path)
    validator = JSONSchemaValidator.new(schema_file_path)
    validation_errors, is_valid = validator.validate(@response_body)
    { errors: validation_errors, valid: is_valid }
  end
end