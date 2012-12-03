class AddBioToBands < ActiveRecord::Migration
  def change
    add_column :bands, :bio, :text
  end
end
