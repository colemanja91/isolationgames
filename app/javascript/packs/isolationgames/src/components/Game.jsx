import React from "react";
import Sidebar from "./Sidebar";

function Game({ data }) {
  const { isOwner, name, players, startedAt, status, videoLink } = data.game;
  return <Sidebar data={data} />;
}

export default Game;
