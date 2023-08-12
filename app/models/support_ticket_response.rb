# == Schema Information
#
# Table name: support_ticket_responses
#
#  id                :uuid             not null, primary key
#  support_ticket_id :uuid             not null
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class SupportTicketResponse < ApplicationRecord
  belongs_to :support_ticket
end
