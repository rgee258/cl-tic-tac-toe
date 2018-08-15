require "player"

describe Player do
  
  let(:player) {Player.new("P", "X", "1")}

  describe ".input_check" do
  	context "given '1'" do
  	  it "should return '1'" do
  	  	expect(player.send(:input_check, "1")).to eql("1")
  	  end
  	end

  	context "given '2'" do
  	  it "should return '2'" do
  	  	expect(player.send(:input_check, "2")).to eql("2")
  	  end
  	end

  	context "given '3'" do
  	  it "should return '3'" do
  	  	expect(player.send(:input_check, "3")).to eql("3")
  	  end
  	end

  	context "given '4'" do
  	  it "should return '4'" do
  	  	expect(player.send(:input_check, "4")).to eql("4")
  	  end
  	end

  	context "given '5'" do
  	  it "should return '5'" do
  	  	expect(player.send(:input_check, "5")).to eql("5")
  	  end
  	end

  	context "given '6'" do
  	  it "should return '6'" do
  	  	expect(player.send(:input_check, "6")).to eql("6")
  	  end
  	end

  	context "given '7'" do
  	  it "should return '7'" do
  	  	expect(player.send(:input_check, "7")).to eql("7")
  	  end
  	end

  	context "given '8'" do
  	  it "should return '8'" do
  	  	expect(player.send(:input_check, "8")).to eql("8")
  	  end
  	end

  	context "given '9'" do
  	  it "should return '9'" do
  	  	expect(player.send(:input_check, "9")).to eql("9")
  	  end
  	end
  end

  describe ".repeated_check" do
  	context "given '1'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "1")).to eql(false)
  	  end
  	end

  	context "given '2'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "2")).to eql(false)
  	  end
  	end

  	context "given '3'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "3")).to eql(false)
  	  end
  	end

  	context "given '4'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "4")).to eql(false)
  	  end
  	end

  	context "given '5'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "5")).to eql(false)
  	  end
  	end

  	context "given '6'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "6")).to eql(false)
  	  end
  	end

  	context "given '7'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "7")).to eql(false)
  	  end
  	end

  	context "given '8'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "8")).to eql(false)
  	  end
  	end

  	context "given '9'" do
  	  it "should return false" do
  	  	expect(player.send(:repeat_check?, "9")).to eql(false)
  	  end
  	end
  end

end