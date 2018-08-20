# frozen_string_literal: true

require_relative '../utils/anagrams_checker'

# Two Anagrams Matcher Controller
class AnagramsController < ApplicationController
  before_action :set_anagram, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all.order('created_at DESC')
  end

  # GET /anagrams/1
  # GET /anagrams/1.json
  def show; end

  # GET /anagrams/new
  def new
    @anagram = Anagram.new
  end

  # GET /anagrams/1/edit
  def edit; end

  # POST /anagrams
  # POST /anagrams.json
  def create
    @anagram = Anagram.new(anagram_params)
    word1 = anagram_params[:firstword]
    word2 = anagram_params[:secondword]
    matchingresult = AnagramsChecker.anagrams?(word1, word2)
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
    word1 = anagram_params[:firstword]
    word2 = anagram_params[:secondword]
    matchingresult = AnagramsChecker.anagrams?(word1, word2)
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
