import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Chip from "@material-ui/core/Chip";

function SidebarPlayer({ player }) {
  const chips = () => {
    return (
      <Fragment>
        {player.isOwner ? <Chip label="Game Owner" color="primary" /> : null}
        {player.isJudge ? <Chip label="Judge" color="secondary" /> : null}
        {player.status == "left" ? <Chip label="left" /> : null}
      </Fragment>
    );
  };

  const playerColor = () => {
    return player.status == "left" ? "error" : "initial";
  };

  return (
    <ListItem className="sidebar-item">
      <Fragment>
        <Typography color={playerColor()}>{player.userDisplayName}</Typography>
        {chips()}
      </Fragment>
    </ListItem>
  );
}

export default SidebarPlayer;
