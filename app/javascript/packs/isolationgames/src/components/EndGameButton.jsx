import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { END_GAME } from "../../apollo";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

function EndGameButton() {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const [endGame, { loading, error }] = useMutation(END_GAME, {
    onCompleted() {
      handleClose();
      window.location.reload(false);
    }
  });

  const submit = () => {
    endGame();
  };

  return (
    <div>
      <Button variant="outlined" color="primary" onClick={handleClickOpen}>
        End Game
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">{"End game?"}</DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            Okay then...
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Nevermind
          </Button>
          <Button onClick={submit} color="primary" autoFocus>
            Yes, end it.
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default EndGameButton;
