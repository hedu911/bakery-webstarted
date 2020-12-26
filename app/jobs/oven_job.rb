require 'resque-lock-timeout'
class OvenJob
  extend Resque::Plugins::LockTimeout
  @queue = :default
  def self.perform(id)
    oven = Oven.find_by_id(id)
    oven.cook
  end
end
