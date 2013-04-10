module NewspapersHelper

  def frequency(plan)
    case plan.weekly
    when true ; "Weekly"
    when false ; "Daily"
    end
  end
end
