import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { UPDATE_USER_NAME } from "../../apollo";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import "../../assets/stylesheets/components/ChangeDisplayName.scss";

export default function ChangeDisplayName({ user }) {
  const [open, setOpen] = useState(false);
  const [name, setName] = useState(user.displayName);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleChange = e => {
    setName(e.target.value);
  };

  const [updateName, { loading, error }] = useMutation(UPDATE_USER_NAME, {
    onCompleted() {
      handleClose();
    },
    refetchQueries: ["Game", "User"]
  });

  const submit = () => {
    updateName({
      variables: { name }
    });
  };

  return (
    <div>
      <Button color="primary" onClick={handleClickOpen}>
        Change Name
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="form-dialog-title"
      >
        <DialogTitle id="form-dialog-title">Change display name</DialogTitle>
        <DialogContent>
          <DialogContentText>
            This is how other people will see you.
          </DialogContentText>
          <TextField
            autoFocus
            defaultValue={user.displayName}
            helperText={`Default: ${user.email}`}
            margin="dense"
            id="name"
            label="Display Name"
            onChange={handleChange}
            type="string"
            fullWidth
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Cancel
          </Button>
          <Button onClick={submit} color="primary">
            Save
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}
