class AddThienntTable < ActiveRecord::Migration[5.2]
  def change
    # create_table :thiennts do |t|
    #   t.integer :origin_index
    #   t.integer :dest_index
    #   t.json :data, null: false, default: '{}'
    # end

    create_table :distance_data do |t|
      t.string :origin
      t.string :dest
      t.string :distance_text
      t.string :distance_value
    end
  end
end
