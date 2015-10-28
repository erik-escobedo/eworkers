class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
    end

    add_index :workers, :user_id, unique: true
  end
end
