0.upto(29) do |idx|
  Member.create(
    name: "John#{idx + 1}",
    email: "John#{idx + 1}@example.com",
    administrator: (idx == 0),
    password: "password",
  )
end