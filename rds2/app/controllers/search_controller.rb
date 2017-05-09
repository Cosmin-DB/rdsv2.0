class SearchController < ApplicationController
  def persons
				sql_frieds = "SELECT  users.*
						FROM users
						INNER JOIN friends ON users.id = friends.friend_id
						WHERE friends.user_id=#{current_user.id} AND name LIKE '%#{params[:name_search]}%' ;"
		@friends=User.find_by_sql(sql_frieds)
				sql_persons = "SELECT  users.*
						FROM users
						INNER JOIN friends ON users.id = friends.friend_id
						WHERE friends.user_id!=#{current_user.id} AND name LIKE '%#{params[:name_search]}%' ;"
		@persons=User.find_by_sql(sql_persons)
  end
end
