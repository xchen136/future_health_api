# == Schema Information
#
# Table name: responses
#
#  id                :uuid             not null, primary key
#  support_ticket_id :uuid             not null
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Response < ApplicationRecord
  belongs_to :support_ticket
end
