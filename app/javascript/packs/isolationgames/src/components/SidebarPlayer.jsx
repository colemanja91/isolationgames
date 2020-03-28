import React from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Badge from "@material-ui/core/Badge";
//import "../../assets/stylesheets/components/SidebarPlayer.scss";

function SidebarPlayer({ player, index }) {
  return (
    <ListItem className="sidebar-item">
      {player.isOwner ? (
        <Badge badgeContent="GAME OWNER" color="primary">
          <Typography>{player.userDisplayName}</Typography>
        </Badge>
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
