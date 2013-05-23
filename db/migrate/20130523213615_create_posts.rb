class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :from
      t.string :message
      t.string :link
      t.string :facebook_id

      t.timestamps
    end
  end
end
