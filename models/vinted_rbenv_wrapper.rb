class VintedRbenvWrapper < Jenkins::Tasks::BuildWrapper
  DEFAULT_RUBY_VERSION = '2.2.2'
  DEFAULT_RBENV_ROOT = '$HOME/.rbenv'

  display_name 'Run the build in rbenv'

  attr_accessor :ruby_version, :rbenv_root

  def initialize(attrs)
    @ruby_version = value_or_default(attrs['ruby_version'], DEFAULT_RUBY_VERSION)
    @rbenv_root = value_or_default(attrs['rbenv_root'], DEFAULT_RBENV_ROOT)
  end

  def setup(build, _launcher, listener)
    build.env['RBENV_ROOT'] = rbenv_root
    build.env['RBENV_VERSION'] = ruby_version
    # Set ${RBENV_ROOT}/bin in $PATH to allow invoke rbenv from shell
    build.env['PATH+RBENV_BIN'] = "#{rbenv_root}/bin"
    # Set ${RBENV_ROOT}/bin in $PATH to allow invoke binstubs from shell
    build.env['PATH+RBENV_SHIMS'] = "#{rbenv_root}/shims"

    listener << "Using Ruby version #{ruby_version}."
  end

  private

  def value_or_default(val, default = nil)
    val == '' ? default : val
  end
end
