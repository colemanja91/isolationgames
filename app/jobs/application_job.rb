class ApplicationJob < ActiveJob::Base
  #include Shoryuken::Worker
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked
end
