class AddMemberToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :member, :integer
  end
end
