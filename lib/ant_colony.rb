require 'ant_colony/version'

module AntColony
  class Colony

    attr_reader :alpha, :beta, :p, :q, :graph, :population

    def initialize(options ={})
      defaults = {
          alpha: 1,
          beta: 1,
          p: 0.3,
          q: 5,
          population: 20
      }
      defaults.merge(options).each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def create_graph(graph)
      @graph = graph
    end

    def find_way_for(start, roadmap = [start])
      proposed_ways = {}
      sum_ways = 0

      begin
        graph[start].map do |way|
          sum_ways += (way[:tau] ** alpha).to_f / (way[:length] ** beta) unless roadmap.include? way[:end]
        end

        graph[start].map do |way|
          unless roadmap.include? way[:end]
            proposed_ways[way[:end]] = (((way[:tau] ** alpha).to_f / way[:length]) ** beta) / sum_ways
          end
        end

        next_start = best_way_of proposed_ways
        roadmap << next_start unless roadmap.include? next_start

        if roadmap.length < graph.size
          find_way_for(next_start, roadmap)
        else
          return roadmap
        end

      rescue Exception
        puts 'The next point is not found, check entered data'
      end
    end

    def calculate
      graph.size.times do |i|
        population.times do
          roads = find_way_for i+1
          increase_tau_for roads
        end
      end
    end

    def length_of(way)
      total_length = 0
      way.each_with_index do |point, index|
        next_point = (index +=1)
        total_length += graph[point].find { |item| item[:end] == way[next_point] }[:length] if next_point <= way.size - 1
      end
      total_length
    end

    private
    def best_way_of(hash)
      hash.max_by { |k, v| v }[0]
    end

    def increase_tau_for(way)
      total_length = length_of way
      delta_tau = q.to_f / total_length

      way.each_with_index do |point, index|
        next_point = (index +=1)
        if index < way.size - 1
          (1-p) * graph[point].find { |item| item[:end] == way[next_point] }[:tau] += delta_tau
        end
      end
    end
  end
end

