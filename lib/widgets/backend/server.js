const express = require('express');

const mysql = require('mysql');
const cors = require('cors');


const app = express();
app.use(cors());
app.use(express.json());

// MySQL connection setup
// const connection = mysql.createConnection({
//   host: '127.0.0.1',
//   user: 'root',
//   password: 'jerin1122',
//   database: 'student_database' // Use your actual database name
// });

// connection.connect((err) => {
//   if (err) throw err;
//   console.log('Connected to MySQL database');
// });

// Endpoint to add a new student
app.post('/addStudent', (req, res) => {
  const { registration_number, email, password, name } = req.body;

  // Query to insert student data into the database
  const insertQuery = 'INSERT INTO students (registration_number, email, password, name) VALUES (?, ?, ?, ?)';

  connection.query(insertQuery, [registration_number, email, password, name], (err, result) => {
    if (err) {
      console.error('Error inserting student:', err);
      res.status(500).json({ error: 'Error inserting student' });
    } else {
      console.log('Student inserted successfully');
      res.status(200).json({ message: 'Student inserted successfully' });
    }
  });
});

// Get student data and notices
app.get('/dashboard', (req, res) => {
  // Assuming the student is authenticated and the registration number is available in req.query.registrationNumber
  const registrationNumber = req.query.reg;


  
    console.log('Registration number received:', registrationNumber);

  // Query to get student data
  const studentQuery = `SELECT name, email, registration_number FROM students WHERE registration_number = ?`;

  // Query to get notices
  const noticeQuery = `SELECT title, description, created_at FROM notices`;



  connection.query(studentQuery, [registrationNumber], (err, studentResult) => {
    if (err) {
      console.error('Error fetching student data:', err);
      res.status(500).json({ error: 'Error fetching student data' });
    } else {
      if (studentResult.length > 0) {
        const studentData = studentResult[0];

        connection.query(noticeQuery, (err, noticeResult) => {
          if (err) {
            console.error('Error fetching notices:', err);
            res.status(500).json({ error: 'Error fetching notices' });
          } else {
            res.json({ userData: studentData, notices: noticeResult });
          }
        });
      } else {
        res.status(404).json({ error: 'Student not found' });
      }
    }
  });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});