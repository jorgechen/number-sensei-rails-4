class BackgroundJob < ActiveRecord::Base

  def start
    update_attribute :in_progress, true
  end

  def stop
    update_attribute :in_progress, false
  end

  def set_total(new_total)
    update_attribute :total, new_total
  end

  def set_progress(new_progress)
    update_attribute :progress, new_progress
  end
end
