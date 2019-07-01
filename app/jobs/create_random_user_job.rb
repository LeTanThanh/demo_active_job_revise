class CreateRandomUserJob < ApplicationJob
  queue_as :default

  def perform()
    User.create name: FFaker::Name.name , email: FFaker::Internet.email
  end
end
