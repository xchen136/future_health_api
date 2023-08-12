# == Schema Information
#
# Table name: support_tickets
#
#  id          :uuid             not null, primary key
#  name        :string
#  email       :string           not null
#  description :text
#  status      :string           default("new")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SupportTicket < ApplicationRecord
end
