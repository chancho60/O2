note
	description: "Gestion du pointage"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	POINTAGE

inherit
	GAME
	IMAGE
create
	creer_pointage
feature  -- Initialization
	l_insert: SQLITE_INSERT_STATEMENT
	l_query: SQLITE_QUERY_STATEMENT
	l_modify: SQLITE_MODIFY_STATEMENT
	l_set: SQLITE_RESULT_SET
	l_db: SQLITE_DATABASE
	creer_pointage
			-- Run application.
		do
			create l_db.make_create_read_write ("BD/pointage.sqlite")

        	-- Remove any existing table
			create l_modify.make ("DROP TABLE IF EXISTS pointage;", l_db)
			l_modify.execute

			-- Create a new table
			create l_modify.make ("CREATE TABLE `pointage` (`Joueur` INTEGER PRIMARY KEY, `Points` INTEGER);", l_db)
			l_modify.execute

			create l_insert.make ("INSERT INTO `pointage` (`Points`) VALUES (0);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			l_insert.execute

			create l_insert.make ("INSERT INTO `pointage` (`Points`) VALUES (0);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			l_insert.execute

			l_db.begin_transaction (False)
			l_db.commit





			create l_query.make ("SELECT * FROM pointage;", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						if not ia_row.is_null (j) then
							if j = 1 then
								print ("Joueur " + ia_row.string_value (j) + ": ")
							end
							if j = 2 then
								print (ia_row.string_value (j) + " Points")
							end
						else
							print ("<NULL>")
						end
						j := j + 1
					end
					print ("%N")
				end)







		end

point_joueur1--(l_point:INTEGER)
		local
			i: INTEGER
		do
			--create l_modify.make ("UPDATE pointage set Points = '"+l_point.out+"' WHERE Joueur = '1';", l_db)
			--l_modify.execute
			i:=i+1

			create l_modify.make ("UPDATE pointage SET Point=1 WHERE Joueur = '1';", l_db)
					l_modify.execute

			l_db.begin_transaction (False)
			l_db.commit



			create l_query.make ("SELECT * FROM pointage;", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						if not ia_row.is_null (j) then
							if j = 1 then
								print ("Joueur " + ia_row.string_value (j) + ": ")
							end
							if j = 2 then
								print (ia_row.string_value (j) + " Points")
							end
						else
							print ("<NULL>")
						end
						j := j + 1
					end
					print ("%N")
				end)
	end


	point_joueur2--(l_point:INTEGER)
		local
			i: INTEGER
		do
			--create l_modify.make ("UPDATE pointage set Points = '"+l_point.out+"' WHERE Joueur = '1';", l_db)
			--l_modify.execute
			i:=i+1
			create l_modify.make ("UPDATE pointage SET Points=1 WHERE Joueur = '2';", l_db)
					l_modify.execute

			l_db.begin_transaction (False)
			l_db.commit



			create l_query.make ("SELECT * FROM pointage;", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						if not ia_row.is_null (j) then
							if j = 1 then
								print ("Joueur " + ia_row.string_value (j) + ": ")
							end
							if j = 2 then
								print (ia_row.string_value (j) + " Points")
							end
						else
							print ("<NULL>")
						end
						j := j + 1
					end
					print ("%N")
				end)
	end




end
