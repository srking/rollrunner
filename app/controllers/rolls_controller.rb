class RollsController < ApplicationController
  before_action :set_roll, only: [:show, :edit, :update, :destroy]

  # GET /rolls
  # GET /rolls.json
  def index
    @rolls = Roll.all
  end

  # GET /rolls/1
  # GET /rolls/1.json
  def show
    @included_ingredients = @roll.ingredients.map do |i|
      i.id
    end
  end

  # GET /rolls/new
  def new
    @roll = Roll.new
  end

  # GET /rolls/1/edit
  def edit
  end

  # POST /rolls
  # POST /rolls.json
  def create
    @order = Order.find(params[:order_id])
    @roll = @order.rolls.create(roll_params)
    @roll.owner = current_user
    Ingredient.all do |ingredient|
      @roll.ingredients << ingredient
    end

    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'Roll was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :new }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rolls/1
  # PATCH/PUT /rolls/1.json
  def update
    respond_to do |format|
      @roll.ingredients.clear
      params[:roll][:ingredients].each do |ingredient_id|
        if ingredient = Ingredient.where(:id => ingredient_id).first
          @roll.ingredients << ingredient
        end
      end
      if @roll.update(roll_params)
        format.html { redirect_to @roll, notice: 'Roll was successfully updated.' }
        format.json { render :show, status: :ok, location: @roll }
      else
        format.html { render :edit }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rolls/1
  # DELETE /rolls/1.json
  def destroy
    @roll.roll_ingredients.destroy
    @roll.destroy
    respond_to do |format|
      format.html { redirect_to order_url(@roll.order), notice: 'Roll was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll
      @roll = Roll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_params
      params.permit(:order_id)
    end
end
