require 'csv'
module ReportsHelper
  def product_counts_as_csv
    CSV.generate do |csv|
      csv << ['Plant', 'Count']
      
      LineItem.group(:plant_id).count.each do |id,c|
        plant = Plant.find(id)
        csv << [plant.name,c]
      end
    end
    
  end
  
end
