import React, { Fragment, useState } from "react";
import { useMutation } from "react-apollo";
import { PLAY_CARDS } from "./apollo";
import Grid from "@material-ui/core/Grid";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Card from "./Card";

function SubmitCardsButton({ selectedCards, pick }) {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const buttonDisabled = () => {
    return selectedCards.length == pick ? false : true;
  };

  const buttonText = () => {
    return selectedCards.length == pick
      ? "SUBMIT"
      : `PICK (${pick - selectedCards.length} REMAINING)`;
  };

  const confirmationText = () => {
    return selectedCards.length == 1
      ? "Are you sure you want to submit this card?"
      : "Are you sure you want to submit these cards?";
  };

  const [playCards, { loading, error }] = useMutation(PLAY_CARDS, {
    onCompleted() {
      handleClose();
    },
    refetchQueries: ["Game"],
  });

  const submit = () => {
    playCards({
      variables: { userCardIds: selectedCards.map((x) => x.id) },
    });
  };

  return (
    <div>
      <Button
        variant="outlined"
        color="primary"
        disabled={buttonDisabled()}
        onClick={handleClickOpen}
      >
        {buttonText()}
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="confirmation-dialog-title"
        aria-describedby="confirmation-dialog-description"
      >
        <DialogTitle id="confirmation-dialog-title">
          {"Submit cards"}
        </DialogTitle>
        <DialogContent>
          <Fragment>
            <DialogContentText id="confirmation-dialog-description">
              {confirmationText()}
            </DialogContentText>
            <Grid container direction="row" alignItems="flex-start">
              {selectedCards.map((card) => (
                <Grid item key={`white-card-confirmation-${card.id}`}>
                  <Card
                    cardId={card.id}
                    text={card.text}
                    cardType="white-card"
                  />
                </Grid>
              ))}
            </Grid>
          </Fragment>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Nevermind
          </Button>
          <Button color="primary" autoFocus onClick={submit}>
            Yes!
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default SubmitCardsButton;
