import React, { useState, Fragment } from "react";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";

function Submissions({ round }) {
  return (
    <Fragment>
      <Grid container direction="row" alignItems="flex-start">
        {round.userRounds.map((userRound) => (
          <Grid item key={`user-round-${userRound.id}`}>
            <Card
              cardId={userRound.id}
              text={userRound.userCards.map((x) => x.text).join("/n/nAND/n/n")}
              cardType="white-card"
            />
          </Grid>
        ))}
      </Grid>
    </Fragment>
  );
}

export default Submissions;
