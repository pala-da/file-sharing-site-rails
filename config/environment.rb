# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#set delivery method to smtp
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => '',
    :domain         => '',
    :port           => 587,
    :user_name      => '',
    :password       => '',
    :authentication => :plain,
    :enable_starttls_auto => true
}