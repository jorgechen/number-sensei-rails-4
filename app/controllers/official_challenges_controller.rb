class OfficialChallengesController < ApplicationController
  before_action :set_official_challenge, only: [:show, :edit, :update, :destroy]

  # GET /official_challenges
  # GET /official_challenges.json
  def index
    @official_challenges = OfficialChallenge.all
  end

  # GET /official_challenges/1
  # GET /official_challenges/1.json
  def show
  end

  # GET /official_challenges/new
  def new
    @official_challenge = OfficialChallenge.new
  end

  # GET /official_challenges/1/edit
  def edit
  end

  # POST /official_challenges
  # POST /official_challenges.json
  def create
    @official_challenge = OfficialChallenge.new(official_challenge_params)

    respond_to do |format|
      if @official_challenge.save
        format.html { redirect_to @official_challenge, notice: 'Official challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @official_challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @official_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /official_challenges/1
  # PATCH/PUT /official_challenges/1.json
  def update
    respond_to do |format|
      if @official_challenge.update(official_challenge_params)
        format.html { redirect_to @official_challenge, notice: 'Official challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @official_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /official_challenges/1
  # DELETE /official_challenges/1.json
  def destroy
    @official_challenge.destroy
    respond_to do |format|
      format.html { redirect_to official_challenges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_official_challenge
      @official_challenge = OfficialChallenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def official_challenge_params
      params.require(:official_challenge).permit(:upload, :name, :release_date, :grade_level, :difficulty, :event, :category_id, :location)
    end
end
