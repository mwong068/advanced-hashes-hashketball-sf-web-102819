require "pry"

def game_hash
  
	basketball_game = {
	  :home => {
	    :team_name => "Brooklyn Nets", 
	    :colors => ["Black", "White"], 
	    :players => {
	      "Alan Anderson" => {
	      :number => 0,
	      :shoe => 16, 
	      :points => 22, 
	      :rebounds => 12, 
	      :assists => 12, 
	      :steals => 3, 
	      :blocks => 1, 
	      :slam_dunks => 1},
	      "Reggie Evans" => {
	        :number => 30, 
	        :shoe => 14, 
	        :points => 12, 
	        :rebounds => 12, 
	        :assists => 12, 
	        :steals => 12, 
	        :blocks => 12, 
	        :slam_dunks => 7},
	      "Brook Lopez" => {
	        :number => 11, 
	        :shoe => 17, 
	        :points => 17, 
	        :rebounds => 19, 
	        :assists => 10, 
	        :steals => 3, 
	        :blocks => 1, 
	        :slam_dunks => 15}, 
	      "Mason Plumlee" => {
	        :number => 1, 
	        :shoe => 19, 
	        :points => 26, 
	        :rebounds => 11, 
	        :assists => 6, 
	        :steals => 3, 
	        :blocks => 8, 
	        :slam_dunks => 5}, 
	      "Jason Terry" => {
	        :number => 31, 
	        :shoe => 15, 
	        :points => 19, 
	        :rebounds => 2, 
	        :assists => 2, 
	        :steals => 4, 
	        :blocks => 11, 
	        :slam_dunks => 1}
	    }
	  }, 
	  :away => {
	    :team_name => "Charlotte Hornets", 
	    :colors => ["Turquoise", "Purple"], 
	    :players => { 
	      "Jeff Adrien" => {
	        :number => 4, 
	        :shoe => 18, 
	        :points => 10, 
	        :rebounds => 1, 
	        :assists => 1, 
	        :steals => 2, 
	        :blocks => 7, 
	        :slam_dunks => 2}, 
	      "Bismack Biyombo" => {
	        :number => 0, 
	        :shoe => 16, 
	        :points => 12, 
	        :rebounds => 4, 
	        :assists => 7, 
	        :steals => 22, 
	        :blocks => 15, 
	        :slam_dunks => 10}, 
	      "DeSagna Diop" => {
	        :number => 2, 
	        :shoe => 14, 
	        :points => 24, 
	        :rebounds => 12, 
	        :assists => 12, 
	        :steals => 4, 
	        :blocks => 5, 
	        :slam_dunks => 5},
	      "Ben Gordon" => {
	        :number => 8, 
	        :shoe => 15, 
	        :points => 33, 
	        :rebounds => 3, 
	        :assists => 2, 
	        :steals => 1, 
	        :blocks => 1, 
	        :slam_dunks => 0}, 
	      "Kemba Walker" => {
	        :number => 33, 
	        :shoe => 15, 
	        :points => 6, 
	        :rebounds => 12, 
	        :assists => 12, 
	        :steals => 7, 
	        :blocks => 5, 
	        :slam_dunks => 12}
	    }
	  }
	}
end


def num_points_scored(player_name_input)
  game_hash.each do |team_sides, team_info|
    team_info[:players].each do |player_name, player_info|
      if player_name == player_name_input
        return player_info[:points]
      end
    end
  end
end


def shoe_size(player_name_input)
  game_hash.each do |team_sides, team_info|
    team_info[:players].each do |player_name, player_info|
      if player_name == player_name_input
        return player_info[:shoe]
      end
    end
  end
end


def team_colors(team_name_input)
  game_hash.each do |team_sides, team_info|
    if team_info[:team_name] == team_name_input
      return team_info[:colors]
    end
  end
end


def team_names
  teams_by_name = []
  game_hash.each do |team_sides, team_info|
    teams_by_name.push(team_info[:team_name])
  end
  teams_by_name
end


def player_numbers(team_name_input)
  shirt_numbers = []
  game_hash.each do |team_sides, team_info|
    if team_info[:team_name] == team_name_input
      team_info[:players].each do |player_name, player_info|
        shirt_numbers.push(player_info[:number])
      end
    end
  end
  shirt_numbers
end


def player_stats(player_name_input)
  player_statistics = {}
  game_hash.each do |team_sides, team_info|
    team_info[:players].each do |player_name, player_info|
      if player_name == player_name_input
        player_staties = player_statistics.merge()
      end
    end
  end
  player_staties
end


### Find the number of rebounds associated with the player with the largest shoe size

def big_shoe_rebounds
  # Start with initial value assignments to be able to later update them and capture actual values
  big_shoe_player = nil
  big_shoe_player_rebounds = nil
  player_shoe_sizes = {}
  num_rebound = nil
  
  # Visit each player in the hash to populate the hash of player_shoe_sizes
  game_hash.each do |location, team_data|
    team_data[:players].each do |person_name, data|
      player_shoe_sizes = player_shoe_sizes.merge({person_name => data[:shoe]})
    end
  end
  
  # Once the player_shoe_sizes hash has been populated, find out the name of the player with the biggest shoe size
  big_shoe_player = player_shoe_sizes.max_by { |player, shoe_size| shoe_size }[0]

  # Once the name of that player has been established, find out the associated number of rebounds
  game_hash.each_key do |location|
    if (game_hash[location][:players]).include?(big_shoe_player)
      num_rebound = game_hash[location][:players][big_shoe_player][:rebounds]
    end
  end
  num_rebound
end


### Find the player who scores the most points

def most_points_scored
  player_points = {}
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |person_name, data|
      player_points = player_points.merge({person_name => data[:points]})
    end
  end
  highest_scorer = player_points.max_by { |player, score| score }[0]
end


### Find the team that has the most points

def winning_team
  home_score = 0
  home_team = game_hash[:home][:team_name]
  away_score = 0
  away_team = game_hash[:away][:team_name]
  
  (game_hash[:home][:players]).each do |person_name, data|
      home_score += data[:points]
    end
  (game_hash[:away][:players]).each do |person_name, data|
      away_score += data[:points]
    end
  team_scores = {home_team => home_score, away_team => away_score}
  highest_scoring_team = team_scores.max_by { |team, score| score }[0]
end


### Find the player with the longest name

def player_with_longest_name
  players = []
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |person_name, data|
      players = players.push(person_name)
    end
  end
  longest_name = players.max_by(&:length)
end


### If the player with the longest name had the most steals, return TRUE

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  result = false
  player_steals = {}
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |person_name, data|
      player_steals = player_steals.merge({person_name => data[:steals]})
    end
  end
  highest_stealer = player_steals.max_by { |player, steals| steals }[0]
  
  if longest_name == highest_stealer
    result = true
  else
    result
  end
end