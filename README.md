

---

# Berea Tech App

The Berea Tech App is a web-based student portal designed to enhance the student experience at Berea Tech. This application allows students to register, log in, and access various resources, including student results, the Moodle platform, Berea news, lecture timetables, and more.

## Features

- **Student Registration**: New students can register by filling out a form with required details such as name, email, and password.
- **User Authentication**: Secure login with password hashing for enhanced security.
- **Personalized Welcome Page**: Displays the student's name, a banner image, and quick links to important resources.
- **Session Management**: Maintains user sessions for a seamless experience.
- **Logout Functionality**: Allows students to securely log out of their account.

## Technologies Used

- **Backend**: XAMPP (Apache, MySQL, PHP)
- **Frontend**: HTML, CSS, JavaScript
- **Framework**: Apache NetBeans for development
- **Database**: MySQL

## Getting Started

### Prerequisites

- [XAMPP](https://www.apachefriends.org/index.html) for local server setup.
- [Apache NetBeans](https://netbeans.apache.org/) for project development.
- Basic knowledge of HTML, CSS, JavaScript, and MySQL.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/tapiwakarumbidza/berea-tech-app.git
   ```
2. **Set Up the Database**:
   - Start MySQL in XAMPP.
   - Open `phpMyAdmin` and create a new database called `berea_portal`.
   - Import the SQL file  to set up tables for student registration and login.

3. **Configure the Project**:
   - Update the database configuration in the PHP files if necessary to match your setup.

4. **Run the Application**:
   - Start Apache and MySQL servers in XAMPP.
   - Open a web browser and go to `http://localhost/berea-tech-app` to access the application.



## Usage

1. Register as a new student by filling out the registration form.
2. Log in with your credentials to access the student portal.
3. Explore links to student resources, timetable, and other tools.
4. Use the logout button to securely exit your session.

## Contributing

If you’d like to contribute, please fork the repository and make a pull request. You can also open issues for any bugs or feature requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
