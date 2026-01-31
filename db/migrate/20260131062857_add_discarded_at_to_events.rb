class AddDiscardedAtToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :discarded_at, :datetime
  end
end
