import React, { Fragment, useState } from "react";
import { useMutation } from "react-apollo";
import { PICK_WINNER } from "../../apollo";
import Grid from "@material-ui/core/Grid";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Card from "./Card";

function SubmitWinnerButton({ winner }) {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const buttonDisabled = () => {
    return winner ? false : true;
  };

  const buttonText = () => {
    return winner ? "SUBMIT" : `PICK 1`;
  };

  const winnerText = () => {
    return winner
      ? winner.userCards.map((x) => x.text).join("<br><br>AND<br><br>")
      : null;
  };

  const [pickWinner, { loading, error }] = useMutation(PICK_WINNER, {
    onCompleted() {
      handleClose();
    },
    refetchQueries: ["Game"],
  });

  const submit = () => {
    pickWinner({
      variables: { userRoundId: winner.id },
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
          {"Pick Winner"}
        </DialogTitle>
        <DialogContent>
          <Fragment>
            <DialogContentText id="confirmation-dialog-description">
              Are you <i>sure</i> this is the winner?
            </DialogContentText>
            <Grid container direction="row" alignItems="flex-start">
              <Card text={winnerText()} cardType="white-card" />
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

export default SubmitWinnerButton;
