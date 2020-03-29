import React, { useState } from "react";
import Button from "@material-ui/core/Button";
import Tooltip, { TooltipProps } from "@material-ui/core/Tooltip";
import ClickAwayListener from "@material-ui/core/ClickAwayListener";
import copy from "clipboard-copy";

function GameLink({ name }) {
  const inviteLink = `${window.location.protocol}//${window.location.host}/join/${name}`;

  const [open, setOpen] = useState(false);

  const handleTooltipClose = () => {
    setOpen(false);
  };

  const handleTooltipOpen = () => {
    setOpen(true);
  };

  const handleButtonClick = () => {
    copy(inviteLink);
    handleTooltipOpen();
  };

  return (
    <ClickAwayListener onClickAway={handleTooltipClose}>
      <div>
        <Tooltip
          PopperProps={{
            disablePortal: true
          }}
          onClose={handleTooltipClose}
          open={open}
          disableFocusListener
          disableHoverListener
          disableTouchListener
          title="Link copied!"
        >
          <Button
            variant="outlined"
            color="primary"
            onClick={handleButtonClick}
          >
            Copy invite link
          </Button>
        </Tooltip>
      </div>
    </ClickAwayListener>
  );
}

export default GameLink;
