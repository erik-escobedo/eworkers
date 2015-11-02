class Worker < ActiveRecord::Base
  devise :registerable

  belongs_to :user
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills

  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :at_least_one_skill

  has_attached_file :avatar, styles: {
    thumb: '45x45!',
    profile: '180x180!'
  }
  validates_attachment_content_type :avatar, {
    content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  }


  def self.with_skills(ids)
    joins('INNER JOIN skills_workers ON skills_workers.worker_id = workers.id').
      where('skills_workers.skill_id IN (?)', ids).
      group('workers.id').having('COUNT(workers.id) = ?', ids.count)
  end

  def as_json(options = {})
    super.merge({
      skills: skills.map(&:id),
      avatar: {
        profile: avatar.url(:profile),
        thumb:   avatar.url(:thumb),
      }
    })
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def skills_set
    skills.map(&:name).join(', ')
  end

  private
  def at_least_one_skill
    if skills.empty?
      errors.add(:skills, I18n.t('activerecord.errors.models.worker.skills.not_enough'))
    end
  end
end
