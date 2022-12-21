# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: 'aaaaaa',
)

User.create!(
   last_name: '太郎',
   first_name: 'テスト',
   last_name_kana: 'たろう',
   first_name_kana: 'てすと',
   email: 'aaa@aaa.com',
   encrypted_password:'aaaaaa',
   postal_code: 'aaaaaaaaaaa',
   address: 'aaaaaaaaaa',
   telephone_number: '00000000000',
   )