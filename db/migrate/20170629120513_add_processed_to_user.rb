class AddProcessedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :processed_image, :boolean
  end
end
