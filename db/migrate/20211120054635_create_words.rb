class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.text       :jiantizi
      t.text       :fantizi
      t.text       :english
      t.text       :pronunciation_c
      t.text       :pronunciation_e
      t.integer    :category_id
      t.text       :mean
      t.text       :memo
      t.references :user, null: false, oreign_key: true
      t.timestamps
    end
  end
end
