class SeedWorker
  include Sidekiq::Worker

  def perform(params)
    name = params.keys.first
    background_job = BackgroundJob.create(name: name, description: params.to_s)
    background_job.start

    if params['tricks'] or params['trick']
      Barracks::build_tricks(background_job)
    else
      Barracks::build_all(params, background_job)
    end

    background_job.stop
  end

end