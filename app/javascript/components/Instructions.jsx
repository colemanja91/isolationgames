import React from "react";
import Typography from "@material-ui/core/Typography";

function Instructions() {
  return (
    <ul>
      <li>
        <Typography variant="subtitle1" align="center">
          Be horrible while being responsible
        </Typography>
      </li>
      <li>
        <Typography variant="subtitle1" align="center">
          Log in with Google
        </Typography>
      </li>
      <li>
        <Typography variant="subtitle1" align="center">
          Click "New Game"
        </Typography>
      </li>
      <li>
        <Typography variant="subtitle1" align="center">
          Copy the invite link and send it to friends
        </Typography>
      </li>
      <li>
        <Typography variant="subtitle1" align="center">
          Once you have at least 4 people, start playing!
        </Typography>
      </li>
    </ul>
  );
}

export default Instructions;
