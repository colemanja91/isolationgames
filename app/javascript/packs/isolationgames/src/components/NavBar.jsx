import React from "react";
import { Link as RouterLink } from "react-router-dom";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Link from "@material-ui/core/Link";
import Typography from "@material-ui/core/Typography";
import "../../assets/stylesheets/components/NavBar.scss";

function NavBar() {
  return (
    <AppBar position="static">
      <Toolbar className="toolbar">
        <Typography variant="h4" className="title">
          <Link component={RouterLink} to="/" color="textPrimary">
            Isolation Games
          </Link>
        </Typography>
        <Typography variant="h6" className="title">
          <Link component={RouterLink} to="/" color="textPrimary">
            Game
          </Link>
        </Typography>
        <Typography variant="h6" className="title">
          <Link component={RouterLink} to="/how-to-play" color="textPrimary">
            How to play
          </Link>
        </Typography>
        <Typography variant="h6" className="title">
          <Link component={RouterLink} to="/about" color="textPrimary">
            About
          </Link>
        </Typography>
      </Toolbar>
    </AppBar>
  );
}

export default NavBar;
