# product = Product.new(name: "Name 1", description: "Description 1", price: 59.99)

User.create!(
  [
    { first_name: 'John', last_name: "do", email: "JOHN@example.com", password: "password"},
    { first_name: 'jeff', last_name: "do", email: "jeff@example.com", password: "password"}
  ]
)

john = User.first
jeff = User.last

products = Product.create(
  [
    {name: "Name 1", description: "Description 1", price: 59.99, quantity: 9, user_id: john.id },
    {name: "Name 2", description: "Description 2", price: 59.99, quantity: 5, user_id: john.id  },
    {name: "Name 3", description: "Description 13", price: 59.99, quantity: 4, user_id: john.id  },
    {name: "Name 4", description: "Description 41", price: 59.99, quantity: 5, user_id: jeff.id },
    {name: "Name 5", description: "Description 16", price: 59.99, quantity: 8, user_id: jeff.id }
  ]
)