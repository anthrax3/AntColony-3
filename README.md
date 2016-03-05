# AntColony

Simple implementation ant colony optimization algorithm

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ant_colony'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ant_colony

## Usage
```ruby
graph  = YAML.load_file('test_data/test1.yml')
colony = AntColony::Colony.new(graph, beta: 0.8, alpha: 0.7, pop: 200, ph: 0.3, q: 5)
colony.solve
colony.find_path 1 # path from point 1
```

Or use cli:
```bash
ant_colony solve test_data/test1.yml 1 --pop 200 --alpha 0.7
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ant_colony/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
