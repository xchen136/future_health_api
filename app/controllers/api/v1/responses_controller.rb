class Api::V1::ResponsesController < ApplicationController
  before_action :set_support_ticket, only: [:create]

  def create
    @response = Response.new(response_params)
    
    if @response.save
      render json:@response, status: :created
    else
      render json:@response.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_ticket
      @support_ticket = SupportTicket.find(params[:support_ticket_id])
      return render json: {error: "Support ticket not found"}, status: :not_found if @support_ticket.nil?
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.permit(:support_ticket_id, :description)
    end
end
