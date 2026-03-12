class Admin::EventsController < Admin::ApplicationController
  def index
    @events = Event.kept.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to admin_event_path(@event), notice: "イベントを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: "イベントを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.update(discarded_at: Time.current)

    redirect_to admin_events_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :held_on,
      :organizer_name,
      :target_department
    )
  end
end