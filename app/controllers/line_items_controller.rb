class LineItemsController < ApplicationController

  before_filter :set_order

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = @order.line_items.build(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to group_order_path(@order.group, @order), notice: 'Line item was successfully created.' }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render group_order_path(@order.group, @order), error: "Line item could not be saved." }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to group_order_path(@order.group, @order), notice: 'Line item was successfully created.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def line_item_params
    params.require(:line_item).permit(:order_id, :plant_id, :quantity)
  end

end
