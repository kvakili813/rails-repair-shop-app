class TicketsController < ApplicationController
  def complete
    if params[:ids] != nil
      params[:ids].each do |id|
      ticket = Ticket.find_by(id: id)
      ticket.update(status: 1)
      end
    end
    redirect_to '/'
  end
end
