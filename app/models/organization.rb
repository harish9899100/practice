class Organization < ApplicationRecord
  has_many :departments
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "updated_at", "department_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["departmes"]
  end
end
