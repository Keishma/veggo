class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Turn off sql queries in logs

  old_logger = ActiveRecord::Base.logger
  ActiveRecord::Base.logger = nil


  # Turn sql logs back on, need to restart rails

  # ActiveRecord::Base.logger = old_logger

end
