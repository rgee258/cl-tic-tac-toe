require "board"
require "player"

describe Board do
  
  before(:each) do
  	@board = Board.new
  	@board.create_board
  end

  describe ".check_win?" do
  	context "given winning marks across the top row" do
  	  it "should return true" do
  	    @board.update_board(1, "X")
  	    @board.update_board(2, "X")
  	    @board.update_board(3, "X")
  	    expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the middle row" do
  	  it "should return true" do
  	  	@board.update_board(4, "X")
  	  	@board.update_board(5, "X")
  	  	@board.update_board(6, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the bottom row" do
  	  it "should return true" do
  	  	@board.update_board(7, "X")
  	  	@board.update_board(8, "X")
  	  	@board.update_board(9, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the left column" do
  	  it "should return true" do
  	  	@board.update_board(1, "X")
  	  	@board.update_board(4, "X")
  	  	@board.update_board(7, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the middle column" do
  	  it "should return true" do
  	  	@board.update_board(2, "X")
  	  	@board.update_board(5, "X")
  	  	@board.update_board(8, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the right column" do
  	  it "should return true" do
  	  	@board.update_board(3, "X")
  	  	@board.update_board(6, "X")
  	  	@board.update_board(9, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the left diagonal" do
  	  it "should return true" do
  	  	@board.update_board(1, "X")
  	  	@board.update_board(5, "X")
  	  	@board.update_board(9, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given winning marks across the right diagonal" do
  	  it "should return true" do
  	  	@board.update_board(3, "X")
  	  	@board.update_board(5, "X")
  	  	@board.update_board(7, "X")
  	  	expect(@board.check_win?).to eql(true)
  	  end
  	end

  	context "given an empty board with no winning marks" do
  	  it "should return false" do
  	  	expect(@board.check_win?).to eql(false)
  	  end
  	end
  end
	
end