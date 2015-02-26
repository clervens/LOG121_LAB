FactoryGirl.define do
  factory :commande do
    date_de_livraison {Time.now}
    adresse
    restaurant
    factory :commande_with_ligne_commandes do
      transient do
        lignes_count 5
      end
      after(:create) do |commande, evaluator|
        create_list(:ligne_commande_with_plat, evaluator.lignes_count, commande: commande)
      end
    end
  end
end
