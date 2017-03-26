class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user).order(:id).all
    @cue = Cue.find_by(active: true)
  end

  def director
    raise 'Only directors' unless current_user.director?
    @cues = Cue.order(:position).all
  end
end
