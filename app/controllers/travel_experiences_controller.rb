class TravelExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_travel_experience, only: %i[ show update destroy ]

  # GET /travel_experiences
  def index
    # @travel_experiences = TravelExperience.all
    @travel_experiences = current_user.travel_experiences

    render json: @travel_experiences, status: :ok
  end

  # GET /travel_experiences/1
  def show
    render json: @travel_experience, status: :ok
  end

  # POST /travel_experiences
  def create
    # @travel_experience = TravelExperience.new(travel_experience_params)
    @travel_experience = current_user.travel_experiences.new(travel_experience_params)


    if @travel_experience.save
      render json: @travel_experience, status: :ok
    else
      render json: { data: @travel_experience.errors.full_messages, status: "failed" }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /travel_experiences/1
  def update
    if @travel_experience.update(travel_experience_params)
      render json: @travel_experience, status: :ok
    else
      render json: { data: @travel_experience.errors.full_messages, status: "failed" }, status: :unprocessable_entity
    end
  end

  # DELETE /travel_experiences/1
  def destroy
    if @travel_experience.destroy
      render json: { data: 'Travel experience deleted successfully', status: 'sucess' }, status: :ok
    else
      render json: { data: 'Something went wrong', status: 'failed' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_experience
      # @travel_experience = TravelExperience.find(params[:id])
      @travel_experience = current_user.travel_experiences.find(params[:id])

      rescue ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized
    end

    # Only allow a list of trusted parameters through.
    def travel_experience_params
      params.require(:travel_experience).permit(:title, :description, :image_url, :user_id)
    end
end
