class CreateCaptureImages < ActiveRecord::Migration[5.0]
  def change
    create_table :capture_images do |t|
      t.text       :content
      t.integer    :role
      t.references :prototype, foreign_key: true
      t.timestamps
    end
  end
end
