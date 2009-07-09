module JobAdvertisementsHelper
  def subpage_class(opp_type, link_target)
     opp_type == link_target ? 'active-subpage' : ''
  end
end
