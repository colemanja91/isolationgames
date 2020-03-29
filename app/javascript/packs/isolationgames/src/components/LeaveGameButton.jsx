import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { LEAVE_GAME } from "../../apollo";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

function LeaveGameButton() {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const [leaveGame, { loading, error }] = useMutation(LEAVE_GAME, {
    onCompleted() {
      handleClose();
      window.location.reload(false);
    }
  });

  const submit = () => {
    leaveGame();
  };

  return (
    <div>
      <Button variant="outlined" color="secondary" onClick={handleClickOpen}>
        Leave Game
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">{"Leave game?"}</DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            If you leave the game and there are no longer enough players, the
            game will end.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Nevermind
          </Button>
          <Button onClick={submit} color="primary" autoFocus>
            Yes, leave
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default LeaveGameButton;
