class UpdateRandomUserJob < ApplicationJob
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    puts "Please check again ActiveRecord::RecordNotFound #{exception.message}"
  end

  def perform(user_id)
    user = User.find user_id
    user.update_attributes name: FFaker::Name.name , email: FFaker::Internet.email
  end
end
