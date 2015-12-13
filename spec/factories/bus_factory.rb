FactoryGirl.define do
  factory :bus do
    number  "10"
    corp    "sbs"
    routes_ids %w(75009 76059 96289 01013)
    loop    false
  end
end
