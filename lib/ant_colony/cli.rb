require 'thor'
require 'yaml'

module AntColony
  class CLI < Thor
    desc 'solve [FILE_NAME, START_POINT]', 'find the shortest path for graph from start point'

    option :alpha, type: :numeric, desc: 'alpha param'
    option :beta,  type: :numeric, desc: 'beta param'
    option :ph,    type: :numeric, desc: 'pheromone constant'
    option :q,     type: :numeric, desc: 'Q'
    option :pop,   type: :numeric, desc: 'number of ants'

    def solve(file, point)
      params = options.map { |k, v| [k.to_sym, v] }.to_h
      graph  = YAML.load_file(file)
      colony = AntColony::Colony.new(graph, **params)
      colony.solve
      $stdout.puts colony.find_path(point.to_i)
    end
  end
end
