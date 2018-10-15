class TicketsController < ApplicationController
  def complete
    params[:ids].each do |id|
      ticket = Ticket.find_by(id: id)
      ticket.update(status: 1)
    end
    redirect_to '/'
  end
end
