class CreateSupportTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :support_tickets, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :email, null: false
      t.text :description
      t.string :status, default: "new"

      t.timestamps
    end
  end
end
