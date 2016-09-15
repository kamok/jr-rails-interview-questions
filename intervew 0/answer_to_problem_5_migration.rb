class AddPrimaryHospitalToPhysician < ActiveRecord::Migration
  def change
    add_column :physicians, :primary_hospital_id, :integer

    Physician.find_each do |physician|
    	if physician.hospital_id?
    		physician.primary_hospital_id = physician.hospital_id
    		physician.save!
    	end
    end

  end
end
