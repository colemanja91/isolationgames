import React, { Fragment } from "react";
import Typography from "@material-ui/core/Typography";

function Instructions() {
  return (
    <Fragment>
      <Typography variant="subtitle1" align="center">
        Be horrible while being responsible
      </Typography>

      <Typography variant="subtitle1" align="center">
        Log in with Google
      </Typography>

      <Typography variant="subtitle1" align="center">
        Click "New Game"
      </Typography>

      <Typography variant="subtitle1" align="center">
        Copy the invite link and send it to friends
      </Typography>

      <Typography variant="subtitle1" align="center">
        Once you have at least 4 people, start playing!
      </Typography>
    </Fragment>
  );
}

export default Instructions;
