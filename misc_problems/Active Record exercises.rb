# 1. Query all users who made three post in three weeks

user_ids_three_weeks = Post.all.where("created_at < ?", Time.now !!!!).map(&:user_id)

3_post_in_three_weeks = user_ids_three_weeks.select { |id| user_ids_three_weeks.count(id) >= 3 }

Users.all.where(3_post_in_three_weeks).map(&:name)

# 2. List of address of pet owners whose appointment has been overdue for 5 days

Appointments: date, time, next_visit_date, client_id
Clients: name, type, last_visited, address, pet_name

client_ids_of_overdue_appointments = Appointments.all.where( Date.next_visit_date > Date.today + 5.days_from_now ).map(&:client_id)
 
Clients.all.where(client_ids_of_overdue_appointments).map(&:address)