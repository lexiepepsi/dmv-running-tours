class RunUploadWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require 'csv'

  def perform(csv_path)
    start_time = Time.zone.now

    CSV.foreach(csv_path, headers: true) do |run|
      sleep 2
      Run.create(
        name: run['Name'],
        location: run['Location'],
        distance: run['Distance'],
        duration: run['Duration'],
        description: run['Description']
      )
    end

    end_time = Time.zone.now
    puts "Time to add with batch/worker: #{end_time - start_time}"
  end
end