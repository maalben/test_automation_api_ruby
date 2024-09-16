# frozen_string_literal: true

class RetrieveUserTask
  attr_reader :response_body, :response_code

  def initialize(user_id)
    @user_id = user_id
  end

  def perform
    response = RestClient.get("#{API_BASE_URL}/users/#{@user_id}")
    @response_body = JSON.parse(response.body)
    @response_code = response.code
    self  # Retornamos la instancia completa con body y code
  rescue RestClient::ExceptionWithResponse => e
    @response_body = JSON.parse(e.response.body)
    @response_code = e.response.code
    self  # Retornamos la instancia aunque haya error
  end
end