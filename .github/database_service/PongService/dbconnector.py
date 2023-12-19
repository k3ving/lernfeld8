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
        cursor.execute("EXECUTE [dbo].GetHighscores")
        return cursor.fetchall()
