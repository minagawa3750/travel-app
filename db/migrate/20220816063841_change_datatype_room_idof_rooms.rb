class ChangeDatatypeRoomIdofRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :room_id, :integer
  end
end
