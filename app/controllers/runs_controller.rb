class RunsController < ApplicationController
  require 'csv'
  require 'tempfile'

  def index
    @runs = Run.all
  end

  def upload
    start_time = Time.zone.now
    uploaded_file = params[:runs]

    # Added the csv test file to the tmp/db folder
    csv_file = File.join 'test', 'workers', uploaded_file.original_filename

    RunUploadWorker.perform_async(csv_file)
    end_time = Time.zone.now
    puts "Uploading with worker time: #{end_time - start_time}"
    flash[:notice] = 'Uploading runs'
    redirect_to runs_path
  end

  def upload_slow
    start_time = Time.zone.now
    uploaded_file = params[:runs]
    run_count = 0
    CSV.foreach(uploaded_file.open, headers: true) do |run|
      sleep 2
      Run.create(
        name: run['Name'],
        location: run['Location'],
        distance: run['Distance'],
        duration: run['Duration'],
        description: run['Description']
      )
      run_count += 1
    end
    end_time = Time.zone.now
    puts "Time to add: #{end_time - start_time}"
    flash[:notice] = 'Uploaded runs - refresh to check if runs are loaded'
    redirect_to runs_path
  end

  def destroy_all
    # only for testing purposes to be able to delete all runs imported and re-run import bc run validations
    Run.destroy_all
    puts "Destroyed all Runs"
    flash[:notice] = 'Deleted all runs'
    redirect_to runs_path
  end
end