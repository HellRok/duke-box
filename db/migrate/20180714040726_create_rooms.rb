class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :owner_uuid
      t.string :owner_ip

      t.timestamps
    end
  end
end
