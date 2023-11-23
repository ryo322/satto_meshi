class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_user.id
    @report.reported_id = @post.id
    if @report.save
      redirect_to root_path, notice: "ご報告ありがとうございます。"
    else
      render "new"
    end
  end

  private

  def report_params
    params.require(:report).permit(:reportable_type, :reason)
  end
end
