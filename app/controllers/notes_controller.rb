class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new params[:note]
    @note.user = current_user
    if @note.save
      date = @note.date
      redirect_to daily_calendar_url(date.month, date.day), notice: 'Note saved successfully'
    else
      render :new
    end
  end

  def day
    @date = DateTime.current.change(month: params[:month].to_i, day: params[:day].to_i)
    @notes = current_user.notes.all(order: :date)
  end

end
