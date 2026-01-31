class Admin::EventsController < Admin::ApplicationController
  def index
    @events = Event.kept.order(created_at: :desc)
  end

  def show
    @event = Event.kept.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path, notice: "イベントを登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.kept.find(params[:id])
  end

  def update
    @event = Event.kept.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_events_path, notice: "イベントを更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  # 論理削除
  def destroy
    event = Event.kept.find(params[:id])
    event.update!(discarded_at: Time.current)
    redirect_to admin_events_path, notice: "イベントを削除しました"
  end

  private

  def event_params
    params.require(:event).permit(:name, :held_on, :organizer, :target, :description)
  end
end
