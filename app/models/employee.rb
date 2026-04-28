class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :position
  has_many :attendancerecords
  has_many :payslips
end
