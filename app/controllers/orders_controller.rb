class OrdersController < ApplicationController

  before_filter :set_group
  before_filter :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @group.orders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end
  
  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @group.orders.build(params[:order])
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to [@group, @order], notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to [@group, @order], notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to group_orders_url(@group) }
      format.json { head :no_content }
    end
  end

  protected

  def set_group
    # quick & dirty fix for the home page which will not have and id set
    @group =  if params[:group_id].nil? && params[:action] == 'index'
                Group.last
              else
                Group.find(params[:group_id])
              end
  end

  def set_order
    @order = @group.orders.find(params[:id])
  end
end
