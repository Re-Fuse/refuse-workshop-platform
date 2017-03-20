class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user).all
    @cue = Cue.find_by(active: true)
  end

  def director
    @cues = Cue.order(:position).all
  end
end
