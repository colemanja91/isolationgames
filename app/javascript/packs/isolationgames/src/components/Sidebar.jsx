import React, { Fragment } from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import ChangeDisplayName from "./ChangeDisplayName";
import LeaveGameButton from "./LeaveGameButton";
import SidebarPlayer from "./SidebarPlayer";
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
          <Typography>{displayName} </Typography>
        </ListItem>
        <ListItem className="sidebar-item">
          <ChangeDisplayName user={userData.user} />
        </ListItem>
        <ListItem className="sidebar-item">
          <Typography>
            Email: <i>{email}</i>
          </Typography>
        </ListItem>
        <ListItem className="sidebar-item">
          <LeaveGameButton />
        </ListItem>
        <Divider style={{ margin: "12px 0" }} />
        <Typography variant="h4">Players ({players.length}):</Typography>
        {players.map((player, index) => (
          <Fragment key={`sidebar-player-${index}`}>
            <SidebarPlayer player={player} />
          </Fragment>
        ))}
        <Divider style={{ margin: "12px 0" }} />
      </List>
    </div>
  );
}

export default Sidebar;
