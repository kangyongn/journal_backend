class Api::V1::JournalsController < ApplicationController
  before_action :get_journal, only: [:show, :update, :destroy]

  def index
    @journals = Journal.all
    render json: @journals
  end

  def show
    render json: @journal
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      render json: @journal, status: :created
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @journal.update(journal_params)
      render json: @journal
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @journal
    @journal.destroy
  end

  private

  def journal_params
    params.permit(:user_id, :content)
  end

  def get_journal
    @journal = Journal.find(params[:id])
  end
end
