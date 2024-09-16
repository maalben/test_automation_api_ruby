# frozen_string_literal: true

require 'cucumber'
require 'rest-client'
require 'yaml'
require 'json-schema'
require_relative '../tasks/create_user_task'
require_relative '../tasks/retrieve_user_task'

# Leer el archivo de configuración
config = YAML.load_file(File.expand_path('environment_config.yml', __dir__))

# Determinar el entorno (puedes ajustar esto según tu configuración)
current_environment = ENV['ENTORNO'] || 'ambiente2'

# Configurar la URL base según el entorno
API_BASE_URL = config[current_environment]['api_base_url']