import React from "react";
import Grid from "@material-ui/core/Grid";
import CardScreen from "./CardScreen";
import Sidebar from "./Sidebar";

function Game({ game, user }) {
  return (
    <Grid container spacing={1} direction="row">
      <Grid item xs={3}>
        <Sidebar game={game} user={user} />
      </Grid>
      <Grid item xs={9}>
        {game.currentRound ? <CardScreen game={game} /> : null}
      </Grid>
    </Grid>
  );
}

export default Game;
