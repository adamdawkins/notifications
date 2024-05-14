class CreateChangeOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :change_orders do |t|
      t.boolean :amount_changed
      t.boolean :material_changed
      t.boolean :work_order_changed

      t.timestamps
    end
  end
end
