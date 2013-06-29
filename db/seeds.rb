puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'VIP' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'alejandroplease', :password_confirmation => 'alejandroplease'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :VIP

puts 'DEFAULT GAMES'
[{name: 'Warmachine', magic_name: 'focus'}, 
 {name: 'Hordes',     magic_name: 'fury'}].each do |game|
  default_game = Game.find_or_create_by_name game
  puts 'game:' << default_game.name
  puts 'magic name:' << default_game.magic_name
end

puts 'DEFAULT FACTIONS'
[
  {name: 'Cygnar', game_id: 1},
  {name: 'Khador', game_id: 1},
  {name: 'Protectorate Of Menoth', game_id: 1},
  {name: 'Cryx', game_id: 1},
  {name: 'Retribution Of Scyrah', game_id: 1},
  {name: 'Convergence Of Cyriss', game_id: 1},
  {name: 'Mercenaries', game_id: 1},
  {name: 'Trollbloods', game_id: 2},
  {name: 'Skorne', game_id: 2},
  {name: 'Legion Of Everblight', game_id: 2},
  {name: 'Circle Orboros', game_id: 2},
  {name: 'Minions', game_id: 2}
].each do |faction|
  default_faction = Faction.find_or_create_by_name faction
  puts 'faction: ' << default_faction.name
  puts 'game: ' << default_faction.game_id
end

puts 'DEFAULT UNIT TYPES'
['caster', 'solo', 'unit', 'warjack', 'warbeast', 'attachment', 'battle engine'].each do |unit_type|
  default_unit_type = UnitType.find_or_create_by_name unit_type
  puts 'unit type: ' << default_unit_type.name
end

puts 'Default Units'
[
 {id: 2, name:'Bane Lord Tartarus', faction_id:4, point_cost:	4, field_allowance: 'c', hit_points:8, unit_type_id:2},
 {id: 3, name: 'Slayer', faction_id:4, point_cost: 6, field_allowance: 'u', hit_points:	28, unit_type_id:4},
 {id: 4, name: 'Asphyxious The Hellbringer', faction_id:4, point_cost:4, field_allowance: 'c', hit_points:18, unit_type_id:1},
 {id: 6, name: 'Kraken', faction_id:4, point_cost:19, field_allowance: 2, hit_points:58, unit_type_id:4},
 {id: 7, name: 'Seether', faction_id:4, point_cost:9, field_allowance: 'u', hit_points:28, unit_type_id:4},
 {id: 5, name: 'Vociferon', faction_id:4, point_cost:	0, field_allowance: 'c', hit_points:5, unit_type_id:2},
 {id: 8, name: 'Iron Lich Asphyxious', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:18, unit_type_id:1},
 {id: 9, name: 'Lich Lord Asphyxious', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:18, unit_type_id:1},
 {id: 10, name: 'Warwitch Deneghra', faction_id:4, point_cost:5, field_allowance: 'c', hit_points:16, unit_type_id:1},
 {id: 11, name: 'Wraith Witch Deneghra', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:16, unit_type_id:1},
 {id: 12, name: 'Goreshade The Bastard', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:17, unit_type_id:1},
 {id: 13, name: 'Deathwalker', faction_id:4, point_cost:0, field_allowance: 'c', hit_points:0, unit_type_id:1},
 {id: 14, name: 'Goreshade The Cursed', faction_id:4, point_cost:5, field_allowance: 'c', hit_points:17, unit_type_id:1},
 {id: 15, name: 'Master Necrotech Mortenebra', faction_id:4, point_cost:4, field_allowance: 'c', hit_points:16, unit_type_id:1},
 {id: 16, name: 'Deryliss', faction_id:4, point_cost:0, field_allowance: 'c', hit_points:5, unit_type_id:2},
 {id: 17, name: 'Pirate Queen Skarre', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:16, unit_type_id:1},
 {id: 18, name: 'Skarre, Queen Of The Broken Coast', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:16, unit_type_id:1},
 {id: 19, name: 'Lich Lord Terminus', faction_id:4, point_cost:4, field_allowance: 'c', hit_points:20	, unit_type_id:1},
 {id: 20, name: 'Lich Lord Venethrax', faction_id:4, point_cost:6, field_allowance: 'c', hit_points:18, unit_type_id:1},
 {id: 21, name: 'The Witch Coven Of Garlghast', faction_id:4, point_cost:5, field_allowance: 'c', hit_points:24, unit_type_id:1},
 {id: 22, name: 'Egregore', faction_id:4, point_cost:0, field_allowance: 'c', hit_points:0, unit_type_id:2},
 {id: 1, name: 'General Gerlak Slaughterborn', faction_id:4, point_cost:3, field_allowance: 'c', hit_points:8, unit_type_id:2}
].each do |unit|
  default_unit = Unit.find_or_create_by_name unit
  puts 'unit: ' << default_unit.name 
end
