import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import GameLink from "./GameLink";
import SidebarPlayer from "./SidebarPlayer";

function SidebarPlayerList({ players, name }) {
  return (
    <div className="sidebar-player-list">
      <Fragment>
        <Typography variant="h4">Players ({players.length}):</Typography>
        {players.map((player, index) => (
          <Fragment key={`sidebar-player-${index}`}>
            <SidebarPlayer player={player} />
          </Fragment>
        ))}
        <ListItem className="sidebar-item">
          <GameLink name={name} />
        </ListItem>
      </Fragment>
    </div>
  );
}

export default SidebarPlayerList;
