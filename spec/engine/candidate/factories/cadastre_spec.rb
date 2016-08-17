FactoryGirl.define do
  factory :candidate_cadastre, class: Candidate::Cadastre do
    trait :in_the_future do
      created_at { 2.days.from_now }
    end
  end
end