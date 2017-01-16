class SkillsController < ApplicationController
  before_action :authenticate_request!

  def index
    @skills = Skill.where(user: @current_user)
    render json: @skills
  end

  def show
    @skill = get_skill
    render json: @skill.as_json(include:[:activities])
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = @current_user
    if @skill.save
      render json: @skill
    end
  end

  def destroy
    @skill = get_skill
    @skill.destroy
  end

  private

  def get_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :desc)
  end
end
