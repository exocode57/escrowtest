class AddAdminToStuff < ActiveRecord::Migration[7.0]
  def change
    add_reference :stuffs, :admin, index: true
  end
end
