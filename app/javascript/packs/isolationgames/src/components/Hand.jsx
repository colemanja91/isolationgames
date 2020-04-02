import React, { useState, Fragment } from "react";
import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";

function Hand({ hand, pick }) {
  const [selectedCards, setSelectedCards] = useState([]);

  function doSomething(cardId) {
    {
      selectedCards.includes(cardId)
        ? setSelectedCards(selectedCards.filter(x => x != cardId))
        : setSelectedCards(selectedCards => [...selectedCards, cardId]);
    }
    console.log(selectedCards);
  }

  const buttonDisabled = () => {
    return selectedCards.length == pick ? false : true;
  };

  const buttonText = () => {
    return selectedCards.length == pick
      ? "SUBMIT"
      : `PICK (${pick - selectedCards.length} REMAINING)`;
  };

  return (
    <Fragment>
      <Grid container direction="column" alignItems="center">
        <Grid item>
          <Button
            variant="outlined"
            color="primary"
            disabled={buttonDisabled()}
          >
            {buttonText()}
          </Button>
        </Grid>
      </Grid>
      <Grid container direction="row" alignItems="flex-start">
        {hand.map(card => (
          <Grid item key={`white-card-${card.id}`}>
            <Card
              cardId={card.id}
              text={card.text}
              cardType="white-card"
              onClick={() => doSomething(card.id)}
            />
          </Grid>
        ))}
      </Grid>
    </Fragment>
  );
}

export default Hand;
