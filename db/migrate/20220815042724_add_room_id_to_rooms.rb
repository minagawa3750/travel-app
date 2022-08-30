class AddRoomIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_id, :string
  end
end
