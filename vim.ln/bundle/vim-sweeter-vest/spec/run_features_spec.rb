require "spec_helper"

describe "SweeterVestRunFeatures" do
  let(:vim) { VIM }

  it "runs cucucmber features" do
    Dir.mkdir "features"
    expect(vim.command("SweeterVestRunFeatures")).to include("cucumber features\r\n")
  end

  it "runs rspec spec/features" do
    FileUtils.mkdir_p "spec/features"
    expect(vim.command("SweeterVestRunFeatures")).to include("rspec spec/features\r\n")
  end

  it "runs rspec spec/acceptance" do
    FileUtils.mkdir_p "spec/acceptance"
    expect(vim.command("SweeterVestRunFeatures")).to include("rspec spec/acceptance\r\n")
  end
end
