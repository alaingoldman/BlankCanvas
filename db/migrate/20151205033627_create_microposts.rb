class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :message
      t.string :email

      t.timestamps
    end
  end
end
