class GroupMembershipsController < ApplicationController 
  def create
    @group = Group.find(params[:group_id])
    membership = GroupMembership.new(member_id: current_user.id,
                                     group_id: @group.id)
    if membership.save
      redirect_to groups_path
    end 
  end

  def destroy
    membership = GroupMembership.find(params[:id])
    membership.destroy
    redirect_to groups_path
  end
end
