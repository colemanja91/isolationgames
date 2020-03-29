import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { ADD_VIDEO_LINK } from "../../apollo";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

function AddVideoLinkButton({ videoLink }) {
  const [open, setOpen] = useState(false);
  const [newVideoLink, setNewVideoLink] = useState(videoLink);

  const buttonText = () => {
    return videoLink ? "Change" : "Add video chat link";
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleChange = e => {
    setNewVideoLink(e.target.value);
  };

  const [addVideoLink, { loading, error }] = useMutation(ADD_VIDEO_LINK, {
    onCompleted() {
      handleClose();
      window.location.reload(false);
    }
  });

  const submit = () => {
    addVideoLink({
      variables: { videoLink: newVideoLink }
    });
  };

  return (
    <div>
      <Button color="primary" onClick={handleClickOpen}>
        {buttonText()}
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="form-dialog-title"
      >
        <DialogTitle id="form-dialog-title">
          Add/Update video chat link
        </DialogTitle>
        <DialogContent>
          <DialogContentText>
            This game is a lot more enjoyable when you can see everyone's ugly
            faces.
          </DialogContentText>
          <TextField
            autoFocus
            defaultValue={videoLink}
            helperText="e.g. https://zoom.us/j/123456789"
            margin="dense"
            id="videoLink"
            label="Video Link"
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

export default AddVideoLinkButton;
