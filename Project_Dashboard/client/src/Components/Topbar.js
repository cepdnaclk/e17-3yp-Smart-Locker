import React from 'react';
import { Nav, Navbar, NavDropdown } from 'react-bootstrap';
import { Link } from 'react-router-dom';

import '../Styles/styles.css';

function Topbar() {
  return (
    <Navbar bg="dark" variant="dark" sticky="top" expand="sm">
      <Navbar.Brand>
        <img
          alt="logo"
          className="logo"
          src={process.env.PUBLIC_URL + 'SmartLockerlogo.png'}
        />
      </Navbar.Brand>
      <Navbar.Toggle />
      <Navbar.Collapse>
        <Nav>
          <Nav.Link href="/home">Home</Nav.Link>
          <Nav.Link href="/users">Users</Nav.Link>
          <Nav.Link href="/lockers">Lockers</Nav.Link>
          <Nav.Link href="/locations">Location</Nav.Link>
          <NavDropdown title="Add New">
            <NavDropdown.Item href="/newuser">User</NavDropdown.Item>
            <NavDropdown.Item href="/newlocation">Location</NavDropdown.Item>
            <NavDropdown.Item href="/newlocker">Locker</NavDropdown.Item>
          </NavDropdown>
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
}

export default Topbar;
