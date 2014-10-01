FactoryGirl.define do
  factory :alice, class: "User" do
    email "alice@timecard.com"
    password Devise.friendly_token[0,20]
    password_confirmation { password }
  end
end
