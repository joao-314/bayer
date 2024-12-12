# C:\Users\EAGHP\PycharmProjects\robot-automation-implanta\config\database.py

import psycopg2


def execute_query(dealer_internal_code, db_name, db_user, db_password, db_host, db_port):
    try:
        # Establish a connection to the database
        conn = psycopg2.connect(
            dbname=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port
        )
        cur = conn.cursor()

        # Execute the query
        query = """
            SELECT * FROM sellout.dealers
            WHERE DATE("updatedAt") BETWEEN '2024-06-19' AND '2024-06-19'
            AND "dealerInternalCode" = %s
            ORDER BY "createdAt" ASC;
        """
        cur.execute(query, (dealer_internal_code,))

        # Fetch the results
        result = cur.fetchall()

        # Close the cursor and connection
        cur.close()
        conn.close()

        return result

    except psycopg2.Error as e:
        print(f"Error executing query: {e}")
        return None


if __name__ == "__main__":
    import sys

    dealer_internal_code = sys.argv[1]
    db_name = sys.argv[2]
    db_user = sys.argv[3]
    db_password = sys.argv[4]
    db_host = sys.argv[5]
    db_port = sys.argv[6]

    result = execute_query(dealer_internal_code, db_name, db_user, db_password, db_host, db_port)
    if result:
        for row in result:
            print(row)
    else:
        print("No result or error occurred.")
