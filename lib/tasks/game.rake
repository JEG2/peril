namespace :game do
  desc "Loads a game into the database from PERIL_GAME_FILE"
  task :load => :environment do
    loader = GameLoader.new(reload: ENV.fetch("PERIL_RELOAD_GAME") { false })
    begin
      loader.configure_from_file(ENV.fetch("PERIL_GAME_FILE"))
    rescue KeyError
      abort "Specify the PERIL_GAME_FILE to load."
    end

    game = loader.load
    if game.new_record?
      puts game.errors.full_messages
    end
  end
end
