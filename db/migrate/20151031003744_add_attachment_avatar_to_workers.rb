class AddAttachmentAvatarToWorkers < ActiveRecord::Migration
  def self.up
    change_table :workers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :workers, :avatar
  end
end
