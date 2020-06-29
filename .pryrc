# rails console started in ~/workspace/rails_apps/tutorial_apps/league

puts "File #{File.expand_path __FILE__}  was loaded into current session"

Hirb.enable  and  puts "Enabled pretty DB:Table formatting via 'Hirb.enable'"

# puts "app.root_path: #{app.root_path}"               if app.respond_to?(:players_path)
# puts "app.players_url: #{app.players_url}"           if app.respond_to?(:players_url)
# puts "app.players_new_path: #{app.players_new_path}" if app.respond_to?(:players_new_path)

# Player.all
#
# Player.find_by(first_name: "Christopher").update(age: 28)
#
# Toggling age to ensure object is dirty and hence will be comitted to DB (1 commit for each update())
# Using tap for side effect: chaining impossible bc. update() returns boolean (instead of updated object)
#
# Player.find_by(first_name: "Christopher").tap{|pl| pl.update(age: 28) and pl.update(age: 27)}
#
# pl = Player.new
#
# pl.age=99
# pl.first_name="grandpa"
# pl.save
#
# or:
# pl.update(age: 99, first_name: "grandpa")
#
#
# old_guy = Player.new(first_name: "Old-guy", age: 99)
# old_guy.save
#
# Insert 2 new Player instances into DB
# {young_guy:  15,  old_guy: 99}.each{|fn,age| Player.new(first_name: fn, age: age).save}
#
# Player.attribute_names    # => ["id", "first_name", "age", "created_at", "updated_at", "last_name"]
#
# Player.select{|pl| pl.first_name =~ /(guy|grandpa)$/}.each{|pl|pl.destroy and pl.first_name}
#
# last_player.Player.last
#
# last_2_players.Player.last(2)
#
# last_player = Player.find_by(first_name: "Christopher")
#
# last_player.update(age: 27)
#
# p Player.find_by(first_name: "Christopher").age == Player.last.age
#
#
# Checking validations:
# ---------------------
#
# Whenever (e.g. validation) code was updated execute
#
#   reload!
#
# in order to make rails console aware of those changes
#
# reload!; (pl = Player.new).valid? or pl.errors.full_messages
# reload!; (pl = Player.new(first_name: "a_guy", age: 30)).valid? or pl.errors.full_messages
# reload!; (pl = Player.new(first_name: "a_guy", age: 30, last_name: "Foo_1")).valid? or pl.errors.full_messages
#
# e = Player.new
# e.update(first_name: "Something") or p e.errors.full_messages
# => false    # if e.g. validation failed  (e.g. validation expects also a last_name which is still nil wrt. that Player object e)
#
# Auto insert a generated last_name on all Players whose last_name is still empty
# Player.select{|pl| pl.last_name.to_s.empty?}.each_with_index{|pl,i| pl.update(last_name: "Generated_last_name__#{i}")}
#
#
# Show invalid Player instances
# reload!; invalid_players = Player.select{|pl| !pl.valid?}; p invalid_players
#
# reload!; p Player.select{|pl| !pl.valid?}.map{|pl| "Player #{pl.first_name}: #{pl.errors.full_messages}"}
#
#
# Address.create(street: "123 Example-Road", player_id: 1)
#
# Address.all
#
# an_address = Address.first
#
# an_address.player     #=> queries which player lives on the address an_address
#
# Player.first.address
#
# Note: Instead of passing the ID of the player, a Player instance can also be passed as parameter
# Address.create(street: "456 Testing Avenue", player: Player.third)
