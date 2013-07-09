# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    parent_unit_id 1
    child_unit_id 1
  end
end
