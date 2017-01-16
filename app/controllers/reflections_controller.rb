class ReflectionsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_reflection, only: [:show, :update, :destroy]

  # GET /reflections
  def index
    @reflections = Reflection.where(user: @current_user)

    render json: @reflections
  end

  # GET /reflections/1
  def show
    render json: @reflection
  end

  # POST /reflections
  def create
    @reflection = Reflection.new(body: reflection_params[:body])
    @reflection.skills = Skill.find(reflection_params[:skill_ids])
    @reflection.user = @current_user
    if @reflection.save
      render json: @reflection, status: :created, location: @reflection
    else
      render json: @reflection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reflections/1
  def update
    if @reflection.update(reflection_params)
      render json: @reflection
    else
      render json: @reflection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reflections/1
  def destroy
    @reflection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reflection
      @reflection = Reflection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reflection_params
      params.fetch(:reflection, {})
    end
end
