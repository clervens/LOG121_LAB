FactoryGirl.define do
  factory :adresse do
    value {"1234 #{random_string(15)} #{random_string(10)}"}
    user
  end
end

def random_string(length=10)
  ('a'..'z').to_a.sample(length).join
end