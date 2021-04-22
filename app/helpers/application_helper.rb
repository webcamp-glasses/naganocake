module ApplicationHelper
  
  def full_name
    (last_name + first_name).to_s
  end
end
