FactoryGirl.define do
  factory :plat do
    nom {random_string}
    description {random_string(30)}
    prix {rand(100)}
    menu
  end
end
