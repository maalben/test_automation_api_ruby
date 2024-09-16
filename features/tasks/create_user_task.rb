# frozen_string_literal: true

class CreateUserTask
  attr_reader :user_id, :response_body, :response_code

  def initialize(name:, job:)
    @name = name
    @job = job
  end

  def perform
    response = RestClient.post("#{API_BASE_URL}/users", { name: @name, job: @job }.to_json, { content_type: :json, accept: :json })
    @response_body = response.body
    @response_code = response.code
    parsed_response = JSON.parse(@response_body)
    @user_id = parsed_response['id']
  rescue RestClient::ExceptionWithResponse => e
    @response_body = e.response.body
    @response_code = e.response.code
  end
end