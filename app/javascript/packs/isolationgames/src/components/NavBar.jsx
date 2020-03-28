import React from "react";
import { Link } from "react-router-dom";
import { Nav, Navbar, NavItem } from "react-bootstrap";
import "../../assets/stylesheets/components/NavBar.scss";

function NavBar() {
  return (
    <Navbar bg="light" expand="lg">
      <Navbar.Brand>
        <Link to="/">Isolation Games</Link>
      </Navbar.Brand>
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav">
        <Nav fill variant="pills" className="mr-auto" defaultActiveKey="/">
          <NavItem href="/">
            <Nav.Link as={Link} to="/" eventKey="/">
              Game
            </Nav.Link>
          </NavItem>
          <NavItem href="/how-to-play">
            <Nav.Link as={Link} to="/how-to-play" eventKey="how-to-play">
              How to play
            </Nav.Link>
          </NavItem>
          <NavItem href="/about">
            <Nav.Link as={Link} to="/about" eventKey="about">
              About
            </Nav.Link>
          </NavItem>
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
}

export default NavBar;
