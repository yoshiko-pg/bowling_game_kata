require 'spec_helper'
require '001/Game'

describe Game do
  let(:game) { Game.new }

  def rollMany(n, pins)
    n.times { game.roll(pins) }
  end

  def rollSpare
    game.roll 5
    game.roll 5
  end

  def rollStrike
    game.roll 10
  end

  it "全部ガーター" do
    rollMany(20, 0)
    expect(game.score).to eq 0
  end

  it "全部1" do
    rollMany(20, 1)
    expect(game.score).to eq 20
  end

  it "全部2" do
    rollMany(20, 2)
    expect(game.score).to eq 40
  end

  it "1回スペア" do
    rollSpare
    game.roll(3)
    rollMany(17, 0)
    expect(game.score).to eq 16
  end

  it "1回ストライク" do
    rollStrike
    game.roll(3)
    game.roll(4)
    rollMany(16, 0)
    expect(game.score).to eq 24
  end

  it "全部ストライク" do
    rollMany(12, 10)
    expect(game.score).to eq 300
  end
end
