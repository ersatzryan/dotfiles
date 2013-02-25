require "vimrunner"
require "vimrunner/testing"

RSpec.configure do |config|
  config.include Vimrunner::Testing

  config.around do |example|
    tmpdir(VIM) do
      example.call
    end
  end

  config.before(:suite) do
    VIM = Vimrunner.start
    VIM.add_plugin(File.expand_path("../..", __FILE__), "plugin/sweeter_vest.vim")
  end

  config.after(:suite) do
    VIM.kill
  end
end
