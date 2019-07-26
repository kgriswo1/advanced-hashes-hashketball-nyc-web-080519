require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [ 
        {
          "Alan Anderson" => {
              :number => 0,
              :shoe => 16,
              :points => 22,
              :rebounds => 12,
              :assists => 12,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 1
          }
        },
        {
          "Reggie Evans" => {
              :number => 30,
              :shoe => 14,
              :points => 12,
              :rebounds => 12,
              :assists => 12,
              :steals => 12,
              :blocks => 12,
              :slam_dunks => 7
          }
        },
        {
          "Brook Lopez" => {
              :number => 11,
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15
          }
        },
        {
          "Mason Plumlee" => {
              :number => 1,
              :shoe => 19,
              :points => 26,
              :rebounds => 11,
              :assists => 6,
              :steals => 3,
              :blocks => 8,
              :slam_dunks => 5
          }
        },
        {
          "Jason Terry" => {
              :number => 31,
              :shoe => 15,
              :points => 19,
              :rebounds => 2,
              :assists => 2,
              :steals => 4,
              :blocks => 11,
              :slam_dunks => 1
          }
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {
            "Jeff Adrien" => {
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
            }
          },
          {
            "Bismack Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10
            }
          },
          {
            "DeSagna Diop" => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
            }
          },
          {
            "Ben Gordon" => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
            }
          },
          {
            "Kemba Walker" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
            }
          }
      ]
    }
  }
  game
end

def num_points_scored(players_name)
  game = game_hash
  players_arr = game[:home][:players] + game[:away][:players]
  players_arr.each do |hash|
    hash.each do |player, value|
        if player == players_name
            return value[:points]
        end
    end
  end
end

def shoe_size(players_name)
  game = game_hash
  players_arr = game[:home][:players] + game[:away][:players]
  players_arr.each do |hash|
    hash.each do |player, value|
        if player == players_name
            return value[:shoe]
        end
    end
  end
end

def team_colors(the_team_name)
  game = game_hash
  if game[:home][:team_name] == the_team_name
    return game[:home][:colors]
  else
    return game[:away][:colors]
  end
end

def team_names
  game = game_hash
  name = []
  name.push(game[:home][:team_name], game[:away][:team_name])
  name
end

def player_numbers(the_team_name)
  game = game_hash
  jersey = []
  
  home_name = game[:home][:team_name]
  away_name = game[:away][:team_name]
  
  if home_name == the_team_name
    players = game[:home][:players]
  else
    players = game[:away][:players]
  end
  
  players.each do |ele|
    ele.each do |name, stats|
      jersey << stats[:number]
    end
  end
  jersey
end

def player_stats(players_name)
  game = game_hash
  players = game[:home][:players] + game[:away][:players]
  
  players.each do |hash|
    hash.each do |name, stats|
      if name == players_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  game = game_hash
  players = game[:home][:players] + game[:away][:players]
  shoe_size = 0
  
  players.each do |hash|
    hash.each do |name, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
      end
    end
  end
  
  players.each do |hash|
    hash.each do |name, stats|
      if stats[:shoe] == shoe_size
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  game = game_hash
  players = game[:home][:players] + game[:away][:players]
  points = 0
  
  players.each do |hash|
    hash.each do |name, stats|
      if stats[:points] > points
        points = stats[:points]
      end
    end
  end
  
  players.each do |hash|
    hash.each do |name, stats|
      if stats[:points] == points
        return name
      end
    end
  end
end

def winning_team
  game = game_hash
  home_team = game[:home][:players]
  away_team = game[:away][:players]
  
  home_points = 0
  away_points = 0
  
  home_team.each do |hash|
    hash.each do |name, stats|
      home_points += stats[:points]
    end
  end
  
  away_team.each do |hash|
    hash.each do |name, stats|
      away_points += stats[:points]
    end
  end
  
  if away_points > home_points
    return game[:away][:team_name]
  else
    return game[:home][:team_name]
  end
end

def player_with_longest_name
  game = game_hash
  players = game[:home][:players] + game[:away][:players]
  long_name = ""
  
  players.each do |hash|
    hash.each do |name, stats|
      if name.length > long_name.length
        long_name = name
      end
    end
  end
  long_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  game = game_hash
  players = game[:home][:players] + game[:away][:players]
  steals = 0
  
  players.each do |hash|
    hash.each do |name, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
      end
    end
  end
  
  players.each do |hash|
    hash.each do |name, stats|
      if name == long_name
        return stats[:steals] == steals
      end
    end
  end
end

# def good_practices
#   game_hash.each do |location, team_data|
#     binding.pry
#     team_data.each do |attribute, data|
#       binding.pry
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end

# good_practices








