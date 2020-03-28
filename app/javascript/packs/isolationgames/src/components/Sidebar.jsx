import React from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import "../../assets/stylesheets/components/Sidebar.scss";

function Sidebar({ gameData, userData }) {
  const {
    isOwner,
    name,
    players,
    startedAt,
    status,
    videoLink
  } = gameData.game;
  const { displayName, email } = userData.user;

  return (
    <div className="sidebar">
      <List disablePadding dense>
        <Typography variant="h4">Playing as:</Typography>
        <ListItem className="sidebar-item">
          <Typography>
            {displayName} <i>Click here to change display name</i>
          </Typography>
        </ListItem>
        <ListItem className="sidebar-item">
          <Typography>
            Email: <i>{email}</i>
          </Typography>
        </ListItem>
        <Divider style={{ margin: "12px 0" }} />
      </List>
    </div>
  );
}

export default Sidebar;
