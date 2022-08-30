class RemoveImgFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :img：string, :string
  end
end
