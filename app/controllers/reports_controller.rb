class ReportsController < ApplicationController
  def index
  end

  def product_count
    respond_to do |format|
      format.csv do
        require 'csv'
        csv_string =  CSV.generate do |csv|
                        csv << ['Plant', 'Count']

                        LineItem.includes(:order).where("orders.status='open'").group(:plant_id).sum(:quantity).each do |id,c|
                          plant = Plant.find(id)
                          csv << [plant.name,c]
                        end
                      end
        
        send_data csv_string, 
                  :type => 'text/csv; charset=iso-8859-1; header=present', 
                  :disposition => "attachment; filename=product_count.csv" 
      end
    end
  end
end
