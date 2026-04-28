class Employee < ApplicationRecord
  belongs_to :department
  has_many :attendancerecords
  has_many :payslips
end
