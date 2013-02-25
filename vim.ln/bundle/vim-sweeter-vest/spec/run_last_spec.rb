require "spec_helper"

describe "SweeterVestRunLast" do
  let(:vim) { VIM }

  it "runs the last command executed" do
    File.write("Rakefile", "")
    vim.command("SweeterVestRunAll")
    expect(vim.command("SweeterVestRunLast")).to include("rake\r\n")
  end
end
