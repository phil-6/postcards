class CreatePostcards < ActiveRecord::Migration[5.2]
  def change
    create_table :postcards do |t|

      t.belongs_to :user
      t.integer :sent_to
      t.datetime :sent_at
      t.string :from_location
      t.text :message
      t.string :image_link

      t.timestamps
    end
  end
end
