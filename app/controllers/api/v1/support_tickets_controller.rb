class Api::V1::SupportTicketsController < ApplicationController
  before_action :set_support_ticket, only: [:update]

  # GET /support_tickets 
  def index
    @support_tickets = SupportTicket.all
    render json: @support_tickets
  end

  # POST /support_tickets 
  def create
    @support_ticket = SupportTicket.new(support_ticket_params)
    @support_ticket.number = SupportTicket.all.length + 1

    if @support_ticket.save
      render json:@support_ticket, status: :created
    else
      render json:@support_ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /support_tickets/1 
  def update
    if @support_ticket.update(support_ticket_params)
      render json: @support_ticket
    else
      render json: @support_ticket.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_ticket
      @support_ticket = SupportTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_ticket_params
      params.require(:support_ticket).permit(:name, :email, :description, :status)
    end
end
