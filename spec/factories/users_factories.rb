FactoryGirl.define do
  factory :user do
    nom {random_string}
    prenom {random_string}
    email {"#{prenom}.#{nom}@example.com"}
    password 'qwerty123'
    password_confirmation 'qwerty123'
    # confirmed_at {Time.now}

    factory :entrepreneur do
      after(:create) {|user| user.add_role :entrepreneur}
    end
    factory :restaurateur do
      after(:create) {|user| user.add_role :restaurateur}
    end
    factory :livreur do
      after(:create) {|user| user.add_role :livreur}
    end
    factory :client do
      after(:create) {|user| user.add_role :client}
    end
    factory :admin do
      after(:create) {|user| 
        user.add_role :entrepreneur
        user.add_role :restaurateur
        user.add_role :livreur
        user.add_role :client
      }
    end
  end
end

def random_string(length=10)
  ('a'..'z').to_a.sample(length).join
end