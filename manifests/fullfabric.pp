require boxen::environment
require homebrew
require gcc

exec { 'updates homebrew':
  command => 'brew update'
}

# installs dependencies using homebrew
package {
  [
    'v8',
    'gd',
    'passenger',
    'mongo'
  ]:
}

$ruby_version = "2.0.0-p451"

class { 'ruby::global':
  version => $ruby_version
}

ruby_gem { "rack gem":
  gem     => 'rack',
  ruby_version    => $ruby_version,
  version => '>= 1.0.0'
}

ruby_gem { "daemon_controller gem":
  gem     => 'daemon_controller',
  ruby_version    => $ruby_version,
  version => '>= 1.0.0'
}
