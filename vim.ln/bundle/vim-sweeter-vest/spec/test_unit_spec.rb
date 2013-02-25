require "spec_helper"

describe "example_test.rb" do
  before do
    Dir.mkdir  "test"
    write_file "test/example_test.rb", File.read(File.expand_path("../support/example_test.rb", __FILE__))
    vim.edit   "test/example_test.rb"
  end

  let(:vim) { VIM }

  describe "SweeterVestRunFile" do
    it "runs all tests" do
      expect(vim.command("SweeterVestRunFile")).to include("ruby -Ilib:test test/example_test.rb\r\n")
    end

    it "ignores previous run commands" do
      vim.normal("3G")
      vim.command("SweeterVestRunTest")
      expect(vim.command("SweeterVestRunFile")).to include("ruby -Ilib:test test/example_test.rb\r\n")
    end
  end

  describe "SweeterVestRunTest" do
    it "runs the current test" do
      vim.normal("2G")
      expect(vim.command("SweeterVestRunTest")).to include("ruby -Ilib:test test/example_test.rb -n test_something")
    end
  end

  describe "SweeterVestRunContext" do
  end
end
