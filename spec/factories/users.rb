FactoryBot.define do
  factory :user do
    user {
      email { 'something@sgdfe.org' }
      password { 'some_password' }
    }
  end
end
