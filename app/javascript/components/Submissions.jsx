import React, { useState, Fragment } from "react";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";
import StartNewRoundButton from "./StartNewRoundButton";
import SubmitWinnerButton from "./SubmitWinnerButton";

function Submissions({ round }) {
  const [winner, setWinner] = useState();

  const cardsDisabled = () => {
    return round.winner || !round.isJudge ? true : false;
  };

  function handleCardClick(userRound) {
    {
      winner
        ? userRound == winner
          ? setWinner(null)
          : null
        : setWinner(userRound);
    }
  }

  return (
    <Fragment>
      <Grid container direction="column" alignItems="center">
        {round.winner && round.isJudge ? (
          <Grid item>
            <StartNewRoundButton />
          </Grid>
        ) : round.isJudge ? (
          <Grid item>
            <SubmitWinnerButton winner={winner} />
          </Grid>
        ) : null}
      </Grid>
      <Grid container direction="row" alignItems="flex-start">
        {round.userRounds.map((userRound) => (
          <Grid item key={`user-round-${userRound.id}`}>
            <Card
              text={userRound.userCards
                .map((x) => x.text)
                .join("<br><br>AND<br><br>")}
              isWinner={userRound.winner}
              cardType="white-card"
              onClick={() => handleCardClick(userRound)}
              disabled={cardsDisabled()}
              isWinner={userRound.winner}
            />
          </Grid>
        ))}
      </Grid>
    </Fragment>
  );
}

export default Submissions;
