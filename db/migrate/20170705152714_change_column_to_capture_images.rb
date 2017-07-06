class ChangeColumnToCaptureImages < ActiveRecord::Migration[5.0]
  def change
    change_column :capture_images, :role, :integer, default: 0, null: false, limit: 1
  end
end
