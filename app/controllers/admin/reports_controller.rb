class Admin::ReportsController < ApplicationController
  def index
    @unconfirmed_reports_count = Report.unconfirmed.count
    @reports = Report.all
    @reports = @reports.page(params[:page]).per(10)
  end

  def show
    @report = Report.find(params[:id])
  end
  
  def confirm
    @report = Report.find(params[:id])
    @report.update(confirmed: true)

    redirect_to admin_reports_path
  end
end
