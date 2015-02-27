FactoryGirl.define do
  factory :restaurant do
    nom {random_string} 
    factory :restaurant_with_menus do
      transient do
        menus_count 5
      end
      after(:create) do |restaurant, evaluator|
        create_list(:menu_with_plats, evaluator.menus_count, restaurant: restaurant)
      end
    end
  end
end
