FactoryBot.define do
  
  factory :transaction do
    
  end


  factory :user do
    sequence :email {|n| "dummyEmail#{n}@gmail.com" }
    add_attribute(:password) { "secretPassword" }
    add_attribute(:password_confirmation) { "secretPassword" }
    add_attribute(:username) { "sir-use-alot" }
  end

  factory :account do
    balance { 200 }
    association :user
  end

end

