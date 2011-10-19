namespace :datafix do
  desc "Sets kevin.bongart@gmail.com admin"
  task :set_kevin_admin => :environment do
    u = User.find_by_email "kevin.bongart@gmail.com"
    u.role = 'admin'
    u.save
  end

  desc "Gives all users the first invite code"
  task :give_invite_code => :environment do
    code = InviteCode.first.code
    User.all.each do |u|
      u.update_attributes(:code => code)
    end
  end
end
