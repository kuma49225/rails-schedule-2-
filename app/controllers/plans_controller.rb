class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:notice_create] = "スケジュールを登録しました"
      redirect_to :plans
    else
      flash[:notice_no_create] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      flash[:notice_update] = "スケジュールを更新しました"
      redirect_to :plans
    else
      flash[:notice_no_update] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice_destroy] = "スケジュールを削除しました"
    redirect_to :plans
  end

  private
  def plan_params  # プライベートメソッド 
    params.require(:plan).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end

end
