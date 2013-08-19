class ExpressionsController < ApplicationController
  before_action :set_expression, only: [:show, :edit, :update, :destroy]

  # GET /expressions
  # GET /expressions.json
  def index
    @expressions = Expression.all
  end

  # GET /expressions/1
  # GET /expressions/1.json
  def show
  end

  # GET /expressions/new
  def new
    @expression = Expression.new
  end

  # GET /expressions/1/edit
  def edit
  end

  # POST /expressions
  # POST /expressions.json
  def create
    @expression = Expression.new(expression_params)

    respond_to do |format|
      if @expression.save
        format.html { redirect_to @expression, notice: 'Expression was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expression }
      else
        format.html { render action: 'new' }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expressions/1
  # PATCH/PUT /expressions/1.json
  def update
    respond_to do |format|
      if @expression.update(expression_params)
        format.html { redirect_to @expression, notice: 'Expression was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expressions/1
  # DELETE /expressions/1.json
  def destroy
    @expression.destroy
    respond_to do |format|
      format.html { redirect_to expressions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expression
      @expression = Expression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expression_params
      params.require(:expression).permit(:token, :type, :parent_id)
    end
end
