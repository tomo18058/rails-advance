class Public::EventsController < ApplicationController
  def index
    @events = Event.kept.order(held_on: :desc)
  end

  def show
    @event = Event.kept.find(params[:id])
  end
end