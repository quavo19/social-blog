# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.create(name: 'Donald', photo: 'https://images.unsplash.com/photo-1681958758179-207ff9bd9362?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80', bio: 'Teacher from Mexico.', email: 'teacher@gmail.com', password: '1212')
second_user = User.create(name: 'Akite', photo: 'https://images.unsplash.com/photo-1682205595406-0978ff7b7709?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80', bio: 'Doctor from Spain.')
third_user = User.create(name: 'john', photo: 'https://plus.unsplash.com/premium_photo-1675461594405-21b579d0aaae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTB8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60', bio: 'Doctor from Mexico.')
fourth_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1681860317700-1b033c2c2a9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', bio: 'Teacher from Mexico.')
