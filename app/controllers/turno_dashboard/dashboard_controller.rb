# frozen_string_literal: true

class TurnoDashboard::DashboardController < TurnoDashboard::ApplicationController
  #skip_before_action :authenticate_and_authorize!
  #before_action :authenticate_user!, except: :about

  def index
    if Attention.connection_config[:adapter] == 'mysql2'
      ord = "DATE_FORMAT(created_at, '%Y-%m-%d') asc"
    else
      ord = 'CONVERT(VARCHAR(10), created_at, 120) asc'
    end
    @answers = Answer.joins(:poll)
                     .where('polls.poll_type = 1')
                     .where( create_at: Time.now.beginning_of_month.. Time.now )
                     .order(ord)
    @attentions = Attention
                    .where( created_at: Time.now.beginning_of_month..Time.now )
                    .order(ord)
    @users      = User
                    .where( created_at: Time.now.beginning_of_month..Time.now )
                    .order(ord)
    @units     = Unit.joins(:attentions)
                     .where('attentions.created_at >= ? ', Time.now.beginning_of_month)
  end

  def about

  end

  def turns_daily_bars
    return
    attentions = Attention
      .where( created_at: Time.now.beginning_of_day..Time.now )
      .group(:unit_id, :status)
      .count(:unit_id, :status)

    bars      = {}
    statuses  = Hash[Attention.statuses.hash.map{|index, status| [status, 0]}]
    units     = Hash[Unit.all.pluck :id, :name]

    bars      = statuses.clone

    statuses.each do |status|
      bars[status[0]] = []
      units.each{ |unit| bars[status[0]][unit[0]] = [unit[0], 0] }
    end

    attentions.each do |attention|
      begin
        bars[attention[0][1]][attention[0][0]] = [attention[0][0] * statuses.count, attention[1] ]
      rescue
        next
      end
    end

    { keys: units.map{|i, unit| [i*statuses.count, unit]},
      values:  Hash[bars.map{|status, units| [status, units.select{|vote| vote if !vote.nil? }]}],
      colors: graph_colors,
      max: (statuses.count * units.count) * 2
       }

  end

  def turns_daily_pie
    return
    # status, quantity. pie
    statuses  = Hash[Attention.statuses.hash.map{|index, status| [status, 0]}]
    Attention
      .where( created_at: Time.now.beginning_of_day..Time.now )
      .group(:status)
      .count(:status)
      .each{|status, votes| statuses[status] = votes}

    {keys: statuses.keys.map{|k|_(k)},
     values: statuses.values,
     colors: graph_colors,
   }
  end

  def turns_units_by_status_bars
    attentions = Attention
      .where( created_at: Time.now.beginning_of_day..Time.now )
      .group(:unit_id, :status)
      .count(:unit_id, :status)

    bars      = {}
    statuses  = Hash[Attention.statuses.hash.map{|index, status| [status, 0]}]
    units     = Hash[Unit.all.pluck :id, :name]

    attentions.each do |attention|
      begin
        unless bars[units[attention[0][0]]]
          bars[units[attention[0][0]]] = statuses.clone
        end
        bars[ units[attention[0][0]] ][attention[0][1]] = attention[1]
      rescue
        next
      end
    end

    { keys:[ [0, 'requested'],
            [5, 'calling'],
            [10, 'attending'],
            [15, 'completed'],
            [20, 'redirected'],
            [25, 'absent'],
            [30, 'cancelled'] ],
      values:  Hash[bars.map{|unit, statuses| [unit, statuses.values.enum_for(:each_with_index).map{|vote, index| [index*5, vote]} ]}],
      colors: graph_colors }

  end

  def graph_colors
    ['#eceff1', '#f35958', '#dee1e3', '#a8bee3', '#3539e3', '#48e33e', '#e3e13d']
  end
end
