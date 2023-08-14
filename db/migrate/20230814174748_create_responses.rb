class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :support_ticket, null: false, foreign_key: true, type: :uuid
      t.text :description

      t.timestamps
    end
  end
end
