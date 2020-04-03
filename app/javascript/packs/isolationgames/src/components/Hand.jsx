import React, { useState, Fragment } from "react";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";
import SubmitCardsButton from "./SubmitCardsButton";

function Hand({ hand, pick }) {
  const [selectedCards, setSelectedCards] = useState([]);

  function handleCardClick(card) {
    {
      selectedCards.includes(card)
        ? setSelectedCards(selectedCards.filter(x => x.id != card.id))
        : setSelectedCards(selectedCards => [...selectedCards, card]);
    }
  }

  return (
    <Fragment>
      <Grid container direction="column" alignItems="center">
        <Grid item>
          <SubmitCardsButton selectedCards={selectedCards} pick={pick} />
        </Grid>
      </Grid>
      <Grid container direction="row" alignItems="flex-start">
        {hand.map(card => (
          <Grid item key={`white-card-${card.id}`}>
            <Card
              cardId={card.id}
              text={card.text}
              cardType="white-card"
              onClick={() => handleCardClick(card)}
            />
          </Grid>
        ))}
      </Grid>
    </Fragment>
  );
}

export default Hand;
