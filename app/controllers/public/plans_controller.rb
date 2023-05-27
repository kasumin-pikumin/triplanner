class Public::PlansController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @plans = current_user.plans
  end

  def show
    @plan = Plan.find(params[:id])
    @plan_days = @plan.plan_days
  end

  def new
    @plan = Plan.new
    @plan_day = @plan.plan_days.build
    @plan_detail = @plan_day.plan_details.build
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save!
      redirect_to plan_path(@plan.id)
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
    @plan_days = @plan.plan_days
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to plan_path(@plan.id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan)
    .permit(:id, :user_id, :name, :first_day, :last_day, :_destroy, plan_days_attributes: [:id, :plan_id, :day, :_destroy, plan_details_attributes: [:id, :plan_day_id, :start_time, :end_time, :purpose ,:_destroy]])
    .merge(user_id: current_user.id)
  end

end