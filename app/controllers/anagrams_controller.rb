class AnagramsChecker
  def self.regex_is_number?(word1)
    no_commas =  word1.gsub(',', '')
    matches = no_commas.match(/-?\d+(?:\.\d+)?/)
    if !matches.nil? && matches.size == 1 && matches[0] == no_commas
      true
    else
      false
    end
  end

  def anagrams?(word1, word2)
    if word1 == "" || word2 == ""
      false
    elsif word1.length <= 2 || word2.length <= 2
      false
    elsif word1.length != word2.length
      false
    elsif word1.equal?(word2)
      false
    elsif this.class.regex_is_number?(word1) || this.class.regex_is_number?(word2)
      false
    else
      word_count_1 = word1.chars.sort
      word_count_2 = word2.chars.sort
      if word_count_1 == word_count_2
        true
      end
      # byebug
    end
  end
end

class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all.order('created_at DESC')
  end

  # GET /anagrams/1
  # GET /anagrams/1.json
  def show
  end

  # GET /anagrams/new
  def new
    @anagram = Anagram.new
  end

  # GET /anagrams/1/edit
  def edit
  end

  # POST /anagrams
  # POST /anagrams.json
  def create
    @anagram = Anagram.new(anagram_params)

    matchingresult = AnagramsChecker.new.anagrams?(anagram_params[:firstword], anagram_params[:secondword]) ? true : false
    @anagram.matching = matchingresult

    # byebug

    respond_to do |format|
      if @anagram.save
        format.html { redirect_to @anagram, notice: 'Anagram was successfully created.' }
        format.json { render :show, status: :created, location: @anagram }
      else
        format.html { render :new }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anagrams/1
  # PATCH/PUT /anagrams/1.json
  def update
    matchingresult = AnagramsChecker.new.anagrams?(anagram_params[:firstword], anagram_params[:secondword]) ? true : false
    @anagram.matching = matchingresult

    respond_to do |format|
      if @anagram.update(anagram_params)
        format.html { redirect_to @anagram, notice: 'Anagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @anagram }
      else
        format.html { render :edit }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anagrams/1
  # DELETE /anagrams/1.json
  def destroy
    @anagram.destroy
    respond_to do |format|
      format.html { redirect_to anagrams_url, notice: 'Anagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anagram
      @anagram = Anagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anagram_params
      params.require(:anagram).permit(:firstword, :secondword, :matching)
    end
end
