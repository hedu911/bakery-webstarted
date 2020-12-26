module OvensHelper
  def cook
    return if self.cookie.nil?
    self.cookie.update_attribute(:status, "working")
    sleep(COOKING_TIME.minutes)
    self.cookie.update_attribute(:status, "finished")
  end
end