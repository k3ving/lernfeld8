import pyodbc


class DbConnector:
    connection_string = "Driver=SQL Server;Server={Placeholder};Database=Pong;Trusted_Connection=True;"

    def send_score(self, user, score):
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()
        cursor.execute("EXECUTE [dbo].[AddScore] @User=?, @Score=?",
                       user, score)
        cursor.commit()

        cursor.close()
        connection.close()

    def get_highscores(self):
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()
        cursor.execute("EXECUTE [dbo].[GetHighscores]")
        results = cursor.fetchall()

        cursor.close()
        connection.close()
        return results

    def get_own_score(self, user):
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()
        cursor.execute("EXECUTE [dbo].[GetOwnScore] @User=?", user)
        result = cursor.fetchone()

        cursor.close()
        connection.close()
        return result

    def login(self, user, password):
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()
        cursor.execute("EXECUTE [dbo].[Login] @User=?, @Password=?",
                       user, password)
        result = cursor.fetchone()

        cursor.close()
        connection.close()
        return result

    def register(self, user, password):
        print(user, password)
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()

        cursor.execute("EXECUTE [dbo].[Register] @User=?, @Password=?",
                       user, password)

        result = cursor.fetchone()
        cursor.commit()

        cursor.close()
        connection.close()
        return result
