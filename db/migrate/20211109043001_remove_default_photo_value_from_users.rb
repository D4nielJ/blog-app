class RemoveDefaultPhotoValueFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :photo, :string, default: ''
  end
end
