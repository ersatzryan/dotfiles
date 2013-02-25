require "spec_helper"

describe "SweeterVestRunAll" do
  let(:vim) { VIM }

  context "when a Rakefile exists" do
    it "runs rake" do
      File.write("Rakefile", "")
      expect(vim.command("SweeterVestRunAll")).to include("rake\r\n")
    end
  end

  context "when a Rakefile does not exist" do
    it "runs all specs" do
      expect(vim.command("SweeterVestRunAll")).to include("rspec --order rand spec\r\n")
    end
  end
end
