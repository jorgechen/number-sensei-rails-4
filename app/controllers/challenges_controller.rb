class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :attempt]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.roots
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  # User does a challenge!
  def attempt
    @results = {}

    # Retrieve hash of {Question id => user's answer}
    @answers_hash = {}
    params.each_with_index do |(k,v), index|
      matches = k.match /^question_(\d+)$/
      if matches
        question_id = matches[1].to_i
        @answers_hash[question_id] = {
            answer: v,
            order: index + 1
        }
      end
    end

    # Record everything
    @challenge_attempt = @challenge.attempt(@answers_hash, current_user.id)

    # Parse the results
    @challenge_attempt.question_attempts.each do |question_attempt|
      @results[question_attempt.question_id] = question_attempt.to_hash
    end

    # Get list of questions
    @questions = @challenge.all_questions

    respond_to do |format|
      format.html { render json: @results }
      format.json { render json: @results }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def challenge_params
    params.require(:challenge).permit(:name, :checksum, :trick_id, :question_count)
  end
end
