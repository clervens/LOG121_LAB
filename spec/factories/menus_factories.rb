FactoryGirl.define do
  factory :menu do
    nom {random_string} 
    restaurant
    factory :menu_with_plats do
      transient do
        plats_count 5
      end
      after(:create) do |menu, evaluator|
        create_list(:plat, evaluator.plats_count, menu: menu)
      end
    end
  end
end
