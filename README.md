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
colony = AntColony::Colony.new(beta: 0.8, alpha: 0.7, population: 6000, p: 0.3, q: 5)
colony.create_graph({1 => [{end: 2, length: 26, tau: 0.5},
                           {end: 3, length: 42, tau: 0.5},
                           {end: 4, length: 15, tau: 0.5},
                           {end: 5, length: 29, tau: 0.5},
                           {end: 6, length: 25, tau: 0.5}],
                     2 => [{end: 1, length: 7, tau: 0.5},
                           {end: 3, length: 16, tau: 0.5},
                           {end: 4, length: 1, tau: 0.5},
                           {end: 5, length: 30, tau: 0.5},
                           {end: 6, length: 25, tau: 0.5}],
                     3 => [{end: 1, length: 20, tau: 0.5},
                           {end: 2, length: 13, tau: 0.5},
                           {end: 4, length: 35, tau: 0.5},
                           {end: 5, length: 5, tau: 0.5},
                           {end: 6, length: 1, tau: 0.5}],
                     4 => [{end: 1, length: 21, tau: 0.5},
                           {end: 2, length: 16, tau: 0.5},
                           {end: 3, length: 25, tau: 0.5},
                           {end: 5, length: 18, tau: 0.5},
                           {end: 6, length: 18, tau: 0.5}],
                     5 => [{end: 1, length: 12, tau: 0.5},
                           {end: 2, length: 46, tau: 0.5},
                           {end: 3, length: 27, tau: 0.5},
                           {end: 4, length: 48, tau: 0.5},
                           {end: 6, length: 5, tau: 0.5}],
                     6 => [{end: 1, length: 23, tau: 0.5},
                           {end: 2, length: 5, tau: 0.5},
                           {end: 3, length: 5, tau: 0.5},
                           {end: 4, length: 9, tau: 0.5},
                           {end: 5, length: 5, tau: 0.5}]})
colony.calculate
colony.find_way_for 1 # road from point 1
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/ant_colony/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
