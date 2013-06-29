# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    name "MyString"
    faction_id 1
    point_cost 1
    field_allowance "MyString"
    hit_points 1
    unit_type_id 1
  end
end
