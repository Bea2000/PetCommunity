# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


administrator = User.new(
    email: 'administrator@petdccommunity.lol',
    name: 'Administrador Supremo',
    user_name: 'Admin',
    number: '1234567890',
    password: 'megaadmin',
    password_confirmation: 'megaadmin',
    admin_role: true
)

administrator.save!(validate: false)

josefa = User.new(
    email: 'josefa@petdccommunity.lol',
    name: 'Administradora Suprema',
    user_name: 'Josefa España',
    number: '21432413',
    password: 'megustanlosgatos',
    password_confirmation: 'megustanlosgatos',
    admin_role: true
)

josefa.save!(validate: false)

