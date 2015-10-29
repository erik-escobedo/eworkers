class CreateSkillsWorkers < ActiveRecord::Migration
  def change
    create_table :skills_workers, id: false do |t|
      t.references :worker
      t.references :skill
    end

    add_index :skills_workers, :worker_id
    add_index :skills_workers, :skill_id
    add_index :skills_workers, [:worker_id, :skill_id], unique: true
  end
end
