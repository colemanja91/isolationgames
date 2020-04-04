import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import EndGameButton from "./EndGameButton";
import LeaveGameButton from "./LeaveGameButton";
import StartGameButton from "./StartGameButton";

function SidebarActions({ isOwner, status, enoughPlayers }) {
  return (
    <div className="sidebar-actions">
      <ListItem className="sidebar-item">
        {isOwner && status == "created" ? (
          <StartGameButton enoughPlayers={enoughPlayers} />
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
    </div>
  );
}

export default SidebarActions;
