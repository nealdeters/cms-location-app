class CreateBrandUsers < ActiveRecord::Migration
  def change
    create_table :brand_users do |t|

      t.timestamps null: false
    end
  end
end
