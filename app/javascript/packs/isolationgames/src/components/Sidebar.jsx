import React, { Fragment } from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import ChangeDisplayName from "./ChangeDisplayName";
import EndGameButton from "./EndGameButton";
import GameLink from "./GameLink";
import LeaveGameButton from "./LeaveGameButton";
import SidebarPlayer from "./SidebarPlayer";
import StartGameButton from "./StartGameButton";
import "../../assets/stylesheets/components/Sidebar.scss";

function Sidebar({ gameData, userData }) {
  const {
    enoughPlayers,
    isOwner,
    name,
    players,
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
          <ChangeDisplayName user={userData.user} />
        </ListItem>
        <ListItem className="sidebar-item">
          <Typography>
            Email: <i>{email}</i>
          </Typography>
        </ListItem>
        <Divider style={{ margin: "12px 0" }} />
        <Typography variant="h4">Players ({players.length}):</Typography>
        {players.map((player, index) => (
          <Fragment key={`sidebar-player-${index}`}>
            <SidebarPlayer player={player} />
          </Fragment>
        ))}
        <ListItem className="sidebar-item">
          <GameLink name={name} />
        </ListItem>
        <Divider style={{ margin: "12px 0" }} />
        <ListItem className="sidebar-item">
          {isOwner && status == "created" && enoughPlayers ? (
            <StartGameButton />
          ) : null}
        </ListItem>
        <ListItem className="sidebar-item">
          <LeaveGameButton />
          {isOwner ? (
            <Fragment>
              <EndGameButton />
            </Fragment>
          ) : null}
        </ListItem>
      </List>
    </div>
  );
}

export default Sidebar;
