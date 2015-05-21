Jenkins::Plugin::Specification.new do |plugin|
  plugin.name = 'vinted-rbenv'
  plugin.version = '0.0.1'
  plugin.description = 'Run Jenkins builds in rbenv'

#  plugin.url = 'https://wiki.jenkins-ci.org/display/JENKINS/Vinted+Rbenv+Plugin'
  plugin.developed_by 'Tomas Brazys', 'tomas.brazys@vinted.com'
  plugin.uses_repository :github => 'vinted/rbenv-plugin'

  plugin.depends_on 'ruby-runtime', '0.12'
end
