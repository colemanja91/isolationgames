import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Chip from "@material-ui/core/Chip";
//import "../../assets/stylesheets/components/SidebarPlayer.scss";

function SidebarPlayer({ player, index }) {
  return (
    <ListItem className="sidebar-item">
      {player.isOwner ? (
        <Fragment>
          <Typography>{player.userDisplayName}</Typography>
          <Chip label="Game Owner" />
        </Fragment>
      ) : (
        <Typography>
          {player.status == "left" ? (
            <i>{player.userDisplayName} (left)</i>
          ) : (
            player.userDisplayName
          )}
        </Typography>
      )}
    </ListItem>
  );
}

export default SidebarPlayer;
