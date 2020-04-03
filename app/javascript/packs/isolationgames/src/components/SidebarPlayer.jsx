import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Chip from "@material-ui/core/Chip";

function SidebarPlayer({ player }) {
  const chips = () => {
    return (
      <div>
        {player.isOwner ? <Chip label="Game Owner" color="primary" /> : null}
        {player.isJudge ? <Chip label="Judge" color="secondary" /> : null}
        {player.hasPlayed ? <Chip label="Has played" color="default" /> : null}
        {player.status == "left" ? <Chip label="left" /> : null}
      </div>
    );
  };

  const playerColor = () => {
    return player.status == "left" ? "error" : "initial";
  };

  return (
    <ListItem className="sidebar-item">
      <div className="sidebar-player-item">
        <Typography color={playerColor()}>{player.userDisplayName}</Typography>
        {chips()}
      </div>
    </ListItem>
  );
}

export default SidebarPlayer;
