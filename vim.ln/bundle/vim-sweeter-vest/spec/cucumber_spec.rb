require "spec_helper"

describe "example.feature" do
  before do
    Dir.mkdir  "features"
    write_file "features/example.feature", File.read(File.expand_path("../support/example.feature", __FILE__))
    vim.edit   "features/example.feature"
  end

  let(:vim) { VIM }

  describe "SweeterVestRunFile" do
    it "runs all tests" do
      expect(vim.command("SweeterVestRunFile")).to include("cucumber features/example.feature\r\n")
    end

    it "ignores previous run commands" do
      vim.normal("3G")
      vim.command("SweeterVestRunTest")
      expect(vim.command("SweeterVestRunFile")).to include("cucumber features/example.feature\r\n")
    end
  end

  describe "SweeterVestRunTest" do
    it "runs the current test" do
      vim.normal("3G")
      expect(vim.command("SweeterVestRunTest")).to include("cucumber features/example.feature:3\r\n")
    end
  end

  describe "SweeterVestRunLast" do
    it "runs the last command executed" do
      vim.normal("3G")
      vim.command("SweeterVestRunTest")
      expect(vim.command("SweeterVestRunLast")).to include("cucumber features/example.feature:3\r\n")
    end
  end

  describe "SweeterVestRunContext" do
    it "runs the nearest scenario" do
      vim.normal("5G")
      expect(vim.command("SweeterVestRunContext")).to include("cucumber features/example.feature:3\r\n")
    end
  end
end
