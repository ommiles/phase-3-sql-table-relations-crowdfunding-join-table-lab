# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

# The ON clause is used to join tables where the column names don’t match in both tables.
# https://stackoverflow.com/questions/13750152/using-keyword-vs-on-clause-mysql 
# https://stackoverflow.com/questions/11366006/mysql-join-on-vs-using
def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount) FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name"
end

# The AS command renames a column or table with an alias.  The alias only exists for the duration of the query.
# The alias requires double quotation marks or square brackets if the alias name contains spaces.

# If a HAVING clause is specified, it is evaluated once for each group of rows as a boolean expression. 
# If the result of evaluating the HAVING clause is false, the group is discarded. 
# If the HAVING clause is an aggregate expression, it is evaluated across all rows in the group. 
# If a HAVING clause is a non-aggregate expression, it is evaluated with respect to an arbitrarily selected row from the group. 
# The HAVING expression may refer to values, even aggregate functions, that are not in the result.

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) AS [Amount Left] FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING [Amount Left] >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(pledges.amount) FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name ORDER BY SUM(pledges.amount);"
end

# Use single quotes
def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'books';"
end
