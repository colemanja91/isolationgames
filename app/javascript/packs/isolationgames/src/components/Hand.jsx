import React from "react";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";

function Hand({ hand }) {
  return (
    <Grid container direction="row" alignItems="left">
      {hand.map(card => (
        <Grid item>
          <Card cardId={card.id} text={card.text} cardType="white-card" />
        </Grid>
      ))}
    </Grid>
  );
}

export default Hand;
