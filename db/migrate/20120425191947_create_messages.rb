class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to  :recipient
      t.string      :subject
      t.text        :message
      t.datetime    :sent_at

      t.timestamps
    end
    add_index :messages, :recipient_id
  end
end
