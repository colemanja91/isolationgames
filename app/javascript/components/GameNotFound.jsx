import React from "react";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";

function GameNotFound() {
  return (
    <Grid
      container
      spacing={1}
      direction="column"
      justify="center"
      alignItems="center"
    >
      <Grid item xs={12}>
        <div className="game-not-found">
          <Typography variant="h3">
            Sorry. That game either doesn't exist or has already ended.
          </Typography>
        </div>
      </Grid>
    </Grid>
  );
}

export default GameNotFound;
