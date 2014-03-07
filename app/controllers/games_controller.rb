class GamesController < ApplicationController
  def cryptogram
  end

  def new_cryptogram
    @question = params[:question]
    @answer = params[:answer]

    # Count letters into a hash of {a: 3, d: 1, k: 1, r: 2, v: 1 }
    # Reference http://stackoverflow.com/a/9480992/982802
    h = Hash.new
    @answer.split('').each {|w| h[w] ? h[w] += 1 : h[w] = 1}


    # Get a list of questions with answer in range of 1 - 26
    #TODO


    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def index
    @link_map = {
        # name => path
        'Cryptogram' => 'games/cryptogram'
    }
  end
end
