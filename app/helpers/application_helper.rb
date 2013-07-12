module ApplicationHelper
  def show_my_armies
    if @my_armies.empty?
      render "armies/you_have_no_armies"
    else
      render "armies/my_armies_table"
    end
  end

  def show_public_armies
    render "armies/public_armies_table" unless @public_armies.empty?
  end

  def army_name(army)
    (army.name == '' ? 'Army' : army.name)
  end

  def faction_name(army)
    (army.faction.nil? ? '' : army.faction.name)
  end

end
