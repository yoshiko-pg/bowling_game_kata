class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
    @rolls << 0 if( (pin == 10) && (@rolls.length < 19) )
  end

  def score
    score = 0
    @rolls.each_slice(2).with_index do |(pin1, pin2), frameIndex|
      score += pin1 + (pin2.nil? ? 0 : pin2)
      if(strike? frameIndex)
        score += strikeBonus(frameIndex)
      elsif(spare? frameIndex)
        score += @rolls[frameIndex+2]
      end
    end
    score
  end

  def strike? frameIndex
    @rolls[frameIndex] == 10
  end

  def spare? frameIndex
    @rolls[frameIndex] + @rolls[frameIndex + 1] == 10
  end

  def strikeBonus frameIndex
    first = @rolls[frameIndex + 2]
    second = first == 10 ? @rolls[frameIndex + 4] : @rolls[frameIndex + 3]
    first + second
  end
end
