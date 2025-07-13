from flask import Flask, request, jsonify
import mysql.connector
app = Flask( name )
# Connect to MySQL
db = mysql.connector.connect(
host="localhost",
user="username",
password="password",
database="bloodbank"
)
cursor = db.cursor()
@app.route('/donors', methods=['GET'])
def get_donors():
cursor.execute("SELECT * FROM Donors")
donors = cursor.fetchall()
return jsonify(donors)
# Other routes for CRUD operations on donors, recipients, blood inventory, transactions,
etc.
if name == ' main ':
app.run(debug=True)
