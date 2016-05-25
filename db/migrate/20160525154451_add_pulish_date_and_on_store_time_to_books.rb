class AddPulishDateAndOnStoreTimeToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publish_date, :date
    add_column :books, :on_store_time, :datetime
  end
end
