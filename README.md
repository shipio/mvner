# Mvner (maven-er)

This gem is for reading maven project object models, and specifically to assist in determining package structures for
 android maven projects. The object model superficially fronts nokogiri backed xpath queries.

## Installation

Add this line to your application's Gemfile:

    gem 'mvner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mvner

## Usage

``` ruby
scanner = Mvner::RepoScanner.new "android-sample"
apks = scanner.apks
apklibs = scanner.apklibs
jars = scanner.jars
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
