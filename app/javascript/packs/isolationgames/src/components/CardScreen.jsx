import React from "react";
import Grid from "@material-ui/core/Grid";
import Divider from "@material-ui/core/Divider";
import Typography from "@material-ui/core/Typography";
import Card from "./Card";
import Hand from "./Hand";

function CardScreen({ game }) {
  return (
    <Grid container direction="column" alignItems="center">
      <Grid item>
        <Card text={game.currentRound.blackCard.text} cardType="black-card" />
      </Grid>
      <Grid item>
        <Typography variant="h5">
          Pick {game.currentRound.blackCard.pick}
        </Typography>
      </Grid>
      <Divider style={{ margin: "12px 0" }} />
      <Grid item>
        {game.currentRound.status == "started" && !game.currentRound.isJudge ? (
          <Hand hand={game.hand} />
        ) : null}
      </Grid>
    </Grid>
  );
}

export default CardScreen;
