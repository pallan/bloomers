class ReportsController < ApplicationController
  def index
  end

  def product_count
    respond_to do |format|
      format.csv do
        require 'csv'
        csv_string =  CSV.generate do |csv|
                        csv << ['Plant', 'Count']

                        line_item_relation = LineItem.includes(:order).where("orders.status='open'").group(:plant_id)
                        line_item_relation = line_item_relation.where("orders.group_id = ?", params[:group_id]) if params[:group_id]
                        line_item_relation.sum(:quantity).each do |id,c|
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
