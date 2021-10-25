require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  # Sauvegarde chaque gossip dans un fichier csv, n'écrase pas les lignes ayant déjà du contenu
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  # Enregistre tous les gossips dans un array
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      gossip = Gossip.new(csv_line[0], csv_line[1])
      all_gossips << gossip
    end
    return all_gossips
  end

  # Affiche les gossip un par un
  def self.find(id)
    all_gossips = self.all
    n = id.to_i
    n = n - 1
    puts all_gossips[n].author
    puts all_gossips[n].content
    return all_gossips[n]
  end

  def self.edit(id, content_update)
    n = id.to_i - 1
    gossips = self.all
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each.with_index do |x| 
        if n == gossips.index(x)
          csv << [x.author, content_update]
        else
          csv << [x.author, x.content]
        end
      end
    end
  end
end # class
