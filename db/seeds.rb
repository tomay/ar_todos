require_relative '../config/application'
require 'faker'

class CreateDatabase

  def self.import
    5.times do
      user = User.create({:name => "#{Faker::Name.first_name} #{Faker::Name.last_name}"})
        3.times do
          list = List.create({:listname => Faker::Lorem.words(3).join(" ")})
          list.user = user
          list.save
          
          15.times do
            task = Task.create({:description => Faker::Lorem.words(5).join(" ")})
            task.list = list
            task.save
          end

      end
    end
  end
end

CreateDatabase.import
