Singles

1. find
# Find the client with primary key (id) 10.
client = Client.find(10)
# => #<Client id: 10, first_name: "Ryan">

# Find the clients with primary keys 1 and 10.
client = Client.find([1, 10]) # Or even Client.find(1, 10)
# => [#<Client id: 1, first_name: "Lifo">, #<Client id: 10, first_name: "Ryan">]

2. take
# Retrives record without ordering
client = Client.take(2)
# => [
  #<Client id: 1, first_name: "Lifo">,
  #<Client id: 220, first_name: "Sara">
]

3. first / last
client = Client.first(3)
# => [
  #<Client id: 1, first_name: "Lifo">,
  #<Client id: 2, first_name: "Fifo">,
  #<Client id: 3, first_name: "Filo">
]

client = Client.last(3)
# => [
  #<Client id: 219, first_name: "James">,
  #<Client id: 220, first_name: "Sara">,
  #<Client id: 221, first_name: "Russel">
]

4. find_by

Client.find_by first_name: 'Lifo'
# => #<Client id: 1, first_name: "Lifo">

Batches

1. find_each

#In the following example, find_each will retrieve 1000 records (the current default for both find_each and find_in_batches) and then yield each record individually to the block as a model. This process is repeated until all of the records have been processed:

User.find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

#To add conditions to a find_each operation you can chain other Active Record methods such as where:

User.where(weekly_subscriber: true).find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

#start and batch_size: starting at id number 2000, and retrieve in batches of 5000
User.find_each(start: 2000, batch_size: 5000) do |user|
  NewsMailer.weekly(user).deliver_now
end

Conditions

1. where
#This will find all clients where the orders_count field's value is 2.

Client.where("orders_count = '2'")

2. Array conditions (?)
Client.where("orders_count = ? AND locked = ?", params[:orders], false)

3. Hash conditions
Client.where('locked' => true)

4. Range conditions
Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
This will find all clients created yesterday

5. Subset conditions
Client.where(orders_count: [1,3,5])

Ordering

1. specific orders
#single field
Client.order(created_at: :desc) or Client.order(created_at: :asc)

#multiple fields
Client.order(orders_count: :asc, created_at: :desc)

