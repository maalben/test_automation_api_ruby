# frozen_string_literal: true

class ResponseCodeQuestion
  def initialize(task)
    @task = task
  end

  def check(expected_code)
    @task.response_code == expected_code
  end
end