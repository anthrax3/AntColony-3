require_relative 'ant_colony/version'

module AntColony
  class Colony
    DEFAULT_PHERO = 0.5

    attr_reader :alpha, :beta, :ph, :q, :graph, :pop

    def initialize(graph, alpha: 0.8, beta: 0.4, ph: 0.3, q: 500, pop: 200)
      method(__method__).parameters.each do |_, name|
        instance_variable_set(:"@#{name}", binding.local_variable_get(name))
      end
      set_default_tau
    end

    def find_path(*roadmap)
      loop do
        city = graph[roadmap.last] # current point(city) ant located

        sum_paths = city.reduce(0.0) do |sum, (_, path)|
          sum + (path[:tau]**alpha).to_f / (path[:length]**beta)
        end

        proposed_paths = city.each_with_object({}) do |(direction, path), paths|
          unless roadmap.include? direction
            paths[direction] = (((path[:tau]**alpha).to_f / path[:length])**beta) / sum_paths
          end
        end

        roadmap << best_path_of(proposed_paths)
        break unless roadmap.length < graph.size
      end

      roadmap
    end

    def solve
      graph.size.times do |i|
        pop.times do
          path = find_path(i + 1)
          increase_tau_for path
        end
      end
    end

    def length_of(path)
      [*path, path.first].each_cons(2).reduce(0.0) do |sum, (cur, nxt)|
        sum + graph[cur][nxt][:length]
      end
    end

    private

    def set_default_tau
      graph.each do |_, roads|
        roads.each do |_, props|
          props[:tau] = DEFAULT_PHERO
        end
      end
    end

    def best_path_of(paths)
      paths.max_by { |_, v| v }.first
    end

    def increase_tau_for(path)
      [*path, path.first].each_cons(2) do |cur, nxt|
        tau_next = (1.0 - ph) * graph[cur][nxt][:tau] + q.to_f / length_of(path)
        graph[cur][nxt][:tau] = graph[nxt][cur][:tau] = tau_next
      end
    end
  end
end
