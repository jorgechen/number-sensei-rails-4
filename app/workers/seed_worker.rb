class SeedWorker
  include Sidekiq::Worker

  def perform(params)
    puts 'Seeding task with params:'
    puts params
    Barracks::build_all(params)
  end

end