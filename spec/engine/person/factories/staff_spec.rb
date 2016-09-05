FactoryGirl.define do
  factory :person_staff, class: Person::Staff do
    trait :login_staff_admin do
      name          "Tester Staff"
      password      "1234568789"
      cpf           "04787910116"
      born          "03/05/1993"
      administrator true
      created_at    { 2.days.from_now }
    end
  end
end