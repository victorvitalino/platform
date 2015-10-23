# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
set :stage, :production

role :app, %w{sedhab@10.233.38.15}
role :web, %w{sedhab@10.233.38.15}
role :db,  %w{sedhab@10.233.38.15}
