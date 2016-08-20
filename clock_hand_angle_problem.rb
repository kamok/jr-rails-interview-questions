# Example: Given a time, calculate the angle between the hour and minute hands.

# Eg. If 3:00 PM, angle formed between hands is 90 degrees. 
# If 3:15 PM, angle formed between hands is 90 degrees + 1/4 of 1/12 hours in degrees 

def calc_angle_of_time(time)
  hour, minute = time.split(":")[0].to_f, time.split(":")[1].to_f  

  minute_angle = ( minute/60 )* 360
  hour_angle = (((hour%12)/12) * 360) + (minute/60)*30

  puts (hour_angle - minute_angle) % 360 

  puts "minute angle is #{minute_angle}"
  puts "hour angle is #{hour_angle}"

end

calc_angle_of_time("12:45")