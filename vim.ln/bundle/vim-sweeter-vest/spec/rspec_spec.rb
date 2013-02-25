require "spec_helper"

describe "example_spec.rb" do
  before do
    Dir.mkdir  "spec"
    write_file "spec/example_spec.rb", File.read(File.expand_path("../support/example_rspec.rb", __FILE__))
    vim.edit   "spec/example_spec.rb"
  end

  let(:vim) { VIM }

  describe "SweeterVestRunFile" do
    it "runs all tests" do
      expect(vim.command("SweeterVestRunFile")).to include("rspec --order rand spec/example_spec.rb\r\n")
    end

    it "ignores previous run commands" do
      vim.normal("3G")
      vim.command("SweeterVestRunTest")
      expect(vim.command("SweeterVestRunFile")).to include("rspec --order rand spec/example_spec.rb\r\n")
    end

    it "runs with a seed" do
      vim.command("SweeterVestRSpecSeed 123")
      expect(vim.command("SweeterVestRunFile")).to include("rspec --order rand:123 spec/example_spec.rb\r\n")
    end
  end

  describe "SweeterVestRunTest" do
    it "runs the current test" do
      vim.normal("3G")
      expect(vim.command("SweeterVestRunTest")).to include("rspec --order rand spec/example_spec.rb:3\r\n")
    end

    it "runs with a seed" do
      vim.normal("3G")
      vim.command("SweeterVestRSpecSeed 123")
      expect(vim.command("SweeterVestRunTest")).to include("rspec --order rand:123 spec/example_spec.rb:3\r\n")
    end
  end

  describe "SweeterVestRunContext" do
    it "runs all specs in the parent context" do
      vim.normal("4G")
      expect(vim.command("SweeterVestRunContext")).to include("rspec --order rand spec/example_spec.rb:2\r\n")
    end

    it "runs all specs in the parent describe" do
      vim.normal("10G")
      expect(vim.command("SweeterVestRunContext")).to include("rspec --order rand spec/example_spec.rb:8\r\n")
    end

    it "runs with a seed" do
      vim.normal("10G")
      vim.command("SweeterVestRSpecSeed 123")
      expect(vim.command("SweeterVestRunContext")).to include("rspec --order rand:123 spec/example_spec.rb:8\r\n")
    end
  end
end
