import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { START_GAME } from "./apollo";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogTitle from "@material-ui/core/DialogTitle";
import Tooltip from "@material-ui/core/Tooltip";

function StartGameButton({ enoughPlayers }) {
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
    },
    refetchQueries: ["Game"],
  });

  const submit = () => {
    startGame();
  };

  return (
    <div>
      <Tooltip title="Not enough players">
        <div>
          <Button
            variant="outlined"
            color="primary"
            onClick={handleClickOpen}
            disabled={!enoughPlayers}
          >
            Start Game
          </Button>
        </div>
      </Tooltip>
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
