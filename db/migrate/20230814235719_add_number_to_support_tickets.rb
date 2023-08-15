class AddNumberToSupportTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :support_tickets, :number, :integer, null: false
  end
end
