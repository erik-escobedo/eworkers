class Worker < ActiveRecord::Base
  devise :registerable

  belongs_to :user
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills

  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :at_least_one_skill

  def self.with_skills(ids)
    joins('INNER JOIN skills_workers ON skills_workers.worker_id = workers.id').
      where('skills_workers.skill_id IN (?)', ids).
      group('workers.id').having('COUNT() = ?', ids.count)
  end

  private
  def at_least_one_skill
    if skills.empty?
      errors.add(:skills, I18n.t('activerecord.errors.models.worker.skills.not_enough'))
    end
  end
end
