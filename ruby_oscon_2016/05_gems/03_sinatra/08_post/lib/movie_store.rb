require 'yaml/store'

class MovieStore

  def initialize(file_name)
    @store = YAML::Store.new(file_name)
  end

  def find(id)
    @store.transaction do
      @store[id]
    end
  end

  def all
    @store.transaction do
      @store.roots.map { |id| @store[id] }
    end
  end

  def save(movie)
    @store.transaction do
      unless movie.id
        highest_id = @store.roots.max || 0
        movie.id = highest_id + 1
      end
      @store[movie.id] = movie
    end
  end

end
