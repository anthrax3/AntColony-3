require 'spec_helper.rb'
require 'yaml'

describe AntColony::Colony do
  let(:graph)  { YAML.load_file('test_data/test1.yml') }
  let(:colony) { AntColony::Colony.new(graph, pop: 100) }

  before { colony.solve }

  it 'should find the shortest way' do
    paths = graph.keys.permutation.map do |path|
      [path.to_s, colony.length_of(path)]
    end
    shortest_length = paths.min_by { |_, v| v }.last
    shortest_paths = paths.select { |_, v| v == shortest_length }

    expect(shortest_paths.map(&:first)).to include colony.find_path(1).to_s
  end
end
