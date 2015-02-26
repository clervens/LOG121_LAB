FactoryGirl.define do
  factory :ligne_commande do
    qte {rand(20)}
    commande
    factory :ligne_commande_with_plat do
      plat
    end
  end
end
