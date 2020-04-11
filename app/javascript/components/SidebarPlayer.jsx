import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Chip from "@material-ui/core/Chip";
import Avatar from "@material-ui/core/Avatar";
import Slide from "@material-ui/core/Slide";
import Tooltip from "@material-ui/core/Tooltip";

function SidebarPlayer({ player }) {
  const wonRoundsChipText = () => {
    return player.wonRounds > 1
      ? `${player.wonRounds} wins`
      : `${player.wonRounds} win`;
  };

  const chips = () => {
    return (
      <div>
        {player.isOwner ? <Chip label="Game Owner" color="primary" /> : null}
        {player.isJudge ? <Chip label="Judge" color="secondary" /> : null}
        {player.hasPlayed ? <Chip label="Has played" color="default" /> : null}
        {player.wonRounds > 0 ? (
          <Chip label={wonRoundsChipText()} color="secondary" />
        ) : null}
        {player.status == "left" ? <Chip label="left" /> : null}
      </div>
    );
  };

  const playerColor = () => {
    return player.status == "left" ? "error" : "initial";
  };

  return (
    <Slide direction="right" in={true} timeout={250} mountOnEnter unmountOnExit>
      <ListItem className="sidebar-item">
        <div className="sidebar-player-item">
          <Tooltip title={player.userDisplayName}>
            <Avatar alt={player.userDisplayName} src={player.avatarUrl} />
          </Tooltip>
          {chips()}
        </div>
      </ListItem>
    </Slide>
  );
}

export default SidebarPlayer;
