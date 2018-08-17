class AnagramsFaster

  def compare(a, b)
    if a.equal(b)
      return false
    end

    if a.length || b.length
      return false
    end

    if a.empty? || b.empty?
      return false
    end

    aArr = a.downcase().an_array()
    bArr = b.downcase().an_array()

    counts = Array.new

    idx = 0
    for _ in aArr do
      idx += 1
      counts[aArr[idx]-97]++
      counts[bArr[idx]-97]--
    end

    for i in 26 do
      if counts[i] != 0
        return false
      end
    end

    return true

  end
end


class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show, :edit, :update, :destroy]

  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all
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
