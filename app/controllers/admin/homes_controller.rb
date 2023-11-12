class Admin::HomesController < ApplicationController
  def top
    @unconfirmed_reports_count = Report.unconfirmed.count
  end
end
