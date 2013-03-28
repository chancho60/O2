note
	description: "Summary description for {POINTAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POINTAGE

inherit
	GAME
	IMAGE
create
	creer_pointage
feature {NONE} -- Initialization
	l_insert: SQLITE_INSERT_STATEMENT
	l_query: SQLITE_QUERY_STATEMENT
	l_modify: SQLITE_MODIFY_STATEMENT
	l_db: SQLITE_DATABASE
	creer_pointage
			-- Run application.
		do
			create l_db.make_create_read_write ("pointage.sqlite")

        	-- Remove any existing table
			create l_modify.make ("DROP TABLE IF EXISTS pointage;", l_db)
			l_modify.execute

			-- Create a new table
			create l_modify.make ("CREATE TABLE pointage (Joueur INTEGER, Points INTEGER);", l_db)
			l_modify.execute
			create l_insert.make ("INSERT INTO pointage (Joueur, Points) VALUES (1, 0);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			create l_insert.make ("INSERT INTO pointage (Joueur, Points) VALUES (2, 0);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			l_db.commit

			l_db.close
		end

	point_joueur1(l_point:INTEGER)
		local
			i: INTEGER
		do
			create l_modify.make ("UPDATE pointage set joueur1 = '"+l_point.out+"' WHERE Joueur = '1';", l_db)
			l_modify.execute
--				-- Create a insert statement with variables
--			create l_insert.make ("INSERT INTO pointage (Joueur1, Joueur2) VALUES (:player1, :player2);", l_db)
--			check l_insert_is_compiled: l_insert.is_compiled end




--				-- Commit handling
--			l_db.begin_transaction (False)

--				from until i = 10 loop
--					-- Execute the INSERT statement with the argument list.
--				l_insert.execute_with_arguments ([

--						"Test", -- Using Eiffel object (unnamed variable @ index 1 will replace ?1)
--						create {SQLITE_DOUBLE_ARG}.make (":player2", (i))])
--				i := i + 1
--			end

			l_db.commit
			l_db.close
		end
end
