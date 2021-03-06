class Project < ApplicationRecord
  ACTIVE = "Active"
  INACTIVE  = "Inactive"
  COMPLETED = "Completed"

  has_many :site_projects
  has_many :sites, through: :site_projects
  has_many :proposals, dependent: :destroy
  has_many :contractors, through: :proposals

  validates :name, :project_type, :project_status, presence: true

  def hub
    if self.sites.any? && self.sites.first.participant && self.sites.first.participant.hub
      self.sites.first.participant.hub
    else
      nil
    end
  end
end
