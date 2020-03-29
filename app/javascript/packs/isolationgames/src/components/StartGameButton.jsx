import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { START_GAME } from "../../apollo";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

function StartGameButton() {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const [startGame, { loading, error }] = useMutation(START_GAME, {
    onCompleted() {
      handleClose();
      window.location.reload(false);
    }
  });

  const submit = () => {
    startGame();
  };

  return (
    <div>
      <Button variant="outlined" color="primary" onClick={handleClickOpen}>
        Start Game
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">{"Start game?"}</DialogTitle>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Not yet.
          </Button>
          <Button onClick={submit} color="primary" autoFocus>
            Yes.
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default StartGameButton;
