class AddPhoneNumberToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :phone_number, :string
  end
end
