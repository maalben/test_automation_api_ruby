# frozen_string_literal: true

class VerifyUserDataTask
  def initialize(retrieved_user, expected_name, expected_job)
    @retrieved_user = retrieved_user
    @expected_name = expected_name
    @expected_job = expected_job
  end

  def perform
    @retrieved_user['name'] == @expected_name && @retrieved_user['job'] == @expected_job
  end
end