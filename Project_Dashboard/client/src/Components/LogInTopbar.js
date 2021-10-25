import { Navbar } from 'react-bootstrap';

function LogInTopbar() {
  return (
    <div>
      <Navbar bg="dark" variant="dark" sticky="top" expand="sm">
        <Navbar.Brand>
          <img
            alt="logo"
            className="logo_login"
            src={process.env.PUBLIC_URL + 'logo.png'}
          />
        </Navbar.Brand>
      </Navbar>
    </div>
  );
}
export default LogInTopbar;
