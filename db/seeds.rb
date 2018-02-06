# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger.debug "Creating faculty..."
faculty = Faculty.new
faculty.name = "W1 - Wydział Architektury"
faculty.save!
Rails.logger.debug "Done!"

Rails.logger.debug "Creating organization..."
org = Organization.new
org.name = "Random Org"
org.time_of_establishment = Date.yesterday
org.faculty_id = 1
org.save!
Rails.logger.debug "Done!"

Rails.logger.debug "Creating user..."
user = User.new
user.password = "password"
user.email = "user@example.com"
user.full_name = "Jan Kowalski"
user.student_id = "999999"
user.faculty_id = "1"
user.phone_number = "999999999"
user.save!

user_org = UserOrganization.new
user_org.user_id = user.id
user_org.organization_id = org.id
user_org.save!
Rails.logger.debug "Done!"
