class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description
      t.bigint :user_id, null: false, index: true

      t.timestamps
    end
  end
end
