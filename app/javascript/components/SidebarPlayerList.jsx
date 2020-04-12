import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import GameLink from "./GameLink";
import SidebarPlayer from "./SidebarPlayer";

function SidebarPlayerList({ game }) {
  return (
    <div className="sidebar-player-list">
      <Fragment>
        <Typography variant="h4">Players ({game.players.length}):</Typography>
        {game.players.map((player, index) => (
          <Fragment key={`sidebar-player-${index}`}>
            <SidebarPlayer player={player} />
          </Fragment>
        ))}
        <ListItem className="sidebar-item">
          <GameLink name={game.name} />
        </ListItem>
      </Fragment>
    </div>
  );
}

export default SidebarPlayerList;
