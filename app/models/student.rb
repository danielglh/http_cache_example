class Student < ActiveRecord::Base

  enum status: [:registered, :unregistered]

  after_initialize do
    self.status ||= :registered
  end

end
