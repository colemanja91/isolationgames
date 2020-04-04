import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Chip from "@material-ui/core/Chip";
import Slide from "@material-ui/core/Slide";

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
          <Typography color={playerColor()}>
            {player.userDisplayName}
          </Typography>
          {chips()}
        </div>
      </ListItem>
    </Slide>
  );
}

export default SidebarPlayer;
