class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string     :post_code,      null: false
      t.integer    :region_id,      null: false
      t.string     :manicipalities, null: false
      t.string     :address,        null: false
      t.string     :phone_number,   null: false
      t.string     :building
      t.references :buyer,          foreign_key: true



      t.timestamps
    end
  end
end
