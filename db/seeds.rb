# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create([{name: 'internal-client-only-for-idle-time'}, {name: 'Mike_C'}, {name: 'John_C'}])
Project.create([{ name: 'Idle Time', :client_id=>1}, { name: 'Amazon', :client_id=>2 }, { name: 'Shopify', :client_id=>2 }])
Country.create([{name:'China'},{name:'Fiji'},{name:'Israel'},{name: 'Malta'}])
Role.create([{name:'developer'},{name:'sysadmin'},{name:'sre'},{name:'manager'}]) 
Employee.create([{name: 'Walt_E', :country_id=>1,:role_id=>1},{name: 'Marie_E', :country_id=>2,:role_id=>2},{name: 'Paul_E', :country_id=>3,:role_id=>1}])
