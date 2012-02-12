class NotesController < ApplicationController

  before_filter :authenticate

  def new
    @note = Note.new
  end

  def create
    @note = Note.new params[:note]
    @note.user = current_user
    if @note.save
      date = @note.date
      redirect_to daily_diary_url(date.month, date.day), notice: 'Note saved successfully'
    else
      render :new
    end
  end

  def day
    @date = DateTime.current.change(month: params[:month].to_i, day: params[:day].to_i)
    @notes = current_user.notes.for_day(@date.month, @date.day).by_date
  end

  def week_day
    @weekday = Date.parse(params[:weekday])
    @notes = current_user.notes.for_week_day(@weekday.strftime('%u')).since(5.weeks.ago).by_date
  end

  def week
    @notes = current_user.notes.for_week(params[:year], params[:week_number]).by_date
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update_attributes(params[:note])
      date = @note.date
      redirect_to daily_diary_url(date.month, date.day), notice: 'Note updated successfully'
    else
      render :edit
    end
  end

end
