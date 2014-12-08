# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :look, :class => 'Looks' do
    img_url "MyString"
    freewords "MyString"
  end
end
