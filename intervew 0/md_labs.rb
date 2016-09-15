##############################################################################
# The models below represent a basic patient specimen tracking system for a 
# hospital. A Patient submits a Specimen to a Physician who works at a 
# Hospital, and the Specimen's Results are reported for different Analytes and 
# their values. 
#
# All models have id and timestamp fields.
#
# Please answer the questions below. For the code-related questions, you can
# combine them in the code provided to you below, you don't need to 
# seperate them into different copies of the original codebase. 
#
#
# 1- Draw an ERD for the models above.
# 
# 2- Write an ActiveRecord query to grab all analyte names for a physician from 
# results reported in the first quarter of 2014. You can add code to models 
# (no adding/removing DB attributes) as you see fit. Place the code in a method
# titled 'result_analytes' in the Physician class.
#
# 3- Write an ActiveRecord query to get all results reported in the 775 area 
# code. Place the code in a method titled 'reno_results' in the Result class.
# 
# 4- Hospitals want to limit the type of Analytes tested by their Physicians. 
# Modify the schema to accomodate this. You can add/remove/modify models 
# as you see fit.
# 
# 5- Physicians are now allowed to work at multiple hospitals, and can designate 
# a single hospital as their primary hospital. Write an ActiveRecord migration 
# that would add this functionality without losing any current data. If a 
# physician belongs to a hospital before the migration, make that hospital 
# their primary hospital.
# 
# 6- What do you dislike the most about Ruby/RoR?
##############################################################################

# other attributes: result_value:integer, reported_at:datetime
# attributes from given associations: speciman_id, analyte_id

# I was very impressed with your grasp of Javascript and front end design looking at your personal website and completed projects. 
# However, looking at your coding challenge, I was looking for a developer who had a better grasp of some of the intermediate Rails concepts. 
# For example, the ‘includes’ method could have be used for the reno_results method to write a more efficient query that hits the DB less. 
# I would recommend reading up on the ‘includes’ and ‘joins’ ActiveRecord methods for building queries like that.

class Result < ActiveRecord::Base
  belongs_to :specimens
  belongs_to :analyte

  def self.q1_2014
    where(reported_at: Time.new(2014,06).beginning_of_quarter..Time.new(2014,06).end_of_quarter)
  end

  def self.reno_results(area_code)
    patient_ids_living_in_area_code = Patient.living_in_area_code(area_code)
    specimen_id = Speciman.where(patient_id: patient_ids_living_in_area_code).map(&:id)   #speciman id provided by those patients 
    Result.where(speciman_id: specimen_id)
  end

end

# other attributes: analyte_name:string, result_range:string
class Analyte < ActiveRecord::Base
  has_many :results

end

# other attributes: sample_name:string, date_received:date, sample_type:string 
# attributes from given associations: physician_id, patient_id
class Speciman < ActiveRecord::Base
  belongs_to :physician
  has_many :results
end

# other attributes: patient_name:string, patient_address:string, patient_phone_number:string
# attributes from given associations: physician_id
class Patient < ActiveRecord::Base
  belongs_to :physician
  has_many :specimens

  def self.living_in_area_code(area_code)
    patient_id = []
    Patient.all.map do |patient|
      if patient.patient_address.split(" ").last == area_code.to_s
        patient_id << patient.id
      end
    end
    patient_id
  end
end

# other attributes: physician_name:string, physician_phone_number:string, physician_type:string
# attributes from given associations: hospital_id, primary_hospital_id
class Physician < ActiveRecord::Base
  has_many :specimens
  belongs_to :hospital
  has_many :results, through: :specimens

  validates :physician_phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, 
    message: "bad format" }

  #ActiveRecord query to grab all analyte names for a physician from 
  #results reported in the first quarter of 2014.
  def self.results_analytes(physician_id)
    results_of_q1_2014 = 
    Physician.where(id: physician_id).map(&:results).first #The .first gets the active record object out of the array
    .where(reported_at: Time.new(2014,06).beginning_of_quarter..Time.new(2014,06).end_of_quarter)
    
    Analyte.where(id: results_of_q1_2014).pluck(:analyte_name)
  end
end

# other attributes: hospital_name:string, hospital_address:string, 
# new attribute: allowed_analytes:array (assuming postgres)
class Hospital < ActiveRecord::Base
  has_many :physicians

  def self.available_analytes_ids(hospital_id)
    analyte_ids = Hospital.find_by(id: hospital_id).allowed_analytes # => [1,2,3]
  end
end

