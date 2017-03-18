class VisitorsController < ApplicationController
  def index
    @messages = Message.all
  end
end
